-- Chèn dữ liệu mẫu cho bảng dbo.Account với chuỗi Unicode có dấu
INSERT INTO dbo.Account (username, password, ten_nv, hinh_anh, email, ngay_dangki, gioi_tinh, sdt, ngay_sinh)
VALUES
('nguyenvan', 'pass123', N'Nguyễn Văn', 'nguyenvan.jpg', 'nguyenvan@email.com', '2024-02-28 11:14:27', 1, '1234567890', '1990-01-01'),
('tranthi', 'password456', N'Trần Thị', 'tranthi.jpg', 'tranthi@email.com', '2024-02-28 11:14:27', 0, '9876543210', '1995-05-15');

-- Chèn dữ liệu mẫu cho bảng dbo.DanhMuc
INSERT INTO dbo.DanhMuc (ten_danhmuc, mo_ta, vi_tri)
VALUES
(N'Tiểu thuyết', N'Tiểu thuyết yêu quái', 'B'),
(N'Truyện ngắn', N'Truyện cười', 'T');

-- Chèn dữ liệu mẫu cho bảng dbo.TheLoai
INSERT INTO dbo.TheLoai (danh_muc, ten_theloai, vi_tri)
VALUES
(1, N'Tiểu thuyết lịch sử', '03'),
(1, N'Tiểu thuyết tình cảm', '05'),
(2, N'Truyện ngắn kinh điển', '08'),
(2, N'Truyện ngắn hiện đại', '11');

-- Chèn dữ liệu mẫu cho bảng dbo.SinhVien
INSERT INTO dbo.SinhVien (ten_sv, sdt, gioi_tinh, lop, ngay_them)
VALUES
(N'Nguyễn Thị Sinh', '0987654321', 0, N'12A1', '2024-02-28 11:14:27'),
(N'Trần Văn Sinh', '0123456789', 1, N'11B2', '2024-02-28 11:14:27');

-- Chèn dữ liệu mẫu cho bảng dbo.PhieuMuon
INSERT INTO dbo.PhieuMuon (id_tk, id_sv, ngay_tao, trang_thai, ngay_tra, tong_tien)
VALUES
(1, 1, '2024-02-28 11:14:27', 1, '2024-03-15 14:30:00', 1200.50),
(2, 2, '2024-02-28 11:14:27', 0, '2024-03-20 10:45:00', 2700.78);

-- Chèn dữ liệu mẫu cho bảng dbo.Sach
INSERT INTO dbo.Sach (ten_sach, so_luong, ngay_them, nha_xb, hinh_anh, tac_gia, the_loai, trang_thai, vi_tri)
VALUES
(N'Bí mật của vũ trụ', 50, '2024-02-28 11:14:27', N'NXB Khoa học', 'bimat.jpg', N'Nguyễn Văn A', 1, 1, '56'),
(N'Tình yêu và thơ', 30, '2024-02-28 11:14:27', N'NXB Văn hóa', 'tinhyeu.jpg', N'Trần Thị B', 4, 1, '85');

-- Chèn dữ liệu mẫu cho bảng dbo.ChiTietPhieuMuon
INSERT INTO dbo.ChiTietPhieuMuon (id_phieumuon, id_sach, so_luong, ghi_chu)
VALUES
(1, 1, 2, N'Sách có nhiều hình minh họa'),
(2, 2, 1, N'Sách thơ nổi tiếng');
