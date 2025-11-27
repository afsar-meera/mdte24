from fastapi import FastAPI
from pydantic import BaseModel
import pickle
import numpy as np


with open("model.pkl", "rb") as f:
    model = pickle.load(f)


app = FastAPI(title = "iris_prediction")


class IrisInput(BaseModel):
    features: list

@app.post("/predict")
def predict(data: IrisInput):
    X_input = np.array(data.features).reshape(1, -1)
    prediction = model.predict(X_input)
    return {"prediction": int(prediction[0])}