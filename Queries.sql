--QUERIES--

--1) List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
FROM "Employees" e
JOIN "Salaries" s
ON (e.emp_no = s.emp_no)
ORDER BY "salary" DESC;

--2) List employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date
FROM "Employees"
WHERE hire_date BETWEEN'1986-01-01' AND '1986-12-31';

--3) List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name, dm.from_date, dm.to_date
FROM "Employees" e
JOIN "Department_Manager" dm
ON (e.emp_no = dm.emp_no)
JOIN "Departments" d
ON (dm.dept_no = d.dept_no);

--4) List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM "Employees" e
JOIN "Department_Employee" de
ON (e.emp_no = de.emp_no)
JOIN "Departments" d
ON (de.dept_no = d.dept_no);

--5) List all employees whose first name is "Hercules" and last names begin with "B."
SELECT emp_no, first_name, last_name
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6) List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM "Employees" e
JOIN "Department_Employee" de
ON (e.emp_no = de.emp_no)
JOIN "Departments" d
ON (de.dept_no = d.dept_no)
WHERE de.dept_no = 'd007';

--7) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM "Employees" e
JOIN "Department_Employee" de
ON (e.emp_no = de.emp_no)
JOIN "Departments" d
ON (de.dept_no = d.dept_no)
WHERE de.dept_no = 'd007' OR de.dept_no = 'd005';

--8) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(emp_no) AS "last name count" FROM "Employees"
GROUP BY last_name
ORDER BY "last name count" DESC;