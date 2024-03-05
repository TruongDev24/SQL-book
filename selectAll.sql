-- Chọn tất cả dữ liệu từ tất cả các bảng
SELECT * FROM dbo.Account;
SELECT * FROM dbo.DanhMuc;
SELECT * FROM dbo.TheLoai;
SELECT * FROM dbo.SinhVien;
SELECT * FROM dbo.PhieuMuon;
SELECT * FROM dbo.Sach;
SELECT * FROM dbo.ChiTietPhieuMuon;


-- Tắt kiểm tra khóa ngoại để có thể xóa dữ liệu từ các bảng có liên kết
EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'

-- Xóa dữ liệu từ tất cả các bảng
EXEC sp_MSForEachTable 'DELETE FROM ?'

-- Đặt lại giá trị identity cho bảng dbo.Account
DBCC CHECKIDENT ('dbo.Account', RESEED, 0);

-- Đặt lại giá trị identity cho bảng dbo.DanhMuc
DBCC CHECKIDENT ('dbo.DanhMuc', RESEED, 0);

-- Đặt lại giá trị identity cho bảng dbo.TheLoai
DBCC CHECKIDENT ('dbo.TheLoai', RESEED, 0);

-- Đặt lại giá trị identity cho bảng dbo.SinhVien
DBCC CHECKIDENT ('dbo.SinhVien', RESEED, 0);

-- Đặt lại giá trị identity cho bảng dbo.PhieuMuon
DBCC CHECKIDENT ('dbo.PhieuMuon', RESEED, 0);

-- Đặt lại giá trị identity cho bảng dbo.Sach
DBCC CHECKIDENT ('dbo.Sach', RESEED, 0);

-- Đặt lại giá trị identity cho bảng dbo.ChiTietPhieuMuon
DBCC CHECKIDENT ('dbo.ChiTietPhieuMuon', RESEED, 0);

-- Bật lại kiểm tra khóa ngoại
EXEC sp_MSForEachTable 'ALTER TABLE ? CHECK CONSTRAINT ALL'
