
SQL Masterclass
select * from my_first_table order by appl_id asc;

delete from my_first_table
 where appl_id = 1

update my_first_table
set appl_group = 'Resilient'
where appl_group = '';


insert into my_first_table (appl_id, gender)
values( 8, '' );


select * into my_second_table6 from my_first_table 
where appl_id in (1,3,4);

select * from my_second_table6;

truncate table my_second_table5;

drop table my_second_table5;

insert into my_second_table6 select * from my_first_table;

--Display details of jobs where the minimum salary is greater than 10000.
-->
select * from jobs where min_salary > 10000;

--Display the first name and join date of the employees who joined between 2002 and 2005.
--as, left, year
select first_name, hire_date as join_date from employees
  where hire_date between '2002-01-01' and '2005-12-31';

  select first_name, hire_date as join_date from employees
  where left(hire_date,4) between '2002' and '2005';

    select first_name, hire_date as join_date, year(hire_date) from employees
  where year(hire_date) between '2002' and '2005';

  --Display first name and join date of the employees who is either IT Programmer or Sales Man.
  --in
  --or
  select first_name, hire_date as join_date, job_id from employees
    where job_id in ('SA_MAN', 'IT_PROG');
  select first_name, hire_date as join_date, job_id from employees
    where job_id = 'SA_MAN'
  or job_id = 'IT_PROG';

--Display employees who joined after 1st January 2008.
-->
select * from employees
where hire_date > '01/01/2008';

-- display the details of employees with ID 150 OR 160.
--in
SELECT * 
FROM employees
WHERE employee_id IN (150, 160);

-- display first name, last name, salary, commission pct, and hire date for employees with salary less than 10000
-- <
SELECT first_name, last_name, salary, commission_pct, hire_date 
FROM employees
WHERE salary < 10000;

-- display job title, the difference between the minimum and maximum for salaries for jobs with max salary in the range 10000 to 20000
--minus (-)
SELECT job_title, max_salary - min_salary AS salary_diff 
FROM jobs
WHERE max_salary between 10000 and 20000;


--Display first name, salary, and round the salary to thousands.
--round
select first_name, salary , ROUND(salary,-3) rounded_salary
from employees;


--Display details of jobs in the descending order of the title.
--desc
select * from jobs order by job_title desc;

--Display employees where the first name or last name starts with S
--like
select * from employees
  where first_name like 'S%'  or last_name like 'S%';

--Display employees who joined in the month of May.
--month or to_char
SELECT *
  FROM employees
WHERE MONTH(hire_date) = '05';

--Display details of the employees where commission percentage is null 
  --and salary in the range 5000 to 10000 and department is 50.
  --is null
  Select *
from EMPLOYEES
where COMMISSION_PCT is null
AND salary between 5000 AND 10000
AND department_id = '50';

--Display first name and date of first salary of the employees.
--eomonth, datediff, getdate(), dateadd
select first_name, hire_date, EOMONTH (hire_date) first_salary_date from employees;

select first_name, hire_date, dateadd(month, datediff(month, 0, hire_date) + 1, 0) -1
  as first_salary_date from employees;

  select getdate()

  --Display first name and experience of the employees.
  select first_name, datediff(dd, hire_date, getdate())/365 as years_of_experience 
from employees;

SELECT first_name, (YEAR(GETDATE()) - YEAR(hire_date)) AS years_of_experience
FROM employees;


SQL Masterclass
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE FROM EMPLOYEES WHERE YEAR(HIRE_DATE) = 2001

SELECT JOB_TITLE FROM JOBS

SELECT JOB_ID, SUBSTRING(JOB_TITLE,1,1)
FROM JOBS



SELECT JOB_TITLE,
LEFT (JOB_TITLE, CASE WHEN CHARINDEX(' ', JOB_TITLE) = 0
THEN LEN(JOB_TITLE) ELSE  CHARINDEX(' ', JOB_TITLE) END) AS FIRST_WORD,  
CHARINDEX(' ', JOB_TITLE) FROM JOBS

SELECT LEFT (JOB_TITLE, 6), SUBSTRING (JOB_TITLE, 1, 9) FROM JOBS


Select LEFT(job_title,
CHARINDEX(' ',job_title + ' ')-1)
AS FirstWord from jobs;

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE ('__B%');


