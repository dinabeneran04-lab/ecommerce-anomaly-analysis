# 🕵️ E-Commerce Analytics: Investigating the "Guest" Segment Anomaly

## 📌 Project Background
Proyek ini menganalisis dataset transaksi retail UK (2010-2011) dengan fokus pada anomali data. [cite_start]Temuan utama menunjukkan bahwa **25% transaksi (135.080 baris)** tidak memiliki CustomerID .

## 🧪 Alur Investigasi & Hipotesis
[cite_start]Saya menguji 4 hipotesis untuk memahami mengapa segmen "Guest" mendapatkan harga yang jauh lebih mahal (studi kasus: Charlotte Bag) :
1. **Hipotesis Pembatalan:** Apakah harga tinggi karena data retur? (TERBANTAH) [cite_start][cite: 75-77].
2. **Hipotesis Varian:** Apakah produknya berbeda? (TERBANTAH) [cite_start][cite: 78-80].
3. **Hipotesis Waktu:** Apakah terjadi hanya di periode tertentu? (TERBANTAH) [cite_start][cite: 81-83].
4. [cite_start]**Hipotesis Strategi Bisnis:** Indikasi perbedaan harga antara segmen Wholesale (Member) vs Retail (Guest) [cite: 84-86].

## 📊 Temuan Kunci
- [cite_start]**Revenue Impact:** Guest menyumbang 14,8% dari total revenue (£1.44M) [cite: 60-61, 72].
- [cite_start]**Price Discrimination:** Harga rata-rata Charlotte Bag untuk Guest adalah £2.06, sedangkan Member hanya £1.12[cite: 80].
- **Shopping Behavior:** Guest memiliki rata-rata item unik per invoice lebih tinggi (38 item) dibanding Member (20 item).

## 💡 Rekomendasi Bisnis
- [cite_start]Menggunakan Charlotte Bag sebagai **Lead Product** untuk konversi member [cite: 116-117].
- [cite_start]Melakukan audit pada sistem POS terkait produk tanpa nama valid (kode 20713)[cite: 123].
