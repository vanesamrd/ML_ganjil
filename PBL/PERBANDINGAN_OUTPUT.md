# Perbandingan Output dengan Repo Pembanding (PBL)

Notebook di folder ini adalah salinan persis dari `MNawfal24/MachineLearning` folder `PBL`, lalu dijalankan ulang memakai `datasetPBL/Transactions.csv` yang sama (MD5 identik dengan `data/Transactions.csv`).

Status **BEDA** berarti output tersimpan di repo pembanding tidak dapat direproduksi persis; output di notebook ini adalah hasil run yang benar-benar dihasilkan dataset saat ini. Perbedaan bisa berupa format/library (pandas 3, TensorFlow 2.21), randomness (inisialisasi ANN, waktu eksekusi), atau angka metrik yang memang berasal dari snapshot dataset lama.

| Notebook | Status |
|---|---|
| `Minggu1/MNawfalMA_Minggu1_P1.ipynb` | BEDA |
| `Minggu1/MNawfalMA_Minggu1_P2.ipynb` | SAMA |
| `Minggu2/MNawfalMA_Minggu2_P1.ipynb` | BEDA |
| `Minggu2/MNawfalMA_Minggu2_P2.ipynb` | BEDA |
| `Minggu2/MNawfalMA_Minggu2_P3.ipynb` | SAMA |
| `Minggu3/MNawfalMA_Minggu3_P1.ipynb` | BEDA |
| `Minggu3/MNawfalMA_Minggu3_P2.ipynb` | SAMA |
| `Minggu3/MNawfalMA_Minggu3_P3.ipynb` | SAMA |
| `Minggu4/MNawfalMA_Minggu4_P1.ipynb` | SAMA |
| `Minggu4/MNawfalMA_Minggu4_P2.ipynb` | SAMA |
| `Minggu5/MNawfalMA_Minggu5_P1.ipynb` | SAMA |
| `Minggu5/MNawfalMA_Minggu5_P2.ipynb` | SAMA |
| `Minggu6/MNawfalMA_Minggu6_P1.ipynb` | BEDA |
| `Minggu6/MNawfalMA_Minggu6_P2.ipynb` | BEDA |
| `Minggu6/MNawfalMA_Minggu6_P3.ipynb` | BEDA |
| `Minggu9/MNawfalMA_Minggu9_P1.ipynb` | BEDA |
| `Minggu9/MNawfalMA_Minggu9_P2.ipynb` | BEDA |
| `Minggu9/MNawfalMA_Minggu9_P3.ipynb` | BEDA |
| `Minggu11/MNawfalMA_Minggu11_P1.ipynb` | BEDA |
| `Minggu11/MNawfalMA_Minggu11_P2.ipynb` | BEDA |
| `Minggu11/MNawfalMA_Minggu11_P3.ipynb` | BEDA |
| `Minggu13/MNawfalMA_Minggu13_P1.ipynb` | BEDA |
| `Minggu13/MNawfalMA_Minggu13_P2.ipynb` | BEDA |
| `Minggu14/MNawfalMA_Minggu14_P1.ipynb` | BEDA |
| `Minggu15/MNawfalMA_Minggu15_P1.ipynb` | BEDA |

## Rincian

### Minggu1/MNawfalMA_Minggu1_P1.ipynb

**Output repo pembanding:**

```
stdout::5 Data Teratas:
stdout::Informasi Dataset:
<class 'pandas.DataFrame'>
RangeIndex: 53820 entries, 0 to 53819
Data columns (total 11 columns):
 #   Column          Non-Null Count  Dtype  
---  ------          --------------  -----  
 0   Outlet          53820 non-null  object 
 1   Date            53820 non-null  object 
 2   Time            53820 non-null  object 
 3   NetSales        53820 non-null  float64
 4   Tax             53820 non-null  float64
 5   TotalAmount     53820 non-null  int64  
 6   ReceiptNumber   53820 non-null  object 
 7   Items           53820 non-null  object 
 8   TotalItem       53820 non-null  int64  
 9   PaymentMethod   53820 non-null  object 
 10  UseLoyaltyCard  53820 non-null  int64  
dtypes: float64(2), int64(3), object(6)
memory usage: 4.5+ MB
stdout::Jumlah Missing Values per Kolom:
Outlet            0
Date              0
Time              0
NetSales          0
Tax               0
TotalAmount       0
ReceiptNumber     0
Items             0
TotalItem         0
PaymentMethod     0
UseLoyaltyCard    0
dtype: int64
```