SELECT first_name, last_name
FROM Employees
WHERE last_name LIKE '___b%'

select first_name, last_name
from employees
where last_name like ('___%b%');

select first_name, last_name
from employees WHERE CHARINDEX('B', LAST_NAME) > 3

SELECT UPPER(first_name), LOWER(email)
FROM employees
--WHERE LOWER(first_name) = LOWER(email);


SELECT first_name, last_name, hire_date
FROM Employees
WHERE YEAR (hire_date) = 2008

SELECT YEAR(MAX(HIRE_DATE)) FROM Employees

SELECT getdate(), SYSDATETIME()

select DATEDIFF(day, cast('05/20/2011' as date), getdate()) -- 4113

select getdate()

SELECT DISTINCT DATEDIFF(DAY, '2011-01-01', SYSDATETIME()) AS Days;


SELECT DISTINCT DATEDIFF(DAY, 2011-01-01, SYSDATETIME()) AS Days;

select distinct year(hire_date)from employees where year(hire_date) = 2002

select * from employees where year(hire_date) = 2002

select * from employees

SELECT MONTH(hire_date) month, COUNT(*) no_of_emp
FROM employees
GROUP BY MONTH(hire_date);

select datename(month, hire_date) as month,
COUNT(employee_id) as employees_joined_per_month
from employees
where year(hire_date) = 2002
group by datename(month, hire_date);

select datename(month, hire_date) as month_name, -- extract the name of the month,
month( hire_date) nonth_number,
  count(employee_id) no_employees_employed -- the count
from employees
where year(hire_date) = 2008
group by datename(month, hire_date), month( hire_date) -- this helping split values
order by month( hire_date)

select * from employees where year(hire_date) = 2008

SELECT manager_id, COUNT(Employee_id)
FROM Employees
group by manager_id


/* examples of aggregate funtion
- count
- sum
-min
- max
- average
*/

select * from employees

select * from JOB_HISTORY

SELECT TOP 1 employee_id, end_date FROM job_history
ORDER BY 2 desc

select * from JOB_HISTORY order by EMPLOYEE_ID

SELECT Employee_id, max(end_date) recent_date
FROM job_history
Group by employee_id

select  COUNT (employee_id) from EMPLOYEES
where DAY(HIRE_DATE) > 15




select * from EMPLOYEES
where DAY(HIRE_DATE) = 15

select country_id, postal_code,
count( city) as count_of_city
from LOCATIONS
group by country_id, postal_code

select * from LOCATIONS where country_id = 'US'

select  count (distinct country_id )from LOCATIONS --where country_id = 'US'





select case when department_id is null then -1 else department_id end,
     convert(decimal(10,0),avg(salary))
 AS Average_Salary
from employees
where COMMISSION_PCT is not null --and DEPARTMENT_ID = 80
group by case when department_id is null then -1 else department_id end

select isnull(department_id, 100),
     avg(salary)
 AS Average_Salary
from employees
where COMMISSION_PCT is not null --and DEPARTMENT_ID = 80
group by department_id

select case when department_id = 80 then 'Food Department' else 'no_departm' end,
     avg(salary)
 AS Average_Salary
from employees
where COMMISSION_PCT is not null --and DEPARTMENT_ID = 80
group by department_id



select * from employees where COMMISSION_PCT is not null







select * from employees where COMMISSION_PCT is  not null

select * from LOCATIONS order by city

select count(*) as count_of_city
from LOCATIONS

select * from LOCATIONS where COUNTRY_ID = 'CA'


select job_id,
 count(*) as no_of_emp,
 sum(salary) as total_salary,
 max(salary) as highest_salary,
 min(salary) as lowest_salary,
 max(salary) - min(salary) as diff_in_salary
from employees
group by job_id




select * from employees


SQL Masterclass
--How to create temporary table in sql server
create table #Temp_tests(

id int,
FULL_NAME varchar(30))

select * from #Temp_tests

---HOw to create temporary table in POSTgres
create temp table  Temp_tests(

id int,
FULL_NAME varchar(30))

Temp_tests



--WITH cte_name(column_name ) AS (cte expresssion )  sql_statement

