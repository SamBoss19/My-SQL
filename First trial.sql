--display the department id, department name, manager id and his/her name
--departments with manger
-- join department to employees - manager id fron d to employee id on f
select d.department_id,
	d.department_name,
	d.manager_id,
	f.first_name
	from departments as d
	inner join employees as f
	on d.manager_id = f.EMPLOYEE_ID;
	-- join with or withoout manager
	select d.department_id,
	d.department_name,
	d.manager_id,
	f.first_name
	from departments as d
	left join employees as f
	on d.manager_id = f.EMPLOYEE_ID;
	-- join departments with managers and show other employees that are yet to be a dept manager
	select d.department_id,
	d.department_name,
	d.manager_id,
	f.first_name
	from departments as d
	right join employees as f
	on d.manager_id = f.EMPLOYEE_ID
	order by 1 desc;
	--- join departments with or without managers and show other employees that are yet to be a dept manager
	select d.department_id,
	d.department_name,
	d.manager_id,
	f.first_name
	from departments as d
	full outer join employees as f
	on d.manager_id = f.EMPLOYEE_ID
	order by 1 desc;
	--- display employee's id, first name, last name, manager first and last name
	select a.employee_id,
			a.first_name emp_first_name,
			a. last_name emp_last_name,
			a.manager_id,
			b.first_name man_first_name,
			b.last_name man_last_name
		from employees a
		inner join employees b
		on a.manager_id = b.employee_id;