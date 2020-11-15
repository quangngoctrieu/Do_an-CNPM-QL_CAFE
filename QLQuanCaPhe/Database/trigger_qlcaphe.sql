--Chỉnh cấu trúc ngày (set DATEformat DMY)
set DATEformat DMY
use csdlcaphe
go
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--Kiểm tra ngày trong khuyến mãi: ngaykt phải sau ngaybd (Hoàn thành)
create trigger khuyenmai_ngaybd_ngaykt
on khuyenmai
for insert
as
begin
	if exists(select * from inserted i where i.ngaybd>i.ngaykt)
	begin
		print N'Ngày kết thúc phải sau ngày bắt đầu.'
		rollback tran
	end
end
-- test khuyen mai
insert into khuyenmai(makm,tenctkm,noidungctkm,ngaybd,ngaykt,trangthai) values (N'KM2',N'Khai trương',N'Thích thì giảm','2020/12/02 00:00:00','2020/11/02 00:00:00',0) 
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--Kiểm tra họ tên ko có số(hoàn thành)
create trigger khachhang_hoten
on khachhang
for insert,update
as 
begin
	if exists(select * from inserted i where i.hokh LIKE '%[0-9]%' or i.tenkh LIKE '%[0-9]%')
	begin
		print N'Họ và tên không có số.'
		rollback tran
	end
end
--test khách hàng_họ_và_tên
insert into khachhang(makh,hokh,tenkh,gioitinh,ngaysinh,sodienthoai,ngaytaothanhvien,diemtichluy,trangthai) values (N'KH2',N'N1guyễn',N'Phong Phú',N'Nam','18-02-2000',N'0367945523','10-10-2020',1,0)
----------------------------------------------------------------------------------------------------------------------------------------------------------
--Khách hàng phải đủ 18 tuổi mới được tạo thành viên (Hoàn thành)
create trigger khachhang_ngaysinh
on khachhang
for insert, update
as
begin
	if exists(select * from inserted i where  DATEDIFF(year,i.ngaysinh,i.ngaytaothanhvien) < 18)
	begin
		print N'Khách hàng phải đủ 18 tuổi mới được phép đăng ký.'
		rollback tran
	end
end
--test khách hàng_ngày sinh
insert into khachhang(makh,hokh,tenkh,gioitinh,ngaysinh,sodienthoai,ngaytaothanhvien,diemtichluy,trangthai) values (N'KH2',N'Nguyễn',N'Phong Phú',N'Nam','18-02-2010',N'0367945523','10-10-2020',1,0)
---------------------------------------------------------------------------------------------------------------------------------------------------------
--Kiểm tra số điện thoại khách hàng (hoàn thành)
create trigger khachhang_sodienthoai
on khachhang
for insert, update
as
begin
	if not exists(select * from inserted i where LEFT(i.sodienthoai,1) = 0)
	begin
		print N'Số điện thoại bắt buộc là số 0 đầu số.'
		rollback tran
	end
	else if not exists(select * from inserted i where len(i.sodienthoai) >= 10 and len(i.sodienthoai) <= 11)
	begin
		print N'Số điện thoại phải có 10 hoặc 11 số.'
		rollback tran
	end
	else if exists(select * from inserted i where i.sodienthoai = '%[a-z]%')
	begin
		print N'Số điện thoại không được nhập ký tự.'
		rollback tran
	end
end
--test khách hàng_số điện thoại
insert into khachhang(makh,hokh,tenkh,gioitinh,ngaysinh,sodienthoai,ngaytaothanhvien,diemtichluy,trangthai) values (N'KH2',N'Nguyễn',N'Phong Phú',N'Nam','18-02-2000',N'0367945523125','10-10-2020',1,0)
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--Kiểm tra mã chức vụ có tồn tại trong table chức vụ không (Hoàn thành)
create trigger nhanvien_chucvu
on nhanvien
Instead of insert
as
begin
	if not exists(select * from inserted i, chucvu c where i.chucvu = c.macv)
	begin
		print N'Mã chức vụ không tồn tại trong bảng chức vụ.'
		rollback tran
	end
	else
	begin
		insert into nhanvien
		select * from inserted
	end