WITH cte_name(DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID ) 
AS
(  SELECT DEPARTMENT_ID, DEPARTMENT_NAME, 
         MANAGER_ID, LOCATION_ID
   FROM  DEPARTMENTS where DEPARTMENT_NAME='Marketing'
)  

select * from cte_name

--lag(value_expression[,offset]) over ([query_partition_clause] order_by_clause)


select department_id,salary, 
lag(salary,1) over (  order by salary) lag_value 

from EMPLOYEES
where DEPARTMENT_ID=20

--ROW_NUMBER


select derpartment_id,first_name row_number() over(order by first_name ) 
Label1
from EMPLOYEES  




--lead(value_expression[,offset]) over ([query_partition_clause] order_by_clause)
select department_id,salary, 
lead(salary,1) over (  order by salary) lead_value 
from EMPLOYEES

--Lag and Lead comparison
select department_id,salary, lag(salary,1) over (  order by salary) lag_value,
lead(salary,1) over (  order by salary) lead_value 
from EMPLOYEES


SQL Masterclass
--Aggregate Functions
--1. Works only for numeric data
--2. Group by - you group by all non-aggregate fields

select * from employees;

--total salary by department
--total salary by job per department

SELECT JOB_ID, DEPARTMENT_ID, SUM(SALARY) AS SALARY_SUM
FROM EMPLOYEES
GROUP BY JOB_ID, DEPARTMENT_ID;

SELECT  department_id, MAX(salary) max_sal, count(department_id) count_dep, count(*) count_all
  FROM employees
GROUP BY  department_id;


select first_name, department_id, salary  from (
select department_id,first_name, salary ,
rank() over (partition by department_id order by salary desc) salary_rank
from employees ) awqr
where salary_rank = 1;



select department_id, first_name, salary ,
rank() over (partition by department_id order by salary desc) salary_rank,
dense_rank() over (partition by department_id order by salary desc) salary_denserank,
row_number() over (partition by department_id order by salary desc) salary_rownumber
from employees;


select first_name, department_id, salary  from (
select department_id,first_name, salary ,
rank() over (partition by department_id order by salary desc) salary_rank
from employees ) awqr
where salary_rank = 1;

--creata a cte to show rank of everyone
with rankcte as (
select department_id,first_name, salary ,
rank() over (partition by department_id order by salary desc) salary_rank
from employees )
select first_name, department_id, salary from rankcte where salary_rank = 1;

--Using both CTE and subquery, display first_name, last_name, dept_id, join date 
--of the 5th employee hired per department
--using cte
with rankcte as (
select first_name,last_name, department_id,hire_date,
rank() over (partition by department_id order by hire_date asc) hired_rank
from employees )
select first_name,last_name, department_id,hire_date from rankcte where hired_rank = 5;



--Using subquery
select first_name,last_name, department_id,hire_date  from (
select first_name,last_name, department_id,hire_date ,
rank() over (partition by department_id order by hire_date asc) hired_rank
from employees ) awqr
where hired_rank = 5;


create or alter function fn_multiply2 (@number1 numeric, @number2 numeric)
returns varchar(50)
as
begin 
declare @v_result varchar(50);
set @v_result = concat ('THE MULTIPLICATION OF ' ,@number1, ' & ', @number2,
                          ' IS ' ,@number1 * @number2);
return @v_result;
end;

--select dbo.fn_multiply2(78900,5678) as multipl

USE [master]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_multiply]    Script Date: 25/08/2022 15:48:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   function [dbo].[fn_multiply] (@number1 numeric, @number2 numeric)
returns NUMERIC
as
begin 
declare @v_result NUMERIC;
set @v_result = @number1 * @number2;
return @v_result;
end;

--select dbo.fn_multiply(189,567) as multipl


--Postgres
CREATE OR REPLACE FUNCTION function_name ( p1 numeric , p2 numeric) 
RETURNS varchar(10) AS $MULTIPLICATION$
   DECLARE
      V_RETURN VARCHAR (50);
   BEGIN
    select CONCAT ('THE MULTIPLICATION OF ' ,p1,' & ', P2, ' IS ',  p1*P2) into V_RETURN;
     RETURN V_RETURN;
END;
$MULTIPLICATION$ LANGUAGE plpgsql;

--select function_name(15,5)

