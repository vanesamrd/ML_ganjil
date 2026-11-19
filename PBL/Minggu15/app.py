import numpy as np
import tensorflow as tf
import pickle
from flask import Flask, request, jsonify

app = Flask(__name__)
model = tf.keras.models.load_model('model_pbl.h5')
with open('scaler_pbl.pkl', 'rb') as f:
    scaler = pickle.load(f)

@app.route('/predict', methods=['POST'])
def predict():
    data = request.json
    X = np.array([[data['NetSales'], data['TotalAmount']]])
    X_scaled = scaler.transform(X)
    pred = model.predict(X_scaled)[0][0]
    return jsonify({'loyalty_prob': float(pred)})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=7860)
