
--Phải set Datetime lại trước khi chạy
use csdlcaphe
go
set DATEformat DMY 
select * from calam
select * from chucvu
select * from cthoadon
select * from ctkhuyenmai
use csdlcaphe
go
--Đơn vị
insert into donvi(madv,tendv) values (N'DV1',N'Chai')
insert into donvi(madv,tendv) values (N'DV2',N'Kg')
insert into donvi(madv,tendv) values (N'DV3',N'g')
--Chức vụ
insert into chucvu(macv,chucvu,luong,trangthai) values (N'PC',N'Pha chế',25000,1)
insert into chucvu(macv,chucvu,luong,trangthai) values (N'PV',N'Phục vụ',20000,1)
insert into chucvu(macv,chucvu,luong,trangthai) values (N'QL',N'Quản lý',40000,1)
insert into chucvu(macv,chucvu,luong,trangthai) values (N'AD',N'Admin',0,1)
--Ca làm
insert into calam(mac,tenc,thoigianbd,thoigiankt,gio) values (N'C1',N'Ca một','06:00:00','12:00:00','6:00:00')
insert into calam(mac,tenc,thoigianbd,thoigiankt,gio) values (N'C2',N'Ca hai','12:00:00','17:00:00','5:00:00')
insert into calam(mac,tenc,thoigianbd,thoigiankt,gio) values (N'C3',N'Ca ba','17:00:00','23:00:00','6:00:00')
--Nhà cung cấp
insert into nhacungcap(mancc,tenncc,diachi,sodienthoai,gmail) values (N'NCC1',N'Công ty Pepsi',N'123 Chương Dương',N'0367945523',N'pepsico@gmail.com')
--Loại món
insert into loaimon(malm,tenlm) values (N'L1','Nước ngọt')
insert into loaimon(malm,tenlm) values (N'L2','Nước ép')
insert into loaimon(malm,tenlm) values (N'L3','Sinh Tố')
--Nguyên liệu
insert into nguyenlieu(manl,madv,tennl,soluong,mancc,ngaynhapgannhat,gianhap,trangthai) values (N'NL1',N'DV1',N'Pepsi',48,N'NCC1','10-10-2020',6000,0)
--Món
insert into mon(mam,tenmon,malm,anh,giaban,trangthai) values (N'L11',N'Nước Pepsi',N'L1',N'img/mon/l1/1.jpg',15000,0)
--Chi tiết món
insert into ctmon(mam,manl,madv,soluong) values (N'L11',N'NL1',N'DV1',1)
--Khachhang
insert into khachhang(makh,hokh,tenkh,gioitinh,ngaysinh,sodienthoai,ngaytaothanhvien,diemtichluy,trangthai) values (N'KH1',N'Nguyễn',N'Phong Phú',N'Nam','2000-02-18',N'0367945523','2020-10-10',1,0)
--nhanvien
insert into nhanvien(manv,honv,tennv,gioitinh,ngaysinh,diachi,cmnd,sodienthoai,ngayvaolam,chucvu,trangthai) values (N'NV1',N'Nguyễn',N'Phong Phú',N'Nam','2000-02-18',N'A1/20Q, ấp 1, xã Vĩnh Lộc A, huyện Bình Chánh','1234567894','0367945523','2020-10-10',N'AD',1)
--taikhoan
insert into taikhoan(manv,tentk,matkhautk) values (N'NV1',N'admin',N'admin')
--appbanhang
insert into appbanhang(maapp,tenapp,phidichvu) values (N'AP1',N'Go Việt',5000)
--luong
--lương lấy lương cb ở chức vụ nhân cho số giờ là được tổng kết ở bảng giờ làm
insert into luong(manv,tonggiolam,tienluong,trangthai) values (N'NV1',0,0,0)
--phieunhap
--phieunhap(tonggia) = ctphieunhap(soluong)*ctphieunhap(gia)
insert into phieunhap(mapn,manv,mancc,tonggia,ngaynhap,trangthai) values (N'PN1',N'NV1',N'NCC1',15000,'10-10-2020',0)
--ctphieunhap
--Giá là giá 1 sản phẩm
insert into ctphieunhap(mapn,manl,soluong,gia) values (N'PN1',N'NL1',1,15000)
--khuyenmai
insert into khuyenmai(makm,tenctkm,noidungctkm,ngaybd,ngaykt,trangthai) values (N'KM1',N'Khai trương',N'Thích thì giảm','02-10-2020','02-11-2020',0)
--ctkhuyenmai
insert into ctkhuyenmai(makm,mam,tiengiam) values (N'KM1',N'L11',5)
--uudai
insert into uudai(maud,tenud,dieukienud,tiengiam,trangthai) values (N'UD1',N'Đồng',10,2,0)
--hoadon
insert into hoadon(mahd,manv,makh,maapp,ngaylap,madontrenapp,tongtien,makhuyenmai,maud,tientra,trangthai) values (N'HD1',N'NV1',N'KH1',N'AP1','10-10-2020',N'ACXAZF125',15000,N'KM1',N'UD1',15000,0)
--cthoadon
insert into cthoadon(mahd,mam,dongia,soluong,tonggia) values (N'HD1',N'L11',15000,1,15000)
