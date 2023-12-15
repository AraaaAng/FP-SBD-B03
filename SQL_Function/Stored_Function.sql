DELIMITER //

CREATE FUNCTION CalculateTotalDonationAmount(DonatorID INT)
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE totalAmount DECIMAL(10, 2);

    SELECT SUM(Barang.Jumlah)
    INTO totalAmount
    FROM Barang
    JOIN DataDonasi ON Barang.ID_Donasi = DataDonasi.ID_Donasi
    WHERE DataDonasi.ID_Donatur = DonatorID;

    RETURN totalAmount;
END //

DELIMITER ;
