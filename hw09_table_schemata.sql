DROP TABLE employees;

-- Import data from csv files
-- departments.csv
CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
);

SELECT * FROM departments;

-- employees.csv
CREATE TABLE employees(
	emp_no INT,
	emp_title_id VARCHAR,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	PRIMARY KEY (emp_no)
);

SELECT * FROM employees;
SELECT count(*) FROM employees; -- Count: 300024

-- dept_emp.csv
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp;

-- dept_manager.csv
CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM dept_manager;
SELECT COUNT(*) FROM dept_manager; -- Count: 24
SELECT COUNT(DISTINCT emp_no) FROM dept_manager; -- Count: 24

-- salaries.csv
CREATE TABLE salaries (
	emp_no INT,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries;
SELECT count(*) FROM salaries; -- Count: 300024

-- titles.csv
CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR,
	PRIMARY KEY (title_id)
);

SELECT * FROM titles;


