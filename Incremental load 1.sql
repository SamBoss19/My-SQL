--DBO (Source schema)
--create operational datastore schema ODS (Operational datastore)- this would house the data as the source
/*create schema ODS
--create target schema TGT (Target)- this would house our refined data
create schema TGT*/
-- create procedure with parameter

/*create table [ods].[process_log_hdr](
	[process_sequence] [int] NULL,
	[process_type] [varchar] (50) NULL,
	[process_name] [varchar] (50) NULL,
	[refrence_date] [varchar] (50) NULL,
	[status] [varchar] (50) NULL,
	[message] [varchar] (50) NULL,
	[row_count] [int] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[duration] [numeric] (18,0) NULL
	)*/
--select* from ods.process_log_hdr;
--to populate some columns


--sequence creating procedure
/*create sequence [ods].[n_seq]
as [bigint]
start with 1
minvalue 1
maxvalue 10000
cycle
no cache*/




--creating a table inside dbo database
/*create table tmp_incremental_testtab( 
Date_of_transaction  datetime not null, 
cutomer_id  varchar(3), 
Customer_name  varchar(30) not null, 
country varchar(30), 
continent  varchar(30), 
AMount_spend Numeric )
insert into  tmp_incremental_testtab 
select '2022-10-01','100','West Brown','Kenya','Africa',150 union 
select '2022-10-01','101','Tunde Ayeni','Nigeria','Africa',100 union 
select '2022-10-01','102','Pauline Mwinka','Kenya','Africa',90 union 
select '2022-10-01','103','Ejiro Omonode','Nigeria','Africa',80  union 
select '2022-10-01','104','KWAME Brown','Ghana','Africa',200
insert into  tmp_incremental_testtab 
select '2022-10-02','100','West Brown','Kenya','Africa',160  union 
select '2022-10-02','101','Tunde Ayeni','Nigeria','Africa',130  union 
select '2022-10-02','102','Pauline Mwinka','Kenya','Africa',190 union 
select '2022-10-02','103','Ejiro Omonode','Nigeria','Africa',180 union 
select '2022-10-02','104','KWAME Brown','Ghana','Africa',250
select * from ods.tmp_incremental_testtab
insert into  tmp_incremental_testtab 
select '2022-10-03','100','West Brown','Kenya','Africa',350 union 
select '2022-10-03','101','Tunde Ayeni','Nigeria','Africa',200  union 
select '2022-10-03','102','Pauline Mwinka','Kenya','Africa',290 union 
select '2022-10-03','103','Ejiro Omonode','Nigeria','Africa',180 union 
select '2022-10-03','104','KWAME Brown','Ghana','Africa',300
*/

--to create a table that is identical to a table you are working on
/*select * into
ods.tmp_incremental_testtab
from 
dbo.tmp_incremental_testtab
where 1 = 0

alter table ods.tmp_incremental_testtab add date_run_ods date*/


--select distinct date_of_transaction
--from tmp_incremental_testtab





alter procedure ods.PRC_INCREMENTAL_LOAD (@p_date as date )as
begin

declare @v_seq float;
declare @v_rows_count float;
declare @v_message varchar(50);

set nocount on;
select @v_seq = next value for n_seq;

insert into process_log_hdr(process_sequence, process_type, process_name, refrence_date, status, message, row_count, start_date, end_date, duration)
	values( @v_seq, 'increamental', 'prc_incremental_load', @p_date, 'started', null, 0, getdate(), null, null)
	delete from ods.tmp_incremental_testtab where date_of_transaction = @p_date
	--or you truncate column in some cases

insert into ods.tmp_incremental_testtab(Date_of_transaction, cutomer_id, Customer_name, country, continent, AMount_spend, date_run_ods)
select Date_of_transaction, cutomer_id, Customer_name, country, continent, AMount_spend, cast(getdate() as date)
from dbo.tmp_incremental_testtab 
where Date_of_transaction = @p_date
set @v_rows_count = @@ROWCOUNT

set @v_message = 'Completed Successfully';        
update process_log_hdr          
set status       = 'COMPLETED',              
	message      = 'SUCCESS',               
	row_count    = @v_rows_count,                
	end_date     = getdate()               
	--duration     = (getdate() - start_date) * 24 * 3600           
	where process_sequence = @v_seq;                
end;