**Output run lokal:**

```
stdout::5 Data Teratas:
stdout::Informasi Dataset:
<class 'pandas.DataFrame'>
RangeIndex: 53820 entries, 0 to 53819
Data columns (total 11 columns):
 #   Column          Non-Null Count  Dtype  
---  ------          --------------  -----  
 0   Outlet          53820 non-null  str    
 1   Date            53820 non-null  str    
 2   Time            53820 non-null  str    
 3   NetSales        53820 non-null  float64
 4   Tax             53820 non-null  float64
 5   TotalAmount     53820 non-null  int64  
 6   ReceiptNumber   53820 non-null  str    
 7   Items           53820 non-null  str    
 8   TotalItem       53820 non-null  int64  
 9   PaymentMethod   53820 non-null  str    
 10  UseLoyaltyCard  53820 non-null  int64  
dtypes: float64(2), int64(3), str(6)
memory usage: 4.5 MB
stdout::Jumlah Missing Values per Kolom:
Outlet            0
Date              0
Time              0
NetSales          0
Tax               0
TotalAmount       0
ReceiptNumber     0
Items             0
TotalItem         0
PaymentMethod     0
UseLoyaltyCard    0
dtype: int64
```

### Minggu2/MNawfalMA_Minggu2_P1.ipynb

**Output repo pembanding:**

```
stdout::Tipe data sebelum konversi:
Date    object
Time    object
dtype: object

Tipe data setelah konversi:
Date    datetime64[ns]
Time    object
dtype: object
```

**Output run lokal:**

```
stdout::Tipe data sebelum konversi:
Date    str
Time    str
dtype: object

Tipe data setelah konversi:
Date    datetime64[us]
Time               str
dtype: object
```

### Minggu2/MNawfalMA_Minggu2_P2.ipynb

**Output repo pembanding:**

```
stdout::Jumlah baris sebelum cleaning: 53820
Jumlah baris setelah cleaning (NetSales > 0): 53818
```

**Output run lokal:**

```
stdout::Jumlah baris sebelum cleaning: 53820
Jumlah baris setelah cleaning (NetSales > 0): 52087
```

### Minggu3/MNawfalMA_Minggu3_P1.ipynb

**Output repo pembanding:**

```
stdout::Hasil Ekstraksi Waktu (5 data teratas):
stderr::C:\Users\M Nawfal\AppData\Local\Temp\ipykernel_16224\44148709.py:10: Pandas4Warning: Series.dt.dayofweek is deprecated and will be removed in a future version. Use Series.dt.day_of_week instead.
  df['DayOfWeek'] = df['Date'].dt.dayofweek
```

**Output run lokal:**

```
stdout::Hasil Ekstraksi Waktu (5 data teratas):
stderr::C:\Users\USER\AppData\Local\Temp\ipykernel_31468\44148709.py:10: Pandas4Warning: Series.dt.dayofweek is deprecated and will be removed in a future version. Use Series.dt.day_of_week instead.
  df['DayOfWeek'] = df['Date'].dt.dayofweek
```

### Minggu6/MNawfalMA_Minggu6_P1.ipynb

**Output repo pembanding:**

```
stdout::Koefisien (Slope): [10086.91811656]
Intersept: 12823.518625297123
MSE: 23620359.223847847
R2 Score: 0.8118029013233807
```

**Output run lokal:**

```
stdout::Koefisien (Slope): [22955.06975246]
Intersept: -2005.290185654947
MSE: 59332601.60084219
R2 Score: 0.5384253853208776
```

### Minggu6/MNawfalMA_Minggu6_P2.ipynb

**Output repo pembanding:**

```
stdout::Koefisien: [1.1 0. ]
Intersept: -1.4551915228366852e-11
R2 Score: 1.0
```

**Output run lokal:**

```
stdout::Koefisien: [1.11000000e+00 6.08521971e-07]
Intersept: -0.00019053087817155756
R2 Score: 0.9999999999999996
```

