import os
import json
import pandas as pd
from ml_service.train_xgb import fill_numeric_defaults, feature_engineer, one_hot_fit


def test_fill_and_features():
    df = pd.DataFrame([
        {"N": None, "P": 10, "K": 5, "temperature": None, "humidity": 55, "ph": 6.2, "rainfall": None,
         "season": "winter", "previous_crop": "rice", "irrigation": "canal", "label": "wheat"}
    ])
    df = fill_numeric_defaults(df)
    assert df["N"].iloc[0] == 0.0
    assert df["temperature"].iloc[0] == 25.0
    assert df["rainfall"].iloc[0] == 100.0

    df = feature_engineer(df)
    assert "npk_sum" in df.columns
    assert "npk_ratio_N" in df.columns

    df_ohe, cats = one_hot_fit(df)
    assert any(c.startswith("season__") for c in df_ohe.columns)
    assert set(["season", "previous_crop", "irrigation"]).isdisjoint(set(df_ohe.columns))

