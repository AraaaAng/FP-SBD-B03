--View
CREATE VIEW view_laporan_donatur AS
SELECT
    UPPER(dd.Nama) AS Donatur,
    COUNT(d.ID_Donasi) AS Jumlah_Donasi,
    SUM(td.Jumlah) AS Total_Donasi,
    MAX(td.Jumlah) AS Maksimum_Donasi,
    MIN(td.Jumlah) AS Minimum_Donasi,
    AVG(td.Jumlah) AS Rata_Rata_Donasi,
    SUBSTRING(dd.Alamat, 1, 10) AS Alamat_Singkat
FROM
    datadonatur dd
JOIN
    datadonasi d ON dd.ID_Donatur = d.ID_Donatur
JOIN
    transaksidonasi td ON d.ID_Donasi = td.ID_Donasi
LEFT JOIN
    kontakdonatur kd ON dd.ID_Donatur = kd.ID_Donatur
WHERE
    d.tanggal > '2023-01-01' AND dd.Nama NOT LIKE '%Test%'
GROUP BY
    dd.Nama
HAVING
    Total_Donasi > 1000
ORDER BY
    Rata_Rata_Donasi DESC, Donatur ASC;