SQL Masterclass
            STUDENT’S CODE FOR SQL CLASS

 (1) Ezekiel Olatunji’s code

 

create or alter function get_max_salary (@job_id varchar(10))

returns numeric

as

begin

declare @max_salary numeric;

set @max_salary =(select max_salary from jobs

where JOB_ID = @job_id)

return @max_salary;

end;

 

create or alter function get_min_salary (@job_id varchar(10))

returns numeric

as

begin

declare @min_salary numeric;

set @min_salary =(select min_salary from jobs

where JOB_ID = @job_id)

return @min_salary;

end;

 

select dbo.get_max_salary('AD_PRES');

 

select first_name, last_name, email, hire_date, department_id,

dbo.get_max_salary('AD_PRES') maximum_salary,

dbo.get_min_salary('AD_PRES') minimum_salary from employees

order by DEPARTMENT_ID

 

select first_name, last_name, email, hire_date, department_id, job_id,

dbo.get_max_salary(job_id) maximum_salary,

dbo.get_min_salary(job_id) minimum_salary from employees

order by department_id

 (3) Olanrewaju Obe’s code

 

CREATE OR ALTER FUNCTION return_reg_name(@reg_id numeric)

returns varchar(50)

AS

BEGIN

DECLARE @r_id varchar(50);

SET @r_id  = (SELECT REGION_NAME FROM REGIONS

                                                                                          WHERE region_id = @reg_id);

return @r_id ;

end;

 

select dbo.return_reg_name(4)

 

select country_id, country_name, dbo.return_reg_name(region_id) continent

from countries

 

 

*****

 

CREATE OR ALTER FUNCTION streetname(@loc_id numeric)

returns varchar(50)

AS

BEGIN

DECLARE @r_id varchar(50);

SET @r_id  = (SELECT STREET_ADDRESS FROM LOCATIONS

                                                                                          WHERE location_id = @loc_id);

return @r_id ;

end;

 

select dbo.streetname(1000)

 

create or alter procedure my_procedure

AS

select department_id, department_name, dbo.streetname(LOCATION_ID) str_name

from DEPARTMENTS

Go;

 

(3) (John Alabi’s code)

 --First_name, last_name, department_id, employee_id, job_id, (job_title, start_date) of the employees

CREATE OR REPLACE FUNCTION room2_jobtitle (job_id1 varchar)

RETURNS varchar (50) as $defining_outputdatatype$

 

DECLARE select_jobtitle varchar(100);

 

BEGIN

  SELECT job_title FROM jobs WHERE job_id=job_id1 INTO select_jobtitle;

  RETURN select_jobtitle;

 

 END

 

 $defining_outputdatatype$ LANGUAGE plpgsql

 

 SELECT room2_jobtitle('AD_PRES')

CREATE OR REPLACE FUNCTION room2_startdate (employee_id1 numeric)

 RETURNS varchar (50) as $defining_outputdatatype$

 

 DECLARE select_startdate varchar(100);

 

 BEGIN

  SELECT start_date FROM job_history WHERE employee_id=employee_id1 INTO select_startdate;

  RETURN select_startdate;

 

  END

 

   $defining_outputdatatype$ LANGUAGE plpgsql

 

  SELECT room2_startdate(101)

 

  SELECT first_name, last_name, employee_id, department_id, job_id, room2_jobtitle(job_id) as job_title,

  room2_startdate(employee_id) as start_date

  FROM employees

  ORDER BY employee_id

postgres

 (4)  (Chinedum Onyema’s code)

 

 

-- Function to return job title by job ID

CREATE OR ALTER FUNCTION return_job_title (@emp_job_id varchar(20))

returns varchar(50)

AS

BEGIN

DECLARE @job_title varchar(50);

SET @job_title = (

               select job_title

               from jobs

               where job_id = @emp_job_id

);

return @job_title;

end;

 

-- Function to return max salary by job ID

CREATE OR ALTER FUNCTION return_max_salary (@emp_job_id varchar(20))

returns numeric

AS

BEGIN

DECLARE @max_salary numeric;

SET @max_salary = (

               select max_salary

               from jobs

               where job_id = @emp_job_id

);

return @max_salary;

end;

 

 

select first_name, last_name, job_id,

               dbo.return_job_title(job_id) job_title,

               salary,

               dbo.return_max_salary(job_id) max_salary

