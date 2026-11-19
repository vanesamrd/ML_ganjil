# PBL — Mirror Repo Pembanding

Folder ini menyalin **struktur dan kode** dari
[`MNawfal24/MachineLearning`](https://github.com/MNawfal24/MachineLearning) bagian `PBL`,
lalu semua notebook dijalankan ulang memakai dataset yang sama.

## Isi

| Minggu | Notebook | Topik |
|---|---|---|
| 1 | P1, P2 | Load dataset, statistik & distribusi |
| 2 | P1, P2, P3 | Tipe data, cleaning, scaling/encoding |
| 3 | P1, P2, P3 | Ekstraksi waktu, korelasi, split data |
| 4 | P1, P2 | K-Means, DBSCAN |
| 5 | P1, P2 | Hierarchical clustering, silhouette |
| 6 | P1, P2, P3 | Regresi linier, nearest neighbors |
| 9 | P1, P2, P3 | kNN, Naive Bayes, confusion matrix |
| 11 | P1, P2, P3 | SVM linier, RBF, GridSearchCV |
| 13 | P1, P2 | ANN regresi & klasifikasi (Keras) |
| 14 | P1 | 1D CNN klasifikasi |
| 15 | P1 | Export model + scaler (deploy) |

Dataset: `datasetPBL/Transactions.csv` — sama persis (MD5 identik) dengan
`../data/Transactions.csv`.

Semua notebook sudah dieksekusi dan disimpan lengkap dengan output.

## Menjalankan

Jalankan dari dalam folder minggu masing-masing (notebook memakai path relatif
`../datasetPBL/Transactions.csv`), contoh:

```bash
cd PBL/Minggu6
jupyter nbconvert --to notebook --execute --inplace MNawfalMA_Minggu6_P1.ipynb
```
