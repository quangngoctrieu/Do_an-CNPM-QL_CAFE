--Chỉnh sửa trigger kiểm tra gmail
Create trigger nhacungcap_gmail
on nhacungcap
for insert, update
as
begin
	if not exists(select * from inserted i where i.gmail LIKE '%[A-Z0-9]@gmail.com')
	begin
		print N'Gmail không hợp lệ.'
		rollback tran
	end
end

--Nhà cung cấp
insert into nhacungcap(mancc,tenncc,diachi,sodienthoai,gmail) values (N'NCC2',N'Cty cafe nguyên chất T.Nguyên',N'115 Đồng Văn Cống, Phường Thạnh Mỹ Lợi, Quận 2, Thành phố Hồ Chí Minh',N'0944334343',N'caphenguyenchat@gmail.com')
insert into nhacungcap(mancc,tenncc,diachi,sodienthoai,gmail) values (N'NCC3',N'Cty Uyên Phương Coffee',N'340 Phạm Hùng Phường 5 Quận 8 TP HCM',N'0944614615 ',N' upcoffeebmt@gmail.com')
insert into nhacungcap(mancc,tenncc,diachi,sodienthoai,gmail) values (N'NCC4',N'Công ty TNHH Buôn Mê Coffee',N'35/4A Ao Đôi, Bình Trị Đông A, Quận Bình Tân, Tp.HCM',N'0909555301',N'buonmecoffee@gmail.com')

--Nguyên liệu
insert into nguyenlieu(manl,madv,tennl,soluong,mancc,ngaynhapgannhat,gianhap,trangthai) values (N'NL2',N'DV2',N'Cà phê hạt',5,N'NCC2','12-10-2020',160000,0)
insert into nguyenlieu(manl,madv,tennl,soluong,mancc,ngaynhapgannhat,gianhap,trangthai) values (N'NL3',N'DV2',N'Espresso Blend',5,N'NCC2','12-10-2020',200000,0)
insert into nguyenlieu(manl,madv,tennl,soluong,mancc,ngaynhapgannhat,gianhap,trangthai) values (N'NL4',N'DV2',N'Black Tea',0.5,N'NCC2','12-10-2020',780000,0)
insert into nguyenlieu(manl,madv,tennl,soluong,mancc,ngaynhapgannhat,gianhap,trangthai) values (N'NL5',N'DV2',N'Ca cao',5,N'NCC2','12-10-2020',300000,0)
insert into nguyenlieu(manl,madv,tennl,soluong,mancc,ngaynhapgannhat,gianhap,trangthai) values (N'NL6',N'DV2',N'Robusta Honey',2,N'NCC3','12-10-2020',120000,0)
insert into nguyenlieu(manl,madv,tennl,soluong,mancc,ngaynhapgannhat,gianhap,trangthai) values (N'NL7',N'DV2',N'Cà phê chồn',2,N'NCC4','12-10-2020',6000000,0)

