Create Database csdlcaphe
use csdlcaphe
go
--1
create table chucvu
(
	macv nvarchar(5) primary key not null,
	chucvu nvarchar(20) not null,
	luong int not null,
	trangthai int not null
)
--2
create table nhanvien
(
	manv nvarchar(5) primary key not null,
	honv nvarchar(20) not null,
	tennv nvarchar(20) not null,
	gioitinh nvarchar(5) not null,
	ngaysinh datetime not null,
	diachi nvarchar(100) not null,
	cmnd nvarchar(15) not null,
	sodienthoai nvarchar(15) not null,
	ngayvaolam datetime not null,
	chucvu nvarchar(5) foreign key references chucvu(macv) not null,
	trangthai int not null
)
--3
create table calam
(
	mac nvarchar(5) primary key not null,
	tenc nvarchar(10) not null,
	thoigianbd time not null,
	thoigiankt time not null,
	gio time not null --(thoigiankt-thoigianbd)
)
--4
create table giolam
(
	manv nvarchar(5) foreign key references nhanvien(manv) not null,
	mac nvarchar(5) foreign key references calam(mac) not null,
	ngaylam datetime not null,
	primary key(manv,mac)
)
--5
create table taikhoan
(
	manv nvarchar(5) foreign key references nhanvien(manv) not null,
	tentk nvarchar(20) not null,
	matkhautk nvarchar(20) not null
)
--6
create table luong
(
	manv nvarchar(5) foreign key references nhanvien(manv) not null,
	tonggiolam int not null,
	tienluong int not null,
	trangthai int not null
)
--7
create table nhacungcap
(
	mancc nvarchar(5) primary key not null,
	tenncc nvarchar(30) not null,
	diachi nvarchar(100) not null,
	sodienthoai nvarchar(15) not null,
	gmail nvarchar(50) not null
)
--8
create table phieunhap
(
	mapn nvarchar(5) primary key not null,
	manv nvarchar(5) foreign key references nhanvien(manv) not null,
	mancc nvarchar(5) foreign key references nhacungcap(mancc) not null,
	tonggia int not null,
	ngaynhap datetime not null,
	trangthai int not null
)
--9
create table donvi
(
	madv nvarchar(5) primary key not null,
	tendv nvarchar(10) not null
)
--10
create table nguyenlieu
(
	manl nvarchar(5) primary key not null,
	madv nvarchar(5) foreign key references donvi(madv)not null,
	tennl nvarchar(20) not null,
	soluong int not null,
	mancc nvarchar(5) foreign key references nhacungcap(mancc) not null,
	ngaynhapgannhat datetime not null,
	gianhap int not null,
	trangthai int not null
)
--11
create table ctphieunhap
(
	mapn nvarchar(5) foreign key references phieunhap(mapn) not null,
	manl nvarchar(5) foreign key references nguyenlieu(manl) not null,
	soluong int not null,
	gia int not null
)
--12
create table loaimon
(
	malm nvarchar(5) primary key not null,
	tenlm nvarchar(30) not null
)
--13
create table mon 
(
	mam nvarchar(5) primary key not null,
	tenmon nvarchar(20) not null,
	malm nvarchar(5) foreign key references loaimon(malm) not null,
	anh nvarchar(100) not null,
	giaban int not null,
	trangthai int not null
)
--14
create table ctmon
(
	mam nvarchar(5) foreign key references mon(mam) not null,
	manl nvarchar(5) foreign key references nguyenlieu(manl) not null,
	madv nvarchar(5) foreign key references donvi(madv)not null,
	soluong int not null
)
--15
create table khachhang
(
	makh nvarchar(5) primary key not null,
	hokh nvarchar(20) not null,
	tenkh nvarchar(20) not null,
	gioitinh nvarchar(5) not null,
	ngaysinh datetime not null,
	sodienthoai nvarchar(15) not null,
	ngaytaothanhvien datetime not null,
	diemtichluy int not null,
	trangthai int not null
)
--16
create table khuyenmai
(
	makm nvarchar(5) primary key not null,
	tenctkm nvarchar(50) not null,
	noidungctkm nvarchar(100) not null,
	ngaybd datetime not null,
	ngaykt datetime not null,
	trangthai int not null
)
--17
create table ctkhuyenmai
(
	makm nvarchar(5) foreign key references khuyenmai(makm) not null,
	mam nvarchar(5) foreign key references mon(mam) not null,
	tiengiam int not null
)
--18
create table uudai
(
	maud nvarchar(5) primary key not null,
	tenud nvarchar(50) not null,
	dieukienud int not null, 
	tiengiam int not null,
	trangthai int not null
)
--19
create table appbanhang
(
	maapp nvarchar(5) primary key not null,
	tenapp nvarchar(50) not null,
	phidichvu int not null
)
--20
create table hoadon
(
	mahd nvarchar(5) primary key not null,
	manv nvarchar(5) foreign key references nhanvien(manv) not null,
	makh nvarchar(5) foreign key references khachhang(makh),
	maapp nvarchar(5) foreign key references appbanhang(maapp),
	ngaylap datetime not null,
	madontrenapp nvarchar(20),--Nếu bán ở quán thì không có mã đơn trên app
	--phidichvu int,t nghĩ là ko cần cái này vì mình đã liên kết khóa qua app rùi.
	tongtien int not null,
	makhuyenmai nvarchar(5) foreign key references khuyenmai(makm),
	maud nvarchar(5) foreign key references uudai(maud),
	tientra int not null,--Tien sau khi tru khuyen mai
	trangthai int not null
)
--21
create table cthoadon
(
	mahd nvarchar(5) foreign key references hoadon(mahd) not null,
	mam nvarchar(5) foreign key references mon(mam) not null,
	dongia int not null,
	soluong int not null,
	tonggia int not null
)