import pickle
from pathlib import Path

import cv2
import numpy as np
import streamlit as st
import tensorflow as tf
from skimage.feature import hog

BASE_DIR = Path(__file__).resolve().parent


@st.cache_resource
def load_assets():
    model = tf.keras.models.load_model(BASE_DIR / "day_night_model.h5", compile=False)
    with open(BASE_DIR / "scaler.pkl", "rb") as f:
        scaler = pickle.load(f)
    return model, scaler


model, scaler = load_assets()


def preprocess(image_bytes):
    nparr = np.frombuffer(image_bytes, np.uint8)
    img = cv2.imdecode(nparr, cv2.IMREAD_COLOR)

    resized = cv2.resize(img, (256, 256))
    gray = cv2.cvtColor(resized, cv2.COLOR_BGR2GRAY)

    features = hog(gray, orientations=9, pixels_per_cell=(8, 8),
                   cells_per_block=(2, 2), block_norm='L2-Hys',
                   visualize=False, feature_vector=True)

    return img, scaler.transform(features.reshape(1, -1))


st.set_page_config(page_title="Day vs Night Classifier", layout="centered")
st.title("Day vs Night Classifier")
st.write("Klasifikasi gambar **siang (day)** vs **malam (night)** menggunakan HOG + Neural Network.")

uploaded = st.file_uploader("Upload gambar", type=["jpg", "jpeg", "png"])

if uploaded is not None:
    data = uploaded.read()
    img, X = preprocess(data)

    st.image(cv2.cvtColor(img, cv2.COLOR_BGR2RGB), caption=uploaded.name, use_container_width=True)

    prob = float(model.predict(X, verbose=0)[0][0])
    label = "Day (Siang)" if prob > 0.5 else "Night (Malam)"

    st.success(f"Hasil: {label}")
    st.metric("Probabilitas Day", f"{prob:.2%}")
