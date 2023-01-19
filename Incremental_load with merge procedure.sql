create or alter procedure ods.PRC_INCREMENTAL_LOAD_MERGE (@p_date as date )as
begin

declare @v_seq float;
declare @v_rows_count float;
declare @v_message varchar(50);

set nocount on;
select @v_seq = next value for n_seq;

insert into process_log_hdr(process_sequence, process_type, process_name, refrence_date, status, message, row_count, start_date, end_date, duration)
	values( @v_seq, 'increamental_merge', 'prc_incremental_load_merge', @p_date, 'started', null, 0, getdate(), null, null)
	truncate table ods.temp_primostudent

insert into ods.temp_primostudent
select Date_of_enrolment, student_id, Student_name, country, continent, date_modified
from dbo.tmp_primostudent
where Date_modified=@p_date

	MERGE into ods.tmp_primostudent as a USING ods.temp_primostudent as b on (a.student_id=b.student_id) 
	WHEN MATCHED  
	THEN UPDATE 
	SET a.student_id=b.student_id, 
	a.Date_of_enrolment=b.Date_of_enrolment,  
	a.Student_name=b.Student_name, a.country=b.country , 
	a.continent=b.continent,
	a.date_modified = b.date_modified,
	a.date_run = getdate()
	
	WHEN NOT MATCHED BY target 
	THEN INSERT (Date_of_enrolment,student_id,Student_name,country ,continent,date_modified, date_run)   
	VALUES(b.Date_of_enrolment,b.student_id,b.Student_name,b.country ,b.continent, b.date_modified, cast(getdate() as date));
truncate table tgt.tmp_primostudent
	insert into [TGT].[tmp_primostudent](
 Date_key_for_enrollment, period_in_days_of_enrollment, 
Date_of_enrolment, student_id, Student_name, country, continent, African_flag, 
Date_modified, Date_run
)
select cast(replace(Date_of_enrolment,'-','')as int)Date_key_for_enrollment,  datediff (day,Date_of_enrolment, cast(getdate() as date)) period_in_days_of_enrollment, 
Date_of_enrolment, student_id, upper(Student_name) , country, continent, case when continent = 'Africa' then 'Y' else 'N' end African_flag, 
Date_modified, Date_run from [ODS].[tmp_primostudent]
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
