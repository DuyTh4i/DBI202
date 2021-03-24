use [QuanLyBus_Nhom_8]
go

	--Hiển thị các trạm dừng
	--và thứ tự của mỗi trạm của tuyến đường được nhập vào--
	create proc pr1 @RNO varchar(5)
	as
	begin
		select Address as Station_Address, Station_Order
		from Across join Stations on Across.StationID=Stations.StationID
		where RNO = @RNO
		order by Station_Order asc
	end


