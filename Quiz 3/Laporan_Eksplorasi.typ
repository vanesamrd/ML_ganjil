#set page(paper: "a4", margin: 1.8cm)
#set text(font: "DejaVu Sans", size: 9.5pt)
#set par(justify: true, leading: 0.6em)
#set heading(numbering: "1.")
#show heading: it => block(above: 0.9em, below: 0.4em, it)

#let small = text.with(size: 8.5pt)
#let code(x) = raw(x, lang: "text")

#align(center)[
  #text(size: 16pt, weight: "bold")[Segmentasi Produk–Outlet untuk Perencanaan Stok]
  #v(0.2em)
  #text(size: 10pt)[Laporan Quiz Machine Learning · Clustering Pola Permintaan]
  #v(0.1em)
  #small[Data transaksi kasir 3 outlet kedai kopi, Jan–Sep 2025]
]

#v(0.6em)

= Latar Belakang dan Tujuan

Kedai kopi punya 94 produk di 3 outlet. Menyimpan semua produk dalam jumlah sama
di tiap outlet membuat stok menumpuk di produk sepi dan kosong di produk laris.
Laporan ini mengelompokkan *produk di tiap outlet* berdasarkan pola permintaan,
lalu menandai produk yang perlu perlakuan khusus.

*Pertanyaan:* (1) ada berapa tipe pola permintaan? (2) produk mana yang masuk
tipe mana? (3) algoritma & ukuran jarak mana yang paling masuk akal? (4) produk
mana yang polanya tidak biasa (noise)?

= Data dan Metode

*Sumber:* `Transactions.csv`, 53.820 struk dari 3 outlet (SHOP001–003), 272 hari.

*Alur pengolahan:*

+ *Bersih.* Hapus struk duplikat, pecah struk multi-item (`"A, B"`) → 61.973 item terjual.
+ *Deret harian.* Hari tanpa penjualan dicatat 0 (bukan dihilangkan) agar rata-rata
  permintaan tidak terlalu tinggi.
+ *Fitur.* Dari deret harian dihitung 9 fitur perilaku per produk×outlet:
  `mean_daily` (rata-rata harian), `cv` (kestabilan), `zero_day_ratio` (rasio hari
  kosong), `max_daily`, `trend_weekly_pct`, `weekend_ratio`, `momentum_30d`,
  `share_morning`/`share_evening` (porsi jam ramai), `loyalty_share`, `avg_price`.
+ *Saring.* Fitur yang hampir kembar (|korelasi| ≥ 0.90) dibuang agar tidak dihitung ganda.
+ *Skala.* Log-transform untuk fitur sangat miring, lalu Z-score agar semua fitur setara.

Hasil akhir: matriks *282 baris* (produk×outlet) × *9 fitur* siap diklaster.

= Temuan Eksplorasi (EDA)

- Total pendapatan Rp 1,315 miliar dari 53.820 transaksi; rata-rata transaksi berbayar Rp 25.252.
- 1.733 transaksi (3,2%) bernilai Rp 0 dan *100%*-nya memakai kartu loyalitas → penukaran reward, bukan data rusak.
- SHOP001 outlet tersibuk, disusul SHOP003 lalu SHOP002.
- Pembayaran didominasi BCA, jauh di atas Cash dan GoFood.
- 86% transaksi hanya berisi 1 item → peluang *bundling/upselling*.
- Pola jam sibuk terlihat jelas; berguna untuk jadwal staf dan penambahan stok harian.

= Hasil Clustering

Tujuh model diuji: K-Means (3 jarak) dan DBSCAN (3 jarak) plus HDBSCAN. `Silhouette (Euclid)`
dipakai sebagai pembanding yang adil karena dihitung di ruang jarak yang sama untuk semua model.

