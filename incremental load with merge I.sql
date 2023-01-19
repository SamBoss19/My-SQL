create table dbo.tmp_primostudent( ID int identity(1,1), Date_of_enrolment  date not null, student_id  varchar(3), Student_name  varchar(30) not null, country varchar(30), continent  varchar(30))
insert into  dbo.tmp_primostudent 
select '2022-10-03','105','KWAME ADO','Ghana','Africa' union 
select '2022-10-03','100','West Brown','Kenya','Africa' union 
select '2022-10-03','101','Tunde Ayeni','Nigeria','Africa' union 
select '2022-10-03','102','Pauline Mwinka','Kenya','Africa' union 
select '2022-10-03','103','Ejiro Omonode','Nigeria','Africa' 

select * into ods.tmp_primostudent
from dbo.tmp_primostudent
where 1 = 0

select * into ods.temp_primostudent
from dbo.tmp_primostudent
where 1 = 0

alter table dbo.tmp_primostudent add Date_modified date
alter table ods.tmp_primostudent add Date_run date
select * from ods.temp_primostudent 
update dbo.tmp_primostudent
set date_modified ='2022-10-04'
where student_id not in (100,101,102)




exec ods.prc_incremental_load_merge '2022-10-03'
select * from ods.process_log_hdr where process_name = 'prc_incremental_load_merge'
select * from ods.tmp_primostudent
select * from ods.temp_primostudent
select * from tgt.tmp_primostudent
select * from dbo.tmp_primostudent