### Minggu6/MNawfalMA_Minggu6_P3.ipynb

**Output repo pembanding:**

```
stdout::Indeks Transaksi Terdekat: [[   0 7847 4304 4305 4306]]
```

**Output run lokal:**

```
stdout::Indeks Transaksi Terdekat: [[44 41 33 10  0]]
```

### Minggu9/MNawfalMA_Minggu9_P1.ipynb

**Output repo pembanding:**

```
stdout::Akurasi kNN: 0.9318097361575622
```

**Output run lokal:**

```
stdout::Akurasi kNN: 0.8285024154589372
```

### Minggu9/MNawfalMA_Minggu9_P2.ipynb

**Output repo pembanding:**

```
stdout::Akurasi Naive Bayes: 0.9677629134150873
```

**Output run lokal:**

```
stdout::Akurasi Naive Bayes: 1.0
```

### Minggu9/MNawfalMA_Minggu9_P3.ipynb

**Output repo pembanding:**

```
stdout::Confusion Matrix:
[[10417     0]
 [  347     0]]

Classification Report:
              precision    recall  f1-score   support

           0       0.97      1.00      0.98     10417
           1       0.00      0.00      0.00       347

    accuracy                           0.97     10764
   macro avg       0.48      0.50      0.49     10764
weighted avg       0.94      0.97      0.95     10764
```

**Output run lokal:**

```
stdout::Confusion Matrix:
[[10380     0]
 [    0   384]]

Classification Report:
              precision    recall  f1-score   support

           0       1.00      1.00      1.00     10380
           1       1.00      1.00      1.00       384

    accuracy                           1.00     10764
   macro avg       1.00      1.00      1.00     10764
weighted avg       1.00      1.00      1.00     10764
```

### Minggu11/MNawfalMA_Minggu11_P1.ipynb

**Output repo pembanding:**

```
stdout::Akurasi SVM Linier: 1.0
```

**Output run lokal:**

```
stdout::Akurasi SVM Linier: 0.815
```

### Minggu11/MNawfalMA_Minggu11_P2.ipynb

**Output repo pembanding:**

```
stdout::Akurasi SVM RBF: 0.8125
```

**Output run lokal:**

```
stdout::Akurasi SVM RBF: 0.8425
```

### Minggu11/MNawfalMA_Minggu11_P3.ipynb

**Output repo pembanding:**

```
stdout::Best Parameters: {'C': 1, 'kernel': 'linear'}
```

**Output run lokal:**

```
stdout::Best Parameters: {'C': 0.1, 'kernel': 'linear'}
```

### Minggu13/MNawfalMA_Minggu13_P1.ipynb

**Output repo pembanding:**

```
stderr::C:\Users\M Nawfal\AppData\Roaming\Python\Python314\site-packages\keras\src\layers\core\dense.py:100: UserWarning: Do not pass an `input_shape`/`input_dim` argument to a layer. When using Sequential models, prefer using an `Input(shape)` object as the first layer in the model instead.
  super().__init__(activity_regularizer=activity_regularizer, **kwargs)
stdout::Training ANN Regresi...
Loss Terakhir: 31332.45703125
```

**Output run lokal:**

```
stdout::WARNING:tensorflow:TensorFlow GPU support is not available on native Windows for TensorFlow >= 2.11. Even if CUDA/cuDNN are installed, GPU will not be used. Please use WSL2 or the TensorFlow-DirectML plugin.
stderr::C:\Users\USER\AppData\Local\Programs\Python\Python313\Lib\site-packages\keras\src\layers\core\dense.py:107: UserWarning: Do not pass an `input_shape`/`input_dim` argument to a layer. When using Sequential models, prefer using an `Input(shape)` object as the first layer in the model instead.
  super().__init__(activity_regularizer=activity_regularizer, **kwargs)
stdout::Training ANN Regresi...
stdout::Loss Terakhir: 28194.919921875
```

### Minggu13/MNawfalMA_Minggu13_P2.ipynb

**Output repo pembanding:**

