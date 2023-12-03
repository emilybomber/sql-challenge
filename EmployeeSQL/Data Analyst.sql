SELECT * FROM dept_mangers;

--Query1
--List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex
FROM employess AS e
JOIN salaries AS s
ON (emp.emp_no = s.emp_no); 

--Query 2
--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employess
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--Query 3
--List the manager of each department along with their department number, department name,
--employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_mangers as dm
INNER JOIN department as d ON (dm.dept_no = d.dept_no)
LEFT JOIN employess as e ON (dm.emp_no = e.emp_no)	
ORDER BY dm.dept_no, e.last_name
--Query 4
--List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name.
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de 
JOIN department as d ON (de.dept_no = d.dept_no)
JOIN employess as e ON (de.emp_no = e.emp_no)
ORDER BY de.dept_no, e.last_name

--Query 5
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employess 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--Query 6
--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name
FROM dept_emp as de 
JOIN department as d ON (de.dept_no = d.dept_no)
JOIN employess as e ON (de.emp_no = e.emp_no)
WHERE d.dept_name = 'Sales'
ORDER BY e.last_name

--Query 7
--List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de 
JOIN department as d ON (de.dept_no = d.dept_no)
JOIN employess as e ON (de.emp_no = e.emp_no)
WHERE d.dept_name = 'Sales' or d.dept_name ='Development'
ORDER BY de.dept_no, e.last_name

--Query 8
--List the frequency counts, in descending order, of all the employee last names
--(that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS frequency
FROM employess
GROUP BY last_name
ORDER BY frequency DESC;
