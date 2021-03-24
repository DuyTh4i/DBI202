use [QuanLyBus_Nhom_8]
go
alter table Routes
add constraint df_stime
default '05:00:00' for StartTime
-----------------------------------
alter table Routes
add constraint df_etime
default '22:00:00' for EndTime
-----------------------------------
alter table Routes
add constraint df_ftime
default '00:15:00' for Frequence