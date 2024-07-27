create database Paket_3635

GO

use Paket_3635

GO

create table Pengirim_3635 (
	id_pengirim char (10) not null,
	nama_pengirim varchar (30) null,
	phone_pengirim numeric,
	alamat_pengirim varchar (50) null,
	primary key (id_pengirim)
);

GO

create table Penerima_3635 (
	id_penerima char (10) not null,
	nama_penerima varchar (30) null,
	phone_penerima numeric,
	alamat_penerima varchar (50) null,
	primary key (id_penerima)
);

GO

create table Barang_3635 (
	id_barang char (10) not null,
	nama_barang varchar (15) null,
	deskripsi_barang varchar (50) null,
	berat char (10) not null,
	jumlah decimal,
	harga_barang money null,
	primary key (id_barang)
);

GO

CREATE TABLE Transaksi_3635 (
    id_pesanan CHAR(10) NOT NULL,
    id_barang CHAR(10) NOT NULL,
    id_pengirim CHAR(10) NOT NULL,
    harga_barang MONEY NULL,
    jarak_pengiriman CHAR(10) NOT NULL,
    biaya_pengiriman MONEY NULL,
    total_biaya MONEY NULL,
    metode_pembayaran VARCHAR(20) NULL,
    PRIMARY KEY (id_pesanan),
    FOREIGN KEY (id_barang) REFERENCES Barang_3635 (id_barang)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    FOREIGN KEY (id_pengirim) REFERENCES Pengirim_3635 (id_pengirim)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);

GO

CREATE TABLE Distribusi_3635 (
    id_penerima CHAR(10) NOT NULL,
    id_pesanan CHAR(10) NOT NULL,
    ekspedisi VARCHAR(20) NULL,
    nama_kurir VARCHAR(30) NULL,
    phone_kurir NUMERIC,
    waktu_pengiriman DATETIME,
    waktu_tiba DATETIME,
    PRIMARY KEY (id_penerima, id_pesanan),
    FOREIGN KEY (id_penerima) REFERENCES Penerima_3635 (id_penerima)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    FOREIGN KEY (id_pesanan) REFERENCES Transaksi_3635 (id_pesanan)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);


GO

insert into Pengirim_3635 values ('PGR-001', 'Shani Indira', 089537456789, 'Yogyakarta');
insert into Pengirim_3635 values ('PGR-002', 'Cindy Hapsari', 081234638745, 'Purwokerto');
insert into Pengirim_3635 values ('PGR-003', 'Yessica Tamara', 082364718222, 'Jakarta');
insert into Pengirim_3635 values ('PGR-004', 'Shania Gracia', 087623948850, 'Jakarta');
insert into Pengirim_3635 values ('PGR-005', 'Anindhita Cahyadi', 089627834555, 'Palembang');

GO

insert into Penerima_3635 values ('PNR-001', 'Indah Cahya', 083456721974, 'Jambi');
insert into Penerima_3635 values ('PNR-002', 'Katrina Irene', 089672134536, 'Jakarta');
insert into Penerima_3635 values ('PNR-003', 'Adzana Shaliha', 087638976777, 'Jakarta');
insert into Penerima_3635 values ('PNR-004', 'Marsha Lenathea', 081456287999, 'Jakarta');
insert into Penerima_3635 values ('PNR-005', 'Cornelia Vanisa', 082384977588, 'Surabaya');

GO

insert into Barang_3635 values ('BRG-001', 'Lighstick', 'Lightstick JKT48', '0.5', 2, 75000);
insert into Barang_3635 values ('BRG-002', 'T-shirt', 'Bday T-shirt JKT48', '1.0', 1, 180000);
insert into Barang_3635 values ('BRG-003', 'Cap', 'Baseball Cap Black JKT48', '0.5', 1, 150000);
insert into Barang_3635 values ('BRG-004', 'Photopack', 'Photopack JKT48', '2.0', 1, 350000);
insert into Barang_3635 values ('BRG-005', 'Hodie', 'Hoodie Oversize JKT48', '2.0', 2, 500000);

GO

insert into Transaksi_3635 values ('PSN-001', 'BRG-001', 'PGR-001', 75000, '7 km', 12000, 87000, 'Transfer Bank');
insert into Transaksi_3635 values ('PSN-002', 'BRG-002', 'PGR-002', 180000, '5 km', 10000, 190000, 'COD');
insert into Transaksi_3635 values ('PSN-003', 'BRG-003', 'PGR-003', 150000, '10 km', 15000, 165000, 'E-wallet Shopepay');
insert into Transaksi_3635 values ('PSN-004', 'BRG-004', 'PGR-004', 350000, '12 km', 18000, 368000, 'Transfer Bank');
insert into Transaksi_3635 values ('PSN-005', 'BRG-005', 'PGR-005', 500000, '15 km', 20000, 520000, 'E-wallet Gopay');

GO

insert into Distribusi_3635 values ('PNR-001', 'PSN-001', 'JNT', 'Jabieb', 081234657822, '2022-05-10 18:00:00', '2022-05-16 10:00:00');
insert into Distribusi_3635 values ('PNR-002', 'PSN-002', 'JNE', 'Reza', 089734672111, '2022-05-13 09:00:00', '2022-05-16 18:00:00');
insert into Distribusi_3635 values ('PNR-003', 'PSN-003', 'Si-cepat', 'Ella', 087365123888, '2022-05-17 14:00:00', '2022-05-25 13:00:00');
insert into Distribusi_3635 values ('PNR-004', 'PSN-004', 'Pos Indonesia', 'Riski', 083427649978, '2022-05-17 20:00:00', '2022-05-27 15:00:00');
insert into Distribusi_3635 values ('PNR-005', 'PSN-005', 'JNT', 'Tata', 082456872978, '2022-05-15 17:00:00', '2022-05-20 12:00:00');

GO

select * from Pengirim_3635
select * from Penerima_3635
select * from Barang_3635
select * from Transaksi_3635
select * from Distribusi_3635

GO

--B1
select nama_pengirim, phone_pengirim from Pengirim_3635
where alamat_pengirim IN (select alamat_pengirim from Pengirim_3635 where alamat_pengirim = 'Jakarta')

GO

--B2
select Penerima_3635.nama_penerima as Pembeli, Transaksi_3635.id_pesanan, Barang_3635.nama_barang as product, Barang_3635.jumlah, 
Barang_3635.harga_barang, Transaksi_3635.biaya_pengiriman, Transaksi_3635.total_biaya, Transaksi_3635.metode_pembayaran, 
Distribusi_3635.ekspedisi, Distribusi_3635.waktu_tiba
from Barang_3635 inner join Transaksi_3635
on Barang_3635.id_barang = Transaksi_3635.id_barang
inner join Distribusi_3635
on Distribusi_3635.id_pesanan = Transaksi_3635.id_pesanan
inner join Penerima_3635
on Penerima_3635.id_penerima = Distribusi_3635.id_penerima

GO

Delete Distribusi_3635 where id_penerima = 'PNR-001'