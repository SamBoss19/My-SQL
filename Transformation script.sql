select * from ods.tmp_primostudent
--transformation
-- We want to get enrollment date key, period in ds of enrollment
--capitalize the student name
--add African flag(y/n)
select * from [TGT].[tmp_primostudent]
insert into [TGT].[tmp_primostudent](
 Date_key_for_enrollment, period_in_days_of_enrollment, 
Date_of_enrolment, student_id, Student_name, country, continent, African_flag, 
Date_modified, Date_run
)
select cast(replace(Date_of_enrolment,'-','')as int)Date_key_for_enrollment,  datediff (day,Date_of_enrolment, cast(getdate() as date)) period_in_days_of_enrollment, 
Date_of_enrolment, student_id, upper(Student_name) , country, continent, case when continent = 'Africa' then 'Y' else 'N' end African_flag, 
Date_modified, Date_run from [ODS].[tmp_primostudent]

select case when continent = 'Africa' then 'Y' else 'N' end from ods.tmp_primostudent