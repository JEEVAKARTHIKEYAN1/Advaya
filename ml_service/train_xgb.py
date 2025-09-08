import argparse
import json
import os
from dataclasses import dataclass
from typing import Dict, List, Tuple

import joblib
import numpy as np
import pandas as pd
from sklearn.metrics import accuracy_score, top_k_accuracy_score
from sklearn.model_selection import StratifiedKFold
from sklearn.preprocessing import LabelEncoder
from xgboost import XGBClassifier


RANDOM_SEED = 42


NUMERIC_COLUMNS = [
    "N",
    "P",
    "K",
    "temperature",
    "humidity",
    "ph",
    "rainfall",
]

CATEGORICAL_COLUMNS = [
    "season",
    "previous_crop",
    "irrigation",
]

TARGET_COLUMN = "label"


@dataclass
class TrainArtifacts:
    model_path: str
    label_encoder_path: str
    feature_cols_path: str
    preprocessing_meta_path: str
    onnx_path: str | None


def load_dataset(csv_path: str) -> pd.DataFrame:
    df = pd.read_csv(csv_path)
    if TARGET_COLUMN not in df.columns:
        raise ValueError(f"Dataset must contain target column '{TARGET_COLUMN}'")
    return df


def fill_numeric_defaults(df: pd.DataFrame) -> pd.DataFrame:
    defaults = {
        "N": 0.0,
        "P": 0.0,
        "K": 0.0,
        "temperature": 25.0,
        "humidity": 60.0,
        "ph": 6.5,
        "rainfall": 100.0,
    }
    for col in NUMERIC_COLUMNS:
        if col in df.columns:
            df[col] = pd.to_numeric(df[col], errors="coerce")
            df[col] = df[col].fillna(defaults[col])
        else:
            df[col] = defaults[col]
    return df


def feature_engineer(df: pd.DataFrame) -> pd.DataFrame:
    # Ensure numeric columns exist
    for col in NUMERIC_COLUMNS:
        if col not in df.columns:
            df[col] = 0.0

    # NPK features
    df["npk_sum"] = df["N"] + df["P"] + df["K"]
    with np.errstate(divide="ignore", invalid="ignore"):
        df["npk_ratio_N"] = np.where(df["npk_sum"] > 0, df["N"] / df["npk_sum"], 0.0)
    return df


def one_hot_fit(df: pd.DataFrame) -> Tuple[pd.DataFrame, Dict[str, List[str]]]:
    categories: Dict[str, List[str]] = {}
    for col in CATEGORICAL_COLUMNS:
        if col not in df.columns:
            df[col] = "unknown"
        df[col] = df[col].astype(str).fillna("unknown")
        cats = sorted(df[col].unique().tolist())
        categories[col] = cats
    df_ohe = one_hot_apply(df, categories)
    return df_ohe, categories


def one_hot_apply(df: pd.DataFrame, categories: Dict[str, List[str]]) -> pd.DataFrame:
    df = df.copy()
    for col, cats in categories.items():
        if col not in df.columns:
            df[col] = "unknown"
        df[col] = df[col].astype(str).fillna("unknown")
        for cat in cats:
            new_col = f"{col}__{cat}"
            df[new_col] = (df[col] == cat).astype(float)
    df.drop(columns=[c for c in CATEGORICAL_COLUMNS if c in df.columns], inplace=True)
    return df


def align_feature_columns(df: pd.DataFrame, feature_cols: List[str]) -> pd.DataFrame:
    # Add missing columns
    for col in feature_cols:
        if col not in df.columns:
            df[col] = 0.0
    # Drop extra columns
    df = df[feature_cols]
    return df


def compute_metrics(y_true: np.ndarray, proba: np.ndarray, le: LabelEncoder) -> Dict[str, float]:
    y_pred = proba.argmax(axis=1)
    y_pred_labels = le.inverse_transform(y_pred)
    y_true_labels = le.inverse_transform(y_true)
    top1 = accuracy_score(y_true_labels, y_pred_labels)
    # For top-3, map to indices directly on encoded labels
    top3 = top_k_accuracy_score(y_true, proba, k=min(3, proba.shape[1]))
    return {"top1": float(top1), "top3": float(top3)}


