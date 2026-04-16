-- Menghitung jumlah transaksi tanpa CustomerID
SELECT 
    COUNT(*) AS Missing_Customer_Count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM tabel_data), 2) AS Percent_Missing
FROM tabel_data 
WHERE CustomerID IS NULL OR CustomerID = '';

-- Perbandingan Revenue (Setelah membersihkan data sistem/operasional)
SELECT 
    CASE 
        WHEN (CustomerID IS NULL OR CustomerID = '') THEN 'Guest' 
        ELSE 'Member' 
    END AS User_Status,
    SUM(CAST(UnitPrice AS FLOAT) * CAST(Quantity AS INTEGER)) AS Total_Revenue
FROM tabel_data
WHERE Description NOT IN ('AMAZON FEE', 'Adjust bad debt', 'DOTCOM POSTAGE', 'Manual', 'SAMPLES')
GROUP BY User_Status;

-- Top 5 Produk untuk GUEST
SELECT 
    Description, 
    SUM(CAST(Quantity AS INTEGER)) AS Total_Unit
FROM tabel_data
WHERE (CustomerID IS NULL OR CustomerID = '')
GROUP BY Description
ORDER BY Total_Unit DESC
LIMIT 5;

-- Top 5 Produk untuk MEMBER
SELECT 
    Description, 
    SUM(CAST(Quantity AS INTEGER)) AS Total_Unit
FROM tabel_data
WHERE (CustomerID IS NOT NULL AND CustomerID <> '')
GROUP BY Description
ORDER BY Total_Unit DESC
LIMIT 5;

-- Perbandingan harga rata-rata Charlotte Bag per segmen (Excluding Cancellations)
SELECT 
    CASE 
        WHEN (CustomerID IS NULL OR CustomerID = '') THEN 'Guest' 
        ELSE 'Member' 
    END AS User_Status,
    AVG(CAST(UnitPrice AS FLOAT)) AS Avg_Price,
    AVG(CAST(Quantity AS INTEGER)) AS Avg_Qty_Per_Trans
FROM tabel_data
WHERE Description LIKE '%CHARLOTTE%' 
  AND SUBSTR(InvoiceNo, 1, 1) != 'C'
GROUP BY User_Status;

-- Persentase Guest per Negara (Hanya negara dengan transaksi > 100)
SELECT 
    Country,
    COUNT(CASE WHEN CustomerID IS NULL OR CustomerID = '' THEN InvoiceNo END) AS Transaksi_Guest,
    ROUND((COUNT(CASE WHEN CustomerID IS NULL OR CustomerID = '' THEN InvoiceNo END) * 100.0) / COUNT(InvoiceNo), 2) AS Persen_Guest
FROM tabel_data
GROUP BY Country
HAVING COUNT(InvoiceNo) > 100
ORDER BY Persen_Guest DESC;

