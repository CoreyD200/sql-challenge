-- Create list of all employees: LastName, FirstName, Gender, Salary
SELECT e.last_name, e.first_name, e.gender, s.salary 
FROM employees as e
Join Salaries as s ON  e.emp_no = s.emp_no;

--Create list of all emplyees hired in 1986
SELECT last_name, first_name, hire_date
FROM employees
Where hire_date > '12/31/1985' and hire_date < '01/01/1987';

--List Manager of each department: Department Number, department name, 
--managers employee number, Last name, First name, start and end employment dates
SELECT d.dept_no, d.dept_name, e.emp_no, e.Last_name, e.first_name, m.from_date, m.to_date
FROM departments as d
Join dept_manager as m on d.dept_no=m.dept_no
join employees as e on m.emp_no = e.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
From employees as e
JOIN dept_emp on e.emp_no=dept_emp.emp_no
JOIN departments as d on dept_emp.dept_no=d.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules' and last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments as d
JOIN dept_emp on d.dept_no= d.dept_no
JOIN employees as e on dept_emp.emp_no = e.emp_no
WHERE d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments as d
JOIN dept_emp on d.dept_no= d.dept_no
JOIN employees as e on dept_emp.emp_no = e.emp_no
WHERE d.dept_name IN ('Sales','Development');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT (last_name) as name_cnt
FROM employees
GROUP BY last_name
ORDER BY name_cnt desc;