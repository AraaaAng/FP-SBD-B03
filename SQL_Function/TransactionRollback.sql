--Transaction and Rollback

START TRANSACTION;
SELECT Rata_rata_Gaji_Sebelum_Rollback
FROM (
    SELECT AVG(Gaji) AS Rata_rata_Gaji_Sebelum_Rollback
    FROM JabatanPegawai
    WHERE Jabatan = 'Marketing'
    GROUP BY Jabatan
    HAVING Jabatan = 'Marketing'
) AS Subquery_Rata_rata_Sebelum_Rollback;

UPDATE JabatanPegawai
SET Gaji = Gaji * 2
WHERE Jabatan = 'Marketing';

SELECT Rata_rata_Gaji_Setelah_Peningkatan
FROM (
    SELECT AVG(Gaji) AS Rata_rata_Gaji_Setelah_Peningkatan
    FROM JabatanPegawai
    WHERE Jabatan = 'Marketing'
    GROUP BY Jabatan
    HAVING Jabatan = 'Marketing'
) AS Subquery_Rata_rata_Setelah_Peningkatan;

ROLLBACK;

SELECT DP.ID_Pegawai, DP.Nama, JP.Jabatan, JP.Gaji, KP.No_telp,
       CONCAT(DP.Nama, ' memiliki gaji sebesar ', JP.Gaji) AS Info_Gaji
FROM DataPribadiPegawai DP
INNER JOIN JabatanPegawai JP ON DP.ID_Pegawai = JP.ID_Pegawai
LEFT JOIN KontakPegawai KP ON DP.ID_Pegawai = KP.ID_Pegawai
WHERE JP.Jabatan = 'Marketing' AND DP.Nama LIKE 'A%'
GROUP BY DP.ID_Pegawai, DP.Nama, JP.Jabatan, JP.Gaji, KP.No_telp
HAVING JP.Jabatan = 'Marketing'
ORDER BY JP.Gaji DESC;

COMMIT;
