-- Drop tables if they exist
--DROP TABLE IF EXISTS departments, titles, employees, salaries, dept_emp, dept_manager;


-- Create tables for each CSV file

CREATE TABLE departments (
	dept_no VARCHAR(5) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(55) NOT NULL
);

CREATE TABLE titles (
	title_id VARCHAR(10) NOT NULL PRIMARY KEY,
	title VARCHAR(55) NOT NULL
);

CREATE TABLE employees (
	emp_no INT PRIMARY KEY, NOT NULL
	emp_title_id VARCHAR(10),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date DATE,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	sex VARCHAR(1),
	hire_date DATE
);

CREATE TABLE salaries (
	emp_no INT NOT NULL PRIMARY KEY,
	salary INT
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);