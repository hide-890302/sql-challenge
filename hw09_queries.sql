-- 1. employee: employee number, last name, first name, sex, and salary.
--  > employees: employee number, last name, first name and sex
--  > salaries: salary

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON employees.emp_no = salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > '1985-12-31'
AND hire_date < '1987-01-01';

-- 3. List the manager of each department with the following information:
--  > dept_manager dm: department number, the manager's employee number
--  > departments d: department name
--  > employees e: last name, first name

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
LEFT JOIN departments d ON dm.dept_no = d.dept_no
LEFT JOIN employees e ON dm.emp_no = e.emp_no

-- 4. List the department of each employee with the following information:
--  > employees e: emp_no, last_name, first_name 
--  > dept_emp de: [employee & department relation]
--  > departments d: dept_name

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no

-- 5. List first name, last name, and sex for employees 
-- whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development'

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;