use [QuanLyBus_Nhom_8]
go
	--Khi thêm thông tin xe bus mới,
	--hiện tuyến đường có tần suất lớn nhất--
	create trigger  bs
	on Buses
	for insert
	as
	begin
		select top 1 *
		from Routes
		order by Frequence desc
	end