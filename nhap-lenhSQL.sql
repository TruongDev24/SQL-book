select S.vi_tri,
		concat(DM.vi_tri, TL.vi_tri, S.vi_tri) as vitrisach
from Sach S
inner join TheLoai TL on TL.id = S.the_loai
inner join DanhMuc DM on DM.id = TL.danh_muc