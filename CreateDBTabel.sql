--Create Database
CREATE DATABASE PalestineCare;
USE PalestineCare;

--Create Table
CREATE TABLE Barang (
    ID_Barang INT AUTO_INCREMENT PRIMARY KEY,
    Jumlah INT,
    ID_Donasi INT,
    ID_PDonasi INT,
    FOREIGN KEY (ID_Donasi) REFERENCES DataDonasi(ID_Donasi),
    FOREIGN KEY (ID_PDonasi) REFERENCES PenyimpananDonasi(ID_PDonasi)
);

CREATE TABLE DataDonasi (
    ID_Donasi INT AUTO_INCREMENT PRIMARY KEY,
    tanggal DATE,
    ID_Donatur INT,
    ID_TDonasi INT,
    FOREIGN KEY (ID_Donatur) REFERENCES DataDonatur(ID_Donatur),
    FOREIGN KEY (ID_TDonasi) REFERENCES TipeDonasi(ID_TDonasi)

);

CREATE TABLE DataDonatur (
    ID_Donatur INT AUTO_INCREMENT PRIMARY KEY,
    Nama VARCHAR(100),
    Alamat VARCHAR(255),
);

CREATE TABLE DataPribadiPegawai (
    ID_Pegawai INT AUTO_INCREMENT PRIMARY KEY,
    Nama VARCHAR(100),
    Alamat VARCHAR(255),
);

CREATE TABLE DataRelawan (
    ID_Relawan INT AUTO_INCREMENT PRIMARY KEY,
    Nama VARCHAR(100),
    Alamat VARCHAR(255),
    Jenis_Kelamin VARCHAR(20),
);

CREATE TABLE JabatanPegawai (
    ID_Jabatan INT AUTO_INCREMENT PRIMARY KEY,
    Gaji DECIMAL(10, 2),
    Jabatan VARCHAR(50),
    ID_Pegawai INT,
    FOREIGN KEY (ID_Pegawai) REFERENCES DataPribadiPegawai(ID_Pegawai)
);

CREATE TABLE Kegiatan (
    ID_Kegiatan INT AUTO_INCREMENT PRIMARY KEY,
    Tanggal DATE,
    Nama_Kegiatan VARCHAR(100),
    Lokasi VARCHAR(255),
    Jenis_Kegiatan VARCHAR(50), 
    ID_Donasi INT,
    FOREIGN KEY (ID_Donasi) REFERENCES DataDonasi(ID_Donasi)
);

CREATE TABLE KontakDonatur (
    Nomor_Kontak VARCHAR(20) PRIMARY KEY, 
    ID_Donatur INT,
    FOREIGN KEY (ID_Donatur) REFERENCES DataDonatur(ID_Donatur)
);

CREATE TABLE KontakDonatur (
    No_telp VARCHAR(20) PRIMARY KEY, 
    ID_Pegawai INT,
    FOREIGN KEY (ID_Pegawai) REFERENCES DataPribadiPegawai(ID_Pegawai)
);

CREATE TABLE KontakRelawan (
    Nomor_Kontak VARCHAR(20) PRIMARY KEY,  
    ID_Relawan INT,
    FOREIGN KEY (ID_Relawan) REFERENCES DataRelawan(ID_Relawan)
);

CREATE TABLE Transaksi (
    ID_Laporan INT AUTO_INCREMENT PRIMARY KEY,
    Tanggal_Laporan DATE,
    Status_Laporan BOOL, -- Kolom boolean untuk menandai status aktivitas
    ID_Kegiatan INT,
    ID_Pegawai INT,
    FOREIGN KEY (ID_Kegiatan) REFERENCES Kegiatan(ID_Kegiatan),
    FOREIGN KEY (ID_Pegawai) REFERENCES DataPribadiPegawai(ID_Pegawai)
);

CREATE TABLE PenyimpananDonasi (
    ID_PDonasi INT AUTO_INCREMENT PRIMARY KEY,
    alamat VARCHAR(255),
    ID_Pegawai INT,
    FOREIGN KEY (ID_Pegawai) REFERENCES DataPribadiPegawai(ID_Pegawai)
);

CREATE TABLE RelawanKegiatan (
    ID_RelawanKegiatan INT AUTO_INCREMENT PRIMARY KEY,
    Peran VARCHAR(50),
    ID_Kegiatan INT,
    ID_Relawan INT,
    FOREIGN KEY (ID_Relawan) REFERENCES DataRelawan(ID_Relawan),
    FOREIGN KEY (ID_Pegawai) REFERENCES DataPribadiPegawai(ID_Pegawai)
);

CREATE TABLE TipeDonasi (
    ID_TDonasi INT AUTO_INCREMENT PRIMARY KEY,
    JenisDonasi VARCHAR(100),
);

CREATE TABLE TransaksiDonasi (
    NoTransaksi INT AUTO_INCREMENT PRIMARY KEY,
    Jumlah DECIMAL(10, 2),
    Metode_Pembayaran VARCHAR(100),
    ID_Donasi INT,
    FOREIGN KEY (ID_Donasi) REFERENCES DataDonasi(ID_Donasi)
);