```
stderr::C:\Users\M Nawfal\AppData\Roaming\Python\Python314\site-packages\keras\src\layers\core\dense.py:100: UserWarning: Do not pass an `input_shape`/`input_dim` argument to a layer. When using Sequential models, prefer using an `Input(shape)` object as the first layer in the model instead.
  super().__init__(activity_regularizer=activity_regularizer, **kwargs)
stdout::Training ANN Klasifikasi...
Akurasi: 0.8285024166107178
```

**Output run lokal:**

```
stdout::WARNING:tensorflow:TensorFlow GPU support is not available on native Windows for TensorFlow >= 2.11. Even if CUDA/cuDNN are installed, GPU will not be used. Please use WSL2 or the TensorFlow-DirectML plugin.
stderr::C:\Users\USER\AppData\Local\Programs\Python\Python313\Lib\site-packages\keras\src\layers\core\dense.py:107: UserWarning: Do not pass an `input_shape`/`input_dim` argument to a layer. When using Sequential models, prefer using an `Input(shape)` object as the first layer in the model instead.
  super().__init__(activity_regularizer=activity_regularizer, **kwargs)
stdout::Training ANN Klasifikasi...
stdout::Akurasi: 0.8285024166107178
```

### Minggu14/MNawfalMA_Minggu14_P1.ipynb

**Output repo pembanding:**

```
stderr::C:\Users\M Nawfal\AppData\Roaming\Python\Python314\site-packages\keras\src\layers\convolutional\base_conv.py:113: UserWarning: Do not pass an `input_shape`/`input_dim` argument to a layer. When using Sequential models, prefer using an `Input(shape)` object as the first layer in the model instead.
  super().__init__(activity_regularizer=activity_regularizer, **kwargs)
stdout::Training 1D CNN...
Akurasi Test: 1.0
```

**Output run lokal:**

```
stdout::WARNING:tensorflow:TensorFlow GPU support is not available on native Windows for TensorFlow >= 2.11. Even if CUDA/cuDNN are installed, GPU will not be used. Please use WSL2 or the TensorFlow-DirectML plugin.
stderr::C:\Users\USER\AppData\Local\Programs\Python\Python313\Lib\site-packages\keras\src\layers\convolutional\base_conv.py:113: UserWarning: Do not pass an `input_shape`/`input_dim` argument to a layer. When using Sequential models, prefer using an `Input(shape)` object as the first layer in the model instead.
  super().__init__(activity_regularizer=activity_regularizer, **kwargs)
stdout::Training 1D CNN...
stdout::Akurasi Test: 1.0
```

### Minggu15/MNawfalMA_Minggu15_P1.ipynb

**Output repo pembanding:**

```
stderr::C:\Users\M Nawfal\AppData\Roaming\Python\Python314\site-packages\keras\src\layers\core\dense.py:100: UserWarning: Do not pass an `input_shape`/`input_dim` argument to a layer. When using Sequential models, prefer using an `Input(shape)` object as the first layer in the model instead.
  super().__init__(activity_regularizer=activity_regularizer, **kwargs)
WARNING:absl:You are saving your model as an HDF5 file via `model.save()` or `keras.saving.save_model(model)`. This file format is considered legacy. We recommend using instead the native Keras format, e.g. `model.save('my_model.keras')` or `keras.saving.save_model(model, 'my_model.keras')`.
stdout::✅ Model dan Scaler disimpan!
```

**Output run lokal:**

```
stdout::WARNING:tensorflow:TensorFlow GPU support is not available on native Windows for TensorFlow >= 2.11. Even if CUDA/cuDNN are installed, GPU will not be used. Please use WSL2 or the TensorFlow-DirectML plugin.
stderr::C:\Users\USER\AppData\Local\Programs\Python\Python313\Lib\site-packages\keras\src\layers\core\dense.py:107: UserWarning: Do not pass an `input_shape`/`input_dim` argument to a layer. When using Sequential models, prefer using an `Input(shape)` object as the first layer in the model instead.
  super().__init__(activity_regularizer=activity_regularizer, **kwargs)
stderr::WARNING:absl:You are saving your model as an HDF5 file via `model.save()` or `keras.saving.save_model(model)`. This file format is considered legacy. We recommend using instead the native Keras format, e.g. `model.save('my_model.keras')` or `keras.saving.save_model(model, 'my_model.keras')`.
stdout::✅ Model dan Scaler disimpan!
```
