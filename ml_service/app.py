import json
import os
from typing import Dict, List, Optional

import joblib
import numpy as np
import pandas as pd
import shap
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field


ARTIFACT_DIR = os.environ.get("ARTIFACT_DIR", "/workspace/ml_service/artifacts")
MODEL_PATH = os.path.join(ARTIFACT_DIR, "model_xgb.joblib")
LABEL_ENCODER_PATH = os.path.join(ARTIFACT_DIR, "label_encoder.joblib")
FEATURE_COLS_PATH = os.path.join(ARTIFACT_DIR, "feature_cols.json")
PREPROCESSING_META_PATH = os.path.join(ARTIFACT_DIR, "preprocessing.json")


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


class PredictRequest(BaseModel):
    N: Optional[float] = None
    P: Optional[float] = None
    K: Optional[float] = None
    temperature: Optional[float] = None
    humidity: Optional[float] = None
    ph: Optional[float] = None
    rainfall: Optional[float] = None
    season: Optional[str] = None
    previous_crop: Optional[str] = None
    irrigation: Optional[str] = None
    top_k: int = Field(default=3, ge=1, le=10)


app = FastAPI(title="AgriMitra AI - Crop Recommendation Service")


def _load_artifacts():
    if not os.path.exists(MODEL_PATH):
        raise RuntimeError("Model artifact not found. Train the model first.")
    model = joblib.load(MODEL_PATH)
    label_encoder = joblib.load(LABEL_ENCODER_PATH)
    with open(FEATURE_COLS_PATH, "r", encoding="utf-8") as f:
        feature_cols = json.load(f)
    with open(PREPROCESSING_META_PATH, "r", encoding="utf-8") as f:
        preprocessing_meta = json.load(f)
    return model, label_encoder, feature_cols, preprocessing_meta


model, label_encoder, feature_cols, preprocessing_meta = _load_artifacts()


def fill_numeric_defaults(df: pd.DataFrame) -> pd.DataFrame:
    defaults: Dict[str, float] = preprocessing_meta["numeric_defaults"]
    for col in NUMERIC_COLUMNS:
        if col in df.columns:
            df[col] = pd.to_numeric(df[col], errors="coerce").fillna(defaults[col])
        else:
            df[col] = defaults[col]
    return df


def feature_engineer(df: pd.DataFrame) -> pd.DataFrame:
    for col in NUMERIC_COLUMNS:
        if col not in df.columns:
            df[col] = 0.0
    df["npk_sum"] = df["N"] + df["P"] + df["K"]
    with np.errstate(divide="ignore", invalid="ignore"):
        df["npk_ratio_N"] = np.where(df["npk_sum"] > 0, df["N"] / df["npk_sum"], 0.0)
    return df


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


def align_feature_columns(df: pd.DataFrame, columns: List[str]) -> pd.DataFrame:
    for col in columns:
        if col not in df.columns:
            df[col] = 0.0
    df = df[columns]
    return df


def explain_with_shap(model, X: pd.DataFrame, top_indices: List[int]) -> Dict[str, float]:
    try:
        explainer = shap.TreeExplainer(model)
        shap_values = explainer.shap_values(X)
        # shap_values for multi-class can be list per class
        if isinstance(shap_values, list):
            # Aggregate absolute shap values for predicted classes
            class_shap = np.mean([np.abs(shap_values[i]) for i in top_indices], axis=0)
        else:
            class_shap = np.abs(shap_values)
        # Mean absolute contribution per feature
        mean_abs = class_shap.mean(axis=0)
        top_feat_idx = np.argsort(mean_abs)[-3:][::-1]
        return {X.columns[i]: float(mean_abs[i]) for i in top_feat_idx}
    except Exception:
        return {}


@app.post("/predict")
def predict(req: PredictRequest):
    try:
        data = {k: getattr(req, k) for k in NUMERIC_COLUMNS + CATEGORICAL_COLUMNS}
        df = pd.DataFrame([data])
        df = fill_numeric_defaults(df)
        df = feature_engineer(df)
        df = one_hot_apply(df, preprocessing_meta["categorical_categories"]) 
        X = align_feature_columns(df, feature_cols)

        proba = model.predict_proba(X.values)
        top_k = min(req.top_k, proba.shape[1])
        top_idx = np.argsort(proba[0])[::-1][:top_k]
        labels = label_encoder.inverse_transform(top_idx)
        probs = [float(proba[0][i]) for i in top_idx]

        shap_feat = explain_with_shap(model, X, top_idx.tolist())
        rationale = ", ".join([f"{k} influenced" for k in list(shap_feat.keys())[:3]])

        return {
            "recommendations": [
                {"label": l, "probability": p} for l, p in zip(labels, probs)
            ],
            "rationale": rationale,
            "top_features": shap_feat,
        }
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))


@app.get("/health")
def health():
    return {"status": "ok"}

