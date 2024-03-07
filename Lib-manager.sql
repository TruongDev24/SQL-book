/*	create database Lib_manager
	drop database Lib_manager	*/
/*
   Wednesday, February 28, 202411:14:27 PM
   User: sa
   Server: TRUONGLEVAN
   Database: Lib_manager
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Account
	(
	id int NOT NULL IDENTITY (1, 1),
	username varchar(50) NOT NULL,
	password varchar(50) NOT NULL,
	ten_nv nvarchar(200) NOT NULL,
	hinh_anh varchar(2000) NOT NULL,
	email varchar(50) NOT NULL,
	ngay_dangki datetime2(7) NOT NULL,
	gioi_tinh bit NOT NULL,
	sdt varchar(10) NOT NULL,
	ngay_sinh date NOT NULL,
	trang_thai nvarchar(100) not null
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Account ADD CONSTRAINT
	PK_Account PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Account SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.DanhMuc
	(
	id int NOT NULL IDENTITY (1, 1),
	ten_danhmuc nvarchar(200) NOT NULL,
	mo_ta nvarchar(MAX) NOT NULL,
	vi_tri varchar(10) NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.DanhMuc ADD CONSTRAINT
	PK_DanhMuc PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.DanhMuc SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.TheLoai
	(
	id int NOT NULL IDENTITY (1, 1),
	danh_muc int NOT NULL,
	ten_theloai nvarchar(200) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.TheLoai ADD CONSTRAINT
	PK_TheLoai PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.TheLoai ADD CONSTRAINT
	FK_TheLoai_DanhMuc FOREIGN KEY
	(
	danh_muc
	) REFERENCES dbo.DanhMuc
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.TheLoai SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.SinhVien
	(
	id int NOT NULL IDENTITY (1, 1),
	ten_sv nvarchar(200) NOT NULL,
	sdt varchar(10) NOT NULL,
	gioi_tinh bit NOT NULL,
	lop nvarchar(50) NOT NULL,
	ngay_them datetime2(7) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.SinhVien ADD CONSTRAINT
	PK_SinhVien PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.SinhVien SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.PhieuMuon
	(
	id int NOT NULL IDENTITY (1, 1),
	id_tk int NOT NULL,
	id_sv int NOT NULL,
	ngay_tao datetime2(7) NOT NULL,
	trang_thai bit NOT NULL,
	ngay_tra datetime2(7) NOT NULL,
	tong_tien DECIMAL(10, 2) not null,
	ngay_han datetime2(7) not null,
	tien_phat DECIMAL(10, 2),
	ghi_chu TEXT
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.PhieuMuon ADD CONSTRAINT
	PK_PhieuMuon PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.PhieuMuon ADD CONSTRAINT
	FK_PhieuMuon_SinhVien FOREIGN KEY
	(
	id_sv
	) REFERENCES dbo.SinhVien
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.PhieuMuon ADD CONSTRAINT
	FK_PhieuMuon_Account FOREIGN KEY
	(
	id_tk
	) REFERENCES dbo.Account
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.PhieuMuon SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Sach
	(
	id int NOT NULL IDENTITY (1, 1),
	ten_sach nvarchar(200) NOT NULL,
	so_luong int NOT NULL,
	gia DECIMAL(10, 2) not null,
	ngay_them datetime2(7) NOT NULL,
	ngay_xb nvarchar(200) NOT NULL,
	hinh_anh varchar(2000) NOT NULL,
	tac_gia nvarchar(200) NOT NULL,
	the_loai int NOT NULL,
	trang_thai bit NOT NULL,
	vi_tri varchar(10) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Sach ADD CONSTRAINT
	PK_Sach PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Sach ADD CONSTRAINT
	FK_Sach_TheLoai FOREIGN KEY
	(
	the_loai
	) REFERENCES dbo.TheLoai
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Sach SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.ChiTietPhieuMuon
	(
	id int NOT NULL IDENTITY (1, 1),
	id_phieumuon int NOT NULL,
	id_sach int NOT NULL,
	so_luong int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.ChiTietPhieuMuon ADD CONSTRAINT
	PK_ChiTietPhieuMuon PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ChiTietPhieuMuon ADD CONSTRAINT
	FK_ChiTietPhieuMuon_Sach FOREIGN KEY
	(
	id_sach
	) REFERENCES dbo.Sach
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ChiTietPhieuMuon ADD CONSTRAINT
	FK_ChiTietPhieuMuon_PhieuMuon FOREIGN KEY
	(
	id_phieumuon
	) REFERENCES dbo.PhieuMuon
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ChiTietPhieuMuon SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
