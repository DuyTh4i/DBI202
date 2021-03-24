--Tìm những nhân viên tài xế từng làm ca 1--
select Employees.*
from Employees join Runs on Employees.EID = Runs.EID_Driver
where E_Shift = 1

--Hiển thị EID,LicensePlate, Date, Shift của nhân viên từng lái xe--
select EID,name, Buses.LicensePlate, Date, E_Shift as Shift
from Employees left outer join Runs on Employees.EID = Runs.EID_Driver
				left outer join Buses on Runs.LicensePlate = Buses.LicensePlate

--Hiện thị Date, Shift các ca làm việc của nhân viên có tên Đinh Ngọc Tùng--
select Date, E_Shift as Shift
from Runs
where EID_Driver = (select EID from Employees where name = N'Đinh Ngọc Tùng')
		or EID_Conductor = (select EID from Employees where name = N'Đinh Ngọc Tùng')

--Hiện thị thông tin xe đi trên tuyến có dừng ở trạm bus 03--
select distinct Buses.*
from Runs join (
				select Routes.RNO, Stations.StationID
				from Routes join Across on Routes.RNO = Across.RNO
							join Stations on Across.StationID = Stations.StationID
				where Stations.StationID = 09) as t on Runs.RNO = t.RNO
				join Buses on Runs.LicensePlate = Buses.LicensePlate

--Hiển thị RNO, NumberOfStation với NumberOfStation là số trạm của mỗi tuyến đường--
select RNO, count(StationID) as NumberOfStation
from Across
group by RNO