#align(center)[
#small[
#table(
  columns: (auto, auto, auto, auto, auto, auto, auto),
  align: (left, left, left, right, right, right, right),
  stroke: 0.4pt,
  inset: 4pt,
  [*Model*], [*Parameter*], [*Klaster*], [*Noise*], [*Silh. (Eucl)*], [*Davies-Bouldin*], [*Cakupan*],
  [HDBSCAN], [min_size=5], [4], [45,7%], [*0,217*], [1,418], [54,3%],
  [KMeans-cosine], [k=3], [3], [0%], [0,203], [1,810], [100%],
  [KMeans-manhattan], [k=3], [3], [0%], [0,199], [1,830], [100%],
  [KMeans-euclidean], [k=4], [4], [0%], [0,195], [*1,658*], [100%],
  [DBSCAN-manhattan], [eps=4,0], [2], [22,0%], [0,182], [0,985], [78,0%],
  [DBSCAN-euclidean], [eps=2,0], [2], [14,5%], [0,158], [1,020], [85,5%],
  [DBSCAN-cosine], [eps=0,2], [3], [9,2%], [0,036], [1,780], [90,8%],
)
]]

*Cara membaca.* Silhouette tinggi = klaster rapat dan terpisah; Davies-Bouldin rendah = klaster
kompak. HDBSCAN punya Silhouette tertinggi tetapi hanya menilai 54% data — sisanya 45,7%
dibuang sebagai noise. Jadi skornya tinggi karena cakupan sempit, bukan karena lebih baik secara
keseluruhan. DBSCAN-cosine skornya sangat rendah karena jarak cosine menghasilkan klaster yang
tumpang tindih pada data ini.

= Perbandingan dan Kesepakatan Antar Model

Selain metrik, dihitung *Adjusted Rand Index (ARI)* — seberapa mirip dua model membagi data
(1 = identik, 0 = acak).

- Paling sepakat: *KMeans-cosine vs KMeans-manhattan (ARI 0,88)* → ketiga K-Means pada dasarnya
  menemukan pembagian yang sama; pilihan jarak tidak mengubah cerita besar.
- DBSCAN-euclidean vs DBSCAN-manhattan (0,61) juga cukup sepakat.
- Paling berbeda: *HDBSCAN vs DBSCAN-euclidean (−0,04)* → wajar, karena HDBSCAN membuang 45,7%
  data sebagai noise sedangkan DBSCAN-euclidean hanya 14,5%.

*Pilihan model:* K-Means-euclidean (`k=4`) dipakai sebagai model utama karena mencakup 100% data,
jumlah klaster seimbang (67/93/63/59), dan Davies-Bouldin terendah di antara K-Means. DBSCAN/HDBSCAN
tetap berguna sebagai *pendeteksi noise*, bukan pengganti segmentasi utama.

= Interpretasi Klaster (K-Means Euclidean)

#align(center)[
#small[
#table(
  columns: (auto, auto, auto, auto, auto),
  align: (left, right, right, right, right),
  stroke: 0.4pt,
  inset: 4pt,
  [*Klaster*], [*mean_daily*], [*zero_day*], [*cv*], [*Nama*],
  [0 (67)], [0,74], [0,48], [1,17], [Permintaan sedang, sore ramai],
  [1 (93)], [1,18], [0,31], [0,93], [Fast mover, stabil],
  [2 (63)], [0,50], [0,61], [1,45], [Slow mover, sering kosong],
  [3 (59)], [0,62], [0,55], [1,31], [Slow mover, harga murah],
)
]]

*Artinya untuk stok:* klaster 1 (mis. BLACK Houseblend, Hazelnut Latte) harus selalu tersedia —
permintaannya tinggi dan stabil. Klaster 2 dan 3 (mis. Creamy Klepon, Air Mineral, Lemons) sebaiknya
distok sedikit dan dipantau, karena sering tidak terjual dan permintaannya naik-turun.

= Kesimpulan dan Limitasi

*Kesimpulan.* (1) Pola permintaan terbagi menjadi 4 tipe yang jelas dan bisa dinamai.
(2) K-Means memberi cakupan penuh, HDBSCAN/DBSCAN menandai produk berpola tidak biasa.
(3) Produk *fast mover* layak diprioritaskan stoknya, *slow mover* dikurangi porsinya.

*Limitasi.* Hanya 282 sampel (produk×outlet) dan sembilan bulan data; musiman tahunan belum terlihat.
PCA hanya dipakai untuk gambar, bukan untuk clustering. Nilai Silhouette semua model tergolong
rendah (< 0,4), jadi segmentasi ini lebih cocok sebagai *panduan prioritas stok*, bukan aturan mutlak.

*Langkah lanjut:* uji data tahun kedua, tambah fitur musiman/promo, dan evaluasi ulang model terbaik.
