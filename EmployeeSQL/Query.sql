--Joining the employees table and salaries table
select 
employees.emp_no, 
employees.last_name, 
employees.first_name, 
employees.sex, 
salaries.salary
from employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--List the first name, last name, and hire date for the employees 
--who were hired in 1986.

select 
employees.first_name, 
employees.last_name,
employees.hire_date
from employees
where employees.hire_date between '1/1/1986' and '12/31/1986';


--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.

select
e.last_name,
e.first_name,
dm.emp_no,
departments.dept_name,
departments.dept_no
from dept_manager as dm 
inner join departments
on dm.dept_no = departments.dept_no
inner join employees as e
on (dm.emp_no = e.emp_no);

--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name
select 
employees.last_name,
employees.first_name, 
employees.emp_no,
dept_emp.dept_no,
departments.dept_name
from employees
inner join dept_emp on employees.emp_no=dept_emp.emp_no
inner join departments on departments.dept_no=dept_emp.dept_no
order by emp_no;

--List first name, last name, and sex of each employee whose 
--first name is Hercules and whose last name begins with the letter B.
select 
employees.first_name,
employees.last_name,
employees.sex
from employees
where first_name = 'Hercules' AND last_name like 'B%';


--List each employee in the Sales department, including their employee number
--, last name, and first name.
select 
employees.last_name,
employees.first_name, 
employees.emp_no,
dept_emp.dept_no,
departments.dept_name
from employees
left join dept_emp on employees.emp_no=dept_emp.emp_no
inner join departments 
on departments.dept_no=dept_emp.dept_no
where departments.dept_name='Sales';

--List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
select 
employees.last_name,
employees.first_name, 
employees.emp_no,
dept_emp.dept_no,
departments.dept_name
from employees
left join dept_emp on employees.emp_no=dept_emp.emp_no
inner join departments 
on departments.dept_no=dept_emp.dept_no
where departments.dept_name in ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
select employees.last_name, 
count(*) as freq_count
from employees
group by last_name
order by freq_count desc;