end
--test nhân viên_chucvu
insert into nhanvien(manv,honv,tennv,gioitinh,ngaysinh,diachi,cmnd,sodienthoai,ngayvaolam,chucvu,trangthai) values (N'NV2',N'Nguyễn',N'Phong Phú',N'Nam','18-02-2000',N'A1/20Q, ấp 1, xã Vĩnh Lộc A, huyện Bình Chánh','1234567894','0367945523','10-10-2020',N'AD1',0)
----------------------------------------------------------------------------------------------------------------------------------------------------------
--kiểm tra họ tên nhân viên không có chữ số (Hoàn Thành)
create trigger nhanvien_hoten
on nhanvien
for insert,update
as 
begin
	if exists(select * from inserted i where i.honv LIKE '%[0-9]%' or i.tennv LIKE '%[0-9]%')
	begin
		print N'Họ và tên không có số.'
		rollback tran
	end
end
--test nhân viên_họ tên
insert into nhanvien(manv,honv,tennv,gioitinh,ngaysinh,diachi,cmnd,sodienthoai,ngayvaolam,chucvu,trangthai) values (N'NV2',N'Ng1uyễn',N'Phong Phú',N'Nam','18-02-2000',N'A1/20Q, ấp 1, xã Vĩnh Lộc A, huyện Bình Chánh','1234567894','0367945523','10-10-2020',N'AD',0)
----------------------------------------------------------------------------------------------------------------------------------------------------------
--nhân viên phải đủ 18 tuổi mới được tạo (Hoàn thành)
create trigger nhanvien_ngaysinh
on nhanvien
for insert, update
as
begin
	if exists(select * from inserted i where  DATEDIFF(year,i.ngaysinh,i.ngayvaolam) < 18)
	begin
		print N'Nhân viên phải trên 18 tuổi.'
		rollback tran
	end
end
--test nhân viên_ngày sinh
insert into nhanvien(manv,honv,tennv,gioitinh,ngaysinh,diachi,cmnd,sodienthoai,ngayvaolam,chucvu,trangthai) values (N'NV2',N'Ng1uyễn',N'Phong Phú',N'Nam','18-02-2010',N'A1/20Q, ấp 1, xã Vĩnh Lộc A, huyện Bình Chánh','1234567894','0367945523','10-10-2020',N'AD',0)
----------------------------------------------------------------------------------------------------------------------------------------------------------
--Kiểm tra số điện thoại nhân viên (hoàn thành)
create trigger nhanvien_sodienthoai
on nhanvien
for insert, update
as
begin
	if not exists(select * from inserted i where LEFT(i.sodienthoai,1) = 0)
	begin
		print N'Số điện thoại bắt buộc là số 0 đầu số.'
		rollback tran
	end
	else if not exists(select * from inserted i where len(i.sodienthoai) >= 10 and len(i.sodienthoai) <= 11)
	begin
		print N'Số điện thoại phải có 10 hoặc 11 số.'
		rollback tran
	end
	else if exists(select * from inserted i where i.sodienthoai = '%[a-z]%')
	begin
		print N'Số điện thoại không được nhập ký tự.'
		rollback tran
	end
end
--test nhân viên_số điện thoại
insert into nhanvien(manv,honv,tennv,gioitinh,ngaysinh,diachi,cmnd,sodienthoai,ngayvaolam,chucvu,trangthai) values (N'NV2',N'Nguyễn',N'Phong Phú',N'Nam','18-02-2000',N'A1/20Q, ấp 1, xã Vĩnh Lộc A, huyện Bình Chánh','1234567894','0367945523111','10-10-2020',N'AD',0)
----------------------------------------------------------------------------------------------------------------------------------------------------------
--Kiểm tra chứng minh nhân dân(hoàn thành)
create trigger nhanvien_cmnd
on nhanvien
for insert, update
as
begin
	if not exists(select * from inserted i where len(i.cmnd) = 10)
	begin
		print N'Chứng minh nhân dân đủ 10 số'
		rollback tran
	end
	else if exists(select * from inserted i where i.sodienthoai = '%[a-z]%')
	begin
		print N'Chứng minh nhân dân không được nhập ký tự.'
		rollback tran
	end
