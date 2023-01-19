create or alter procedure ods.PRC_FULL_LOAD (@p_date as date )as
begin

declare @v_seq float;
declare @v_rows_count float;
declare @v_message varchar(50);

set nocount on;
select @v_seq = next value for n_seq;

insert into process_log_hdr(process_sequence, process_type, process_name, refrence_date, status, message, row_count, start_date, end_date, duration)
	values( @v_seq, 'load', 'full_load', @p_date, 'started', null, 0, getdate(), null, null)
	delete from ods.tmp_employees where hire_date=@p_date

insert into ods.tmp_employees
select* from dbo.employees
where hire_date=@p_date
--update ods.tmp_employees


	
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
--select * into ods.tmp_employees
--from dbo.employees
--where 2 = 0
--select*from employees

/*exec ods.PRC_FULL_LOAD '2005-09-21'
select * from ods.tmp_employees
select* from employees
select * from ods.process_log_hdr where process_name = 'full_load'
--alter table ods.tmp_employees drop column date_run  */