def train_and_evaluate(df: pd.DataFrame, output_dir: str, export_onnx: bool) -> TrainArtifacts:
    os.makedirs(output_dir, exist_ok=True)

    # Fill missing numeric and feature engineer
    df = fill_numeric_defaults(df)
    df = feature_engineer(df)

    # One-hot fit on full data to lock categories for deployment
    df_ohe, categories = one_hot_fit(df)

    # Prepare X, y
    y_raw = df_ohe[TARGET_COLUMN].astype(str).values
    X = df_ohe.drop(columns=[TARGET_COLUMN])

    label_encoder = LabelEncoder()
    y = label_encoder.fit_transform(y_raw)

    feature_cols = list(X.columns)

    # Cross-validation
    skf = StratifiedKFold(n_splits=5, shuffle=True, random_state=RANDOM_SEED)
    fold_metrics: List[Dict[str, float]] = []
    fold_models: List[XGBClassifier] = []

    for train_idx, valid_idx in skf.split(X, y):
        X_train, X_valid = X.iloc[train_idx], X.iloc[valid_idx]
        y_train, y_valid = y[train_idx], y[valid_idx]

        model = XGBClassifier(
            n_estimators=300,
            max_depth=6,
            learning_rate=0.1,
            subsample=0.9,
            colsample_bytree=0.9,
            random_state=RANDOM_SEED,
            objective="multi:softprob",
            tree_method="hist",
            reg_lambda=1.0,
            reg_alpha=0.0,
            n_jobs=0,
        )

        model.fit(
            X_train,
            y_train,
            eval_set=[(X_valid, y_valid)],
            verbose=False,
        )

        proba_valid = model.predict_proba(X_valid)
        metrics = compute_metrics(y_valid, proba_valid, label_encoder)
        fold_metrics.append(metrics)
        fold_models.append(model)

    # Select best model by top1, then top3
    best_idx = max(range(len(fold_models)), key=lambda i: (fold_metrics[i]["top1"], fold_metrics[i]["top3"]))
    best_model = fold_models[best_idx]

    # Save artifacts
    model_path = os.path.join(output_dir, "model_xgb.joblib")
    le_path = os.path.join(output_dir, "label_encoder.joblib")
    feature_cols_path = os.path.join(output_dir, "feature_cols.json")
    preprocessing_meta_path = os.path.join(output_dir, "preprocessing.json")
    onnx_path = None

    joblib.dump(best_model, model_path)
    joblib.dump(label_encoder, le_path)

    with open(feature_cols_path, "w", encoding="utf-8") as f:
        json.dump(feature_cols, f)

    preprocessing_meta = {
        "numeric_defaults": {
            "N": 0.0,
            "P": 0.0,
            "K": 0.0,
            "temperature": 25.0,
            "humidity": 60.0,
            "ph": 6.5,
            "rainfall": 100.0,
        },
        "categorical_categories": categories,
        "features_engineered": ["npk_sum", "npk_ratio_N"],
    }
    with open(preprocessing_meta_path, "w", encoding="utf-8") as f:
        json.dump(preprocessing_meta, f, indent=2)

    if export_onnx:
        try:
            import onnxmltools  # type: ignore
            from onnxmltools.convert.common.data_types import FloatTensorType  # type: ignore
            from onnxmltools.convert import convert_xgboost  # type: ignore

            initial_type = [("float_input", FloatTensorType([None, len(feature_cols)]))]
            onnx_model = convert_xgboost(best_model, initial_types=initial_type)
            onnx_path = os.path.join(output_dir, "model_xgb.onnx")
            onnxmltools.utils.save_model(onnx_model, onnx_path)
        except Exception as e:  # pragma: no cover
            print(f"ONNX export failed: {e}")

    # Report CV metrics
    mean_top1 = float(np.mean([m["top1"] for m in fold_metrics]))
    mean_top3 = float(np.mean([m["top3"] for m in fold_metrics]))
    print(json.dumps({"cv_mean_top1": mean_top1, "cv_mean_top3": mean_top3}, indent=2))

    return TrainArtifacts(
        model_path=model_path,
        label_encoder_path=le_path,
        feature_cols_path=feature_cols_path,
        preprocessing_meta_path=preprocessing_meta_path,
        onnx_path=onnx_path,
    )


def main():
    parser = argparse.ArgumentParser(description="Train XGBoost crop recommendation model")
    parser.add_argument("--data", type=str, default="/workspace/data/sample_crops.csv", help="Path to CSV dataset")
    parser.add_argument("--out", type=str, default="/workspace/ml_service/artifacts", help="Output directory for artifacts")
    parser.add_argument("--export-onnx", action="store_true", help="Export ONNX model as well")
    args = parser.parse_args()

    df = load_dataset(args.data)
    artifacts = train_and_evaluate(df, args.out, args.export_onnx)
    print("Artifacts saved:")
    print(json.dumps(artifacts.__dict__, indent=2))


if __name__ == "__main__":
    main()