end
--test nhân viên_cmnd
insert into nhanvien(manv,honv,tennv,gioitinh,ngaysinh,diachi,cmnd,sodienthoai,ngayvaolam,chucvu,trangthai) values (N'NV2',N'Nguyễn',N'Phong Phú',N'Nam','18-02-2000',N'A1/20Q, ấp 1, xã Vĩnh Lộc A, huyện Bình Chánh','12331234567894','0367945523','10-10-2020',N'AD',0)
----------------------------------------------------------------------------------------------------------------------
--Kiểm tra ca làm thời gian bắt đầu phải trước thời gian kết thúc(Hoàn thành)
create trigger calam_thoigian
on calam
for insert,update
as
begin
	if exists(select * from inserted i where i.thoigiankt < i.thoigianbd)
	begin
		print N'Thời gian bắt đầu phải trước thời gian kết thúc.'
		rollback tran
	end
end
--test ca làm_thời gian
insert into calam(mac,tenc,thoigianbd,thoigiankt) values (N'C4',N'Ca tư','23:00:00','17:00:00')
------------------------------------------------------------------------------------------------------------------------
--Kiểm tra giờ làm ngày làm phải nhỏ hơn hoặc bằng ngày hiện tại(Hoàn thành)
create trigger giolam_ngaylam
on giolam
for insert,update
as
begin
	if exists(select * from inserted i where i.ngaylam > getDATE())
	begin
		print N'Ngày làm phải sau ngày hiện tại.'
		rollback tran
	end
end
--test giờ làm_ngày làm
insert into giolam(manv,mac,ngaylam) values (N'NV1',N'C1','24-10-2020')
--------------------------------------------------------------------------------------------------------------------------
--Kiểm tra nhà cung cấp số điện thoại (Hoàn thành)
create trigger nhacungcap_sodienthoai
on nhacungcap
for insert, update
as
begin
	if not exists(select * from inserted i where LEFT(i.sodienthoai,1) = 0)
	begin
		print N'Số điện thoại bắt buộc là số 0 đầu số.'
		rollback tran
	end
	else if not exists(select * from inserted i where len(i.sodienthoai) >= 10 and len(i.sodienthoai) <= 11)
	begin
		print N'Số điện thoại phải có 10 hoặc 11 số.'
		rollback tran
	end
	else if exists(select * from inserted i where i.sodienthoai = '%[a-z]%')
	begin
		print N'Số điện thoại không được nhập ký tự.'
		rollback tran
	end
end
--test nhà cung cấp_số điện thoại
insert into nhacungcap(mancc,tenncc,diachi,sodienthoai,gmail) values (N'NCC2',N'Công ty Chương Dương',N'123 Hàm tử','03679455231','chuongduong@gmail.com')
----------------------------------------------------------------------------------------------------------------------------
--Kiểm tra nhà cung cấp gmail (chưa xong)
--create trigger nhacungcap_gmail
--on nhacungcap
--for insert, update
--as
--begin
	--if not exists(select * from inserted i where i.gmail = '%[A-Z0-9]@gmail.com')
	--begin
		--print N'Gmail không hợp lệ.'
		--rollback tran
	--end
--end
--test nhà cung cấp_gmail
--insert into nhacungcap(mancc,tenncc,diachi,sodienthoai,gmail) values (N'NCC2',N'Công ty Chương Dương',N'123 Hàm tử','0367945523','chuongduong@gmail.com')
------------------------------------------------------------------------------------------------------------------------------
--kiểm tra phiếu nhập mã nhân viên và mã nhà cung cấp có thuộc table của nó ko (hoàn thành)
create trigger phieunhap_manv_mancc
on phieunhap
Instead of insert
as
begin
	--kiểm tra mã nhân viên
	if not exists(select * from inserted i, nhanvien n where i.manv = n.manv)
	begin
		print N'Mã nhân viên không tồn tại.'
		rollback tran
	end
	--Kiểm tra mã nhà cung cấp
	else if not exists(select * from inserted i, nhacungcap n where i.mancc = n.mancc)
	begin
		print N'Mã nhà cung cấp không tồn tại.'
		rollback tran
	end
	else
	--Nếu mã nhân viên và nhà cung cấp hợp lệ thì sẽ add vào table
	begin
		insert into phieunhap
		select * from inserted
	end
