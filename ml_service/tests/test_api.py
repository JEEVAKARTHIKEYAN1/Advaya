import os
import tempfile
import pandas as pd
from fastapi.testclient import TestClient


def build_artifacts(tmpdir):
    from ml_service.train_xgb import load_dataset, train_and_evaluate
    df = load_dataset("/workspace/data/sample_crops.csv")
    train_and_evaluate(df, tmpdir, export_onnx=False)


def test_predict_endpoint():
    with tempfile.TemporaryDirectory() as d:
        os.environ["ARTIFACT_DIR"] = d
        build_artifacts(d)
        from ml_service.app import app  # import after setting artifacts
        client = TestClient(app)
        payload = {
            "N": 40,
            "P": 20,
            "K": 20,
            "temperature": 26,
            "humidity": 65,
            "ph": 6.5,
            "rainfall": 120,
            "season": "monsoon",
            "previous_crop": "wheat",
            "irrigation": "canal",
            "top_k": 3
        }
        r = client.post("/predict", json=payload)
        assert r.status_code == 200
        data = r.json()
        assert "recommendations" in data and len(data["recommendations"]) >= 1

