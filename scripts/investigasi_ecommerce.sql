-- ANALISIS ANOMALI GUEST VS MEMBER
-- Menghitung total transaksi berdasarkan status pelanggan
SELECT 
    CASE WHEN (CustomerID IS NULL OR CustomerID = '') THEN 'Guest' ELSE 'Member' END AS User_Status,
    COUNT(InvoiceNo) AS Jumlah_Transaksi,
    SUM(CAST(UnitPrice AS FLOAT) * CAST(Quantity AS INTEGER)) AS Total_Revenue
FROM tabel_data
WHERE Description NOT IN ('AMAZON FEE', 'Adjust bad debt', 'DOTCOM POSTAGE', 'Manual')
GROUP BY User_Status;

-- INVESTIGASI HARGA CHARLOTTE BAG
-- Membuktikan gap harga 2x lipat
SELECT 
    Description,
    AVG(CASE WHEN CustomerID IS NOT NULL AND CustomerID <> '' THEN CAST(UnitPrice AS FLOAT) END) AS Avg_Price_Member,
    AVG(CASE WHEN CustomerID IS NULL OR CustomerID = '' THEN CAST(UnitPrice AS FLOAT) END) AS Avg_Price_Guest
FROM tabel_data
WHERE Description LIKE '%CHARLOTTE%' 
  AND SUBSTR(InvoiceNo, 1, 1) != 'C'
GROUP BY Description;