end
--test phiếu nhập mã nv vs mã ncc
insert into phieunhap(mapn,manv,mancc,tonggia,ngaynhap,trangthai) values(N'PN2',N'NV1',N'NCC1','15000','24-10-2020',0)
----------------------------------------------------------------------------------------------------------------------------
--Kiểm tra phiếu nhập ngày nhập hàng phải nhỏ hơn hoặc bằng ngày hiện tại (Hoàn thành)
create trigger phieunhap_ngaynhap
on phieunhap
for insert,update
as
begin
	if exists(select * from inserted i where i.ngaynhap > getDATE())
	begin
		print N'Ngày lập phiếu phải sau hoặc bằng ngày hiện tại.'
		rollback tran
	end
end
--test phiếu nhập_ngày nhập
insert into phieunhap(mapn,manv,mancc,tonggia,ngaynhap,trangthai) values(N'PN2',N'NV1',N'NCC1','15000','24-10-2020',0)
----------------------------------------------------------------------------------------------------------------------------
--Kiểm tra ct phiếu nhập xem mã nguyên liệu và mã phiếu nhập có thuộc table không (Hoàn thành) 
create trigger ctphieunhap_manl_mapn
on ctphieunhap
Instead of insert
as
begin
	if not exists(select * from inserted i, phieunhap p where i.mapn = p.mapn)
	begin
		print N'Mã phiếu nhập không tồn tại.'
		rollback tran
	end
	else if not exists(select * from inserted i, nguyenlieu n where i.manl = n.manl)
	begin
		print N'Mã nguyên liệu không tồn tại.'
		rollback tran
	end
	else
	begin
		insert into ctphieunhap
		select * from inserted
	end
end
-- test ct phiếu nhập_manl_mapn
insert into ctphieunhap(mapn,manl,soluong,gia) values (N'PN1',N'NL1',2,30000)
--------------------------------------------------------------------------------------------------------------------------------
--Kiểm tra số lượng và giá của chi tiết phiếu nhập theo đơn vị (Hoàn thành)
--Lấy mã sản phẩm kiếm tra đơn vi
--Kiểm tra giá không quá cao (> 2 triệu)
create trigger ctphieunhap_soluong_gia
on ctphieunhap
for insert,update
as
begin
	--Kiểm tra xem manl có phải là Chai hay không
	if exists(select * from inserted i,nguyenlieu n where i.manl = n.manl and n.madv = N'DV1')
	begin
		--Kiểm tra số chai ko được quá 200
		if exists(select * from inserted i where i.soluong > 200)
		begin
			print N'Không được nhập quá 200 chai.'
			rollback tran
		end
		--Kiểm tra số chai không được âm
		if exists(select * from inserted i where i.soluong < 0)
		begin
			print N'Số chai không được âm.'
			rollback tran
		end
	end
	--Kiểm tra xem manl có phải là Kg hay không
	else if exists(select * from inserted i,nguyenlieu n where i.manl = n.manl and n.madv = N'DV2')
	begin
		--Kiểm tra số Kg không được quá 10Kg
		if exists(select * from inserted i where i.soluong > 10)
		begin
			print N'Không được nhập quá 10Kg.'
			rollback tran
		end
		--Kiểm tra số Kg không được âm
		if exists(select * from inserted i where i.soluong < 0)
		begin
			print N'Số Kg không được âm.'
			rollback tran
		end
	end
	--Kiểm tra xem manl có phải là g hay không
	else if exists(select * from inserted i,nguyenlieu n where i.manl = n.manl and n.madv = N'DV3')
	begin
		--Kiểm tra số Kg không được quá 1000g
		if exists(select * from inserted i where i.soluong > 1000)
		begin
			print N'Không được nhập quá 1000g.'
			rollback tran
		end
		--Kiểm tra số Kg không được âm
		if exists(select * from inserted i where i.soluong < 0)
		begin
			print N'Số g không được âm.'
			rollback tran
		end
	end
	--Kiểm tra giá nhập không đươc quá cao (>2 triệu)
	if exists(select * from inserted i where i.gia > 2000000)
	begin
		print N'Giá nhập không được nhập giá quá cao (>2 triệu).'
		rollback tran
	end
