create database [QuanLyBus_Nhom_8]
go
use [QuanLyBus_Nhom_8]
go
create table Buses(
	LicensePlate varchar(10) primary key,
	StartUseAtYear int
)

create table Employees(
	EID varchar(5) primary key,
	Name nvarchar(50),
	Phone varchar(11),
)

create table Stations(
	StationID int primary key,
	Address nvarchar(100)
)

create table Routes(
	RNO varchar(5) primary key,
	StartTime time,
	EndTime time,
	Frequence time
)

create table Across(
	RNO varchar(5) references Routes,
	StationID int references Stations,
	Station_Order int,
	primary key (RNO, StationID)
)

create table Runs(
	LicensePlate varchar(10) references Buses,
	EID_Driver varchar(5) references Employees,
	EID_Conductor varchar(5) references Employees,
	Date date,
	RNO varchar(5) references Routes,
	E_Shift int,
	primary key (LicensePlate, EID_Driver, EID_Conductor, Date)
)