from employees;

 

 

=====================OTHERS=============================

CREATE OR ALTER FUNCTION return_salary (@emp_id numeric)

returns numeric

AS

BEGIN

DECLARE @salary_result numeric;

SET @salary_result = (SELECT salary FROM employees WHERE employee_id = @emp_id);

return @salary_result;

end;

 

 

CREATE OR ALTER FUNCTION return_dept_name (@dept_id numeric)

returns varchar(50)

AS

BEGIN

DECLARE @name_result varchar(50);

SET @name_result = (SELECT department_name FROM departments

                                                                                          WHERE department_id = @dept_id);

return @name_result;

end;

 

select dbo.return_dept_name (90);

 

select first_name, last_name, email, hire_date,

                              department_id, dbo.return_dept_name (department_id) dept_name from employees;

 

select * from employees;

 

 

create  sequence seq_no2 start with 12 increment by 2

 

select next value for dbo.seq_no2

 

drop sequence dbo.seq_no

 

create  sequence seq_no start with 1 increment by 1

 

select next value for seq_no as s_n, first_name, last_name, email, hire_date,

                              department_id, dbo.return_dept_name (department_id) dept_name from employees;

 

CREATE OR REPLACE PROCEDURE prc_test ( p1 numeric, p numeric )

language plpgsql

AS $test$

DECLARE

--p2 numeric;

   BEGIN

   truncate table tmp_123;

   INSERT into tmp_123

    select first_name, last_name from employees

                 where employee_id between p1 and p;

END;

$test$

 

--call prc_test(107,123);

--select * from tmp_123

 

 --create table tmp_123 AS select first_name, last_name from employees where employee_id = p1;

 

 --truncate table tmp_123;

 

 

create or alter procedure prc_employee_dt @emp_id numeric

as

begin

select first_name, last_name, department_id,

               next value for seq_no as seq_no,

               dbo.return_dept_name (department_id) dept_name

               from employees

                 where employee_id = @emp_id;

  end;

 

  execute dbo.prc_employee_dt 123

 

  select * from locations


SQL Masterclass
select * from DEPARTMENTS;
SELECT * FROM EMPLOYEES;
select * from jobs;

--DISPLAY THE DEPARTMENT ID, DEPARTMENT NAME, MANAGER ID AND HIS/HER NAME FOR 
--DEPARTMENTS WITH MANAGERS
--JOIN DEPARTMENTS TO EMPLOYEES - MAN_ID FROM D TO EMP_ID FROM E
select d.department_id,
d.department_name,
d.manager_id,
e.first_name
from DEPARTMENTS  as d 
inner join employees as e
on d.manager_id = e.EMPLOYEE_ID;

select d.department_id,
d.department_name,
d.manager_id,
e.first_name
from DEPARTMENTS  as d ,
employees as e
where d.manager_id = e.EMPLOYEE_ID;

--DISPLAY THE DEPARTMENT ID, DEPARTMENT NAME, MANAGER ID AND HIS/HER NAME FOR 
--DEPARTMENTS WITH or without MANAGERS
--JOIN DEPARTMENTS TO EMPLOYEES - MAN_ID FROM D TO EMP_ID FROM E

select d.department_id,
d.department_name,
d.manager_id,
e.first_name
from DEPARTMENTS  as d 
left join employees as e
on d.manager_id = e.EMPLOYEE_ID;

--DISPLAY THE DEPARTMENT ID, DEPARTMENT NAME, MANAGER ID AND HIS/HER NAME FOR 
--DEPARTMENTS WITH MANAGERS and show other employees that are yet to be a dept manager
--JOIN DEPARTMENTS TO EMPLOYEES - MAN_ID FROM D TO EMP_ID FROM E
select d.department_id,
d.department_name,
d.manager_id,
e.first_name
from DEPARTMENTS  as d 
right join employees as e
on d.manager_id = e.EMPLOYEE_ID
order by 1 desc;