end
--Test đơn vi ctphieunhap
insert into ctphieunhap(mapn,manl,soluong,gia) values (N'PN1',N'NL1',201,15000)
--------------------------------------------------------------------------------------------------------------------------------
--kiểm tra món xem mã loại có thuộc table loại món (Hoàn thành)
create trigger mon_malm
on mon
Instead of insert
as 
begin
	if not exists(select * from inserted i, loaimon l where i.malm = l.malm)
	begin
		print N'Mã loại không tồn tại.'
		rollback tran
	end
	else
	begin
		insert into mon
		select * from inserted
	end
end
--test món_loại món thuộc table
insert into mon(mam,tenmon,malm,anh,giaban,trangthai) values (N'L12',N'Nước Coca',N'L10',N'img/mon/l1/1.jpg',15000,0)
--------------------------------------------------------------------------------------------------------------------------------
--Kiểm tra giá bán của sản phẩm không được quá 100k và giá bán không được âm (Hoàn thành)
create trigger mon_giaban
on mon
for insert, update
as
begin
	if exists(select * from inserted i where i.giaban > 100000)
	begin
		print N'Giá bán không được quá cao'
		rollback tran
	end
	if exists(select * from inserted i where i.giaban < 0)
	begin
		print N'Giá bán không được âm'
		rollback tran
	end
end
--test món_giá bán
insert into mon(mam,tenmon,malm,anh,giaban,trangthai) values (N'L12',N'Nước Coca',N'L1',N'img/mon/l1/1.jpg',150000,0)
--------------------------------------------------------------------------------------------------------------------------------
--Kiểm tra chi tiết món số lượng có đơn vị(Hoàn thành)
create trigger ctmon_soluong
on ctmon
for insert, update
as
begin
	--Kiểm tra đơn vị có phải là Chai không
	if exists(select * from inserted i, nguyenlieu n where i.madv = n.madv and i.madv = N'DV1')
	begin
		--Kiểm tra số Chai chỉ được 1 chai
		if not exists(select * from inserted i where i.soluong = 1)
		begin
			print N'Số lượng chỉ được 1 chai.'
			rollback tran
		end
	end
	--Kiểm tra đơn vị có phải là kg không
	else if exists(select * from inserted i, nguyenlieu n where i.madv = n.madv and i.madv = N'DV2')
	begin
		--Kiểm tra số Kg không được bé hơn 0.
		if not exists(select * from inserted i where i.soluong < 0)
		begin
			print N'Số lượng chỉ được lón hơn 0.'
			rollback tran
		end
	end
	--Kiểm tra đơn vị có phải là g không
	else if exists(select * from inserted i, nguyenlieu n where i.madv = n.madv and i.madv = N'DV3')
	begin
		--Kiểm tra g chỉ 300g
		if not exists(select * from inserted i where i.soluong > 300)
		begin
			print N'Số lượng không được lớn hơn 300g.'
			rollback tran
		end
		--Kiểm tra số Kg không được bé hơn 0.
		if not exists(select * from inserted i where i.soluong < 0)
		begin
			print N'Số lượng chỉ được lón hơn 0.'
			rollback tran
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------
--Kiểm tra hóa đơn manv với makh có thuộc table của nó không (Hoàn thành)
create trigger hoadon_manv_makh
on hoadon
Instead of insert
as 
begin
	if not exists(select * from inserted i, nhanvien n where i.manv = n.manv)
	begin
		print N'Mã nhân viên không tồn tại.'
		rollback tran
	end
	else if not exists(select * from inserted i, khachhang k where i.makh = k.makh)
	begin
		print N'Mã khách hàng không tồn tại.'
		rollback tran
	end
	else
	begin
		insert into hoadon
		select * from inserted
	end
