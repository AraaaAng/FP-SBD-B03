DELIMITER //

CREATE TRIGGER UpdateDonationCount
AFTER INSERT ON TransaksiDonasi
FOR EACH ROW
BEGIN
    UPDATE DataDonatur
    SET JumlahDonasi = (
        SELECT COUNT(TransaksiDonasi.NoTransaksi)
        FROM TransaksiDonasi
        WHERE TransaksiDonasi.ID_Donasi = NEW.ID_Donasi
    )
    WHERE DataDonatur.ID_Donatur = (
        SELECT DataDonasi.ID_Donatur
        FROM DataDonasi
        WHERE DataDonasi.ID_Donasi = NEW.ID_Donasi
    );
END //

DELIMITER ;