--DISPLAY THE DEPARTMENT ID, DEPARTMENT NAME, MANAGER ID AND HIS/HER NAME FOR 
--DEPARTMENTS WITH or without MANAGERS and show other employees that are yet to be a dept manager
--JOIN DEPARTMENTS TO EMPLOYEES - MAN_ID FROM D TO EMP_ID FROM E
select d.department_id,
d.department_name,
d.manager_id,
e.first_name
from DEPARTMENTS  as d 
full outer join employees as e
on d.manager_id = e.EMPLOYEE_ID
order by 1 desc;

--display employee's id, first name, last name, manager first name and manager lastname
select a.employee_id,
a. first_name emp_first_name,
a.last_name emp_last_name,
a.manager_id,
b.first_name man_first_name,
b.last_name man_last_name
from employees a 
inner join  employees b
on a.manager_id = b.employee_id;

select a.*,b.JOB_TITLE from 
(select d.department_id,
d.department_name,
d.manager_id,
e.job_id,
e.first_name
from DEPARTMENTS  as d 
inner join employees as e
on d.manager_id = e.EMPLOYEE_ID ) a
inner join jobs b
on a.job_id= b.job_id;

--total employees by country name
select count(e.employee_id), f.country_name from
(select c.*, d.country_id from
(select a.employee_id, a.first_name, b.LOCATION_ID
    from employees a left join DEPARTMENTS b
   on a.department_id = b.department_id ) c
   left join locations d
   on c.LOCATION_ID = d.LOCATION_ID ) e
   left join COUNTRIES f
   on e.country_id = f.country_id
   group by f.country_name;

create table testtrigger ( id numeric, first_name varchar(50));
select * from testtrigger;
insert into testtrigger
select 2, 'Amaka'
union all
select 2, 'Amaka';

create table testtrigger_audit ( id numeric, first_name varchar(50),modified_date datetime);

select * from testtrigger;
select * from testtrigger_audit;

insert into testtrigger
select 4, 'Nasirat'

update testtrigger set first_name = 'Dayo'
where id = 1



create or alter trigger tr_audit_test on dbo.testtrigger
  for insert
  as
  begin
  insert into testtrigger_audit (id, first_name,modified_date)
  select i.id, i.first_name, GETDATE() 
  from inserted i
  end;

--- For Postgres
create table testtrigger ( id numeric, first_name varchar(50));
select * from testtrigger;
insert into testtrigger
select 1, 'Azeez'
union all
select 2, 'Amaka';

insert into testtrigger
select 3, 'John'

create table testtrigger_audit ( id numeric, first_name varchar(50),modified_date text);

select * from testtrigger;
select * from testtrigger_audit;

create or replace trigger tr_audit_test after insert on testtrigger
  for each row
  execute function fn_tes_trigger();
  

CREATE OR REPLACE function fn_tes_trigger()
returns TRIGGER AS $example_table$
DECLARE

   BEGIN
 insert into testtrigger_audit (id, first_name,modified_date)
  values( new.id, new.first_name, current_timestamp );
  return new;
END;
$example_table$ LANGUAGE plpgsql;

create or alter procedure prc_test_loop @emp_id numeric
as
declare @cnt numeric = 100
  begin
  while @cnt <= 206
begin
insert into test_loop
select employee_id, first_name, salary from EMPLOYEES
  where employee_id = @cnt;
  set @cnt = @cnt + 1;
  end
    end;

--select min(employee_id), max(employee_id) from employees

--create table test_loop (employee_id numeric, first_name varchar(50), salary numeric)

--select * from test_loop;

--execute dbo.prc_test_loop 100;



=====for Postgres
--LOOPS
CREATE OR REPLACE PROCEDURE prc_testloop(employee_id numeric)
language plpgsql
AS $test$
DECLARE
cnt numeric = 100;
BEGIN
     WHILE cnt <= 206 LOOP
   
  insert into test_loop
select a.employee_id, a.first_name, a.salary from EMPLOYEES as a
  where a.employee_id = cnt;
  cnt := cnt + 1;
  END LOOP;   
END;
$test$

call prc_testloop(100)

Create table test_loop (employee_id numeric, first_name varchar(50), salary numeric)
-- first create the test_loop table

SELECT * FROM test_loop


https://www.w3schools.com/sql/sql_foreignkey.asp

--exists
select first_name, last_name, salary, JOB_ID from EMPLOYEES
where exists(
select job_id from jobs where jobs.job_id = employees.JOB_ID and max_salary > 20000);