end
--test hóa đơn_manv và makh
insert into hoadon(mahd,manv,makh,ngaylap,tongtien,khuyenmai,tientra,trangthai) values (N'HD2',N'NV1',N'KH1','10-10-2020',15000,0,15000,0)
--------------------------------------------------------------------------------------------------------------------------------
--Kiểm tra hóa đơn phải có sản phẩm
create trigger hoadon_tongtien
on hoadon
for insert
as
begin
	if exists(select * from inserted i where i.tongtien <= 0)
	begin
		print N'Hóa đơn phải có sản phẩm.'
		rollback tran
	end
	else if exists(select * from inserted i where i.khuyenmai > i.tongtien)
	begin
		print N'Tiền khuyến mãi không được nhiều hơn tổng tiền.'
		rollback tran
	end
	else if exists(select * from inserted i where i.tongtien < i.tientra)
	begin
		print N'Tiền trả phải nhỏ hơn hoặc bằng tổng tiền.'
		rollback tran
	end
end
--test hóa đơn
insert into hoadon(mahd,manv,makh,ngaylap,tongtien,khuyenmai,tientra,trangthai) values (N'HD2',N'NV1',N'KH1','10-10-2020',0,0,15000,0)
--------------------------------------------------------------------------------------------------------------------------------
--Kiểm tra cthoadon mahd và mam xem có trong table ko (Hoàn thành)
create trigger cthoadon_mahd_mam
on cthoadon
Instead of insert
as
begin
	--kiểm tra mã hd có tồn tại ko
	if exists(select * from inserted i, hoadon h where i.mahd = h.mahd)
	begin
		print N'Mã hóa đơn không tồn tại.'
		rollback tran
	end
	--kiểm tra mã món có tồn tại ko
	else if exists(select * from inserted i, mon m where i.mam = m.mam)
	begin
		print N'Mã món không tồn tại.'
		rollback tran
	end
	else
	begin
		insert into cthoadon
		select * from inserted
	end
end
--------------------------------------------------------------------------------------------------------------------------------
--Kiểm tra cthoadon số lượng và giá
create trigger cthoadon_soluong_gia
on cthoadon
for insert, update
as
begin
	--kiểm tra số lượng không quá 100 món.
	if exists(select * from inserted i where i.soluong > 200)
	begin
		print N'Số lượng không được quá nhiều.'
		rollback tran
	end
	--kiểm tra tổng giá = đơn giá * số lượng
	if not exists(select * from inserted i where i.soluong * i.dongia = i.tonggia)
	begin
		print N'Tổng giá phải bằng đơn giá nhân số lượng.'
		rollback tran
	end
end
--test cthoadon_số lượng_giá
insert into cthoadon(mahd,mam,dongia,soluong,tonggia) values (N'HD1',N'L11',15000,101,15000)
------------------------------------------------------------------------------------------------
--Kiểm tra tài khoản không được trùng nhau
create trigger taikhoan_tentk
on taikhoan
for insert, update
as
begin
	if exists(select * from inserted i, taikhoan t where i.tentk = t.tentk)
	begin
		print N'Tài khoản không được giống nhau.'
		rollback tran
	end
end
--test
insert into nhanvien(manv,honv,tennv,gioitinh,ngaysinh,diachi,cmnd,sodienthoai,ngayvaolam,chucvu,trangthai) values (N'NV2',N'Nguyễn',N'Phong Phú',N'Nam','18-02-2000',N'A1/20Q, ấp 1, xã Vĩnh Lộc A, huyện Bình Chánh','1234567894','0367945523','10-10-2020',N'AD',0)
insert into taikhoan(manv,tentk,matkhautk) values (N'NV2',N'admin',N'admin')