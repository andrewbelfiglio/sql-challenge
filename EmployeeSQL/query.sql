-- List the employee number, last name, first name, sex, and salary of each employee

SELECT e.emp_no as "Employee ID", e.last_name as "Last Name", e.first_name as "First Name", 
e.sex as "Sex", s.salary as "Salary"
FROM employees as e
INNER JOIN salaries as s ON e.emp_no=s.emp_no


-- List the first name, last name, and hire date for the employees who were hired in 1986

SELECT first_name as "First Name", last_name as "Last Name", hire_date as "Hire Date"
FROM employees
WHERE hire_date >= '1986/01/01' and hire_date <= '1986/12/31'


-- List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name

SELECT d.dept_no as "Department Number", d.dept_name as "Department Name", 
dm.emp_no as "Manager Employee ID", e.last_name as "Manager Last Name", e.first_name as "Manager First Name"
FROM departments as d
INNER JOIN dept_manager as dm ON d.dept_no=dm.dept_no
INNER JOIN employees as e ON dm.emp_no=e.emp_no


-- List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name

SELECT de.emp_no as "Employee ID", e.last_name as "Last Name", e.first_name as "First Name",
d.dept_name as "Department", de.dept_no as "Department ID"
FROM employees as e
INNER JOIN dept_emp as de ON de.emp_no=e.emp_no
INNER JOIN departments as d ON d.dept_no=de.dept_no


-- List first name, last name, and sex of each employee whose first name is Hercules 
-- and whose last name begins with the letter B

SELECT first_name as "First Name", last_name as "Last Name", sex as "Sex"
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%'


-- List each employee in the Sales department, including their employee number, last name, and first name

SELECT de.emp_no as "Employee ID", e.last_name as "Last Name", e.first_name as "First Name", 
d.dept_name as "Department Name", de.dept_no as "Department ID"
FROM employees as e
INNER JOIN dept_emp as de ON de.emp_no=e.emp_no
INNER JOIN departments as d ON d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales'


-- List each employee in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name

SELECT de.emp_no as "Employee ID", e.last_name as "Last Name", e.first_name as "First Name", 
d.dept_name as "Department Name", de.dept_no as "Department ID"
FROM employees as e
INNER JOIN dept_emp as de ON de.emp_no=e.emp_no
INNER JOIN departments as d ON d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales' or d.dept_name = 'Development'


-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name)

SELECT last_name as "Last Name", COUNT(last_name) as "Frequency"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC