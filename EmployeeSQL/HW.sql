--1--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT E.emp_no,
  E.last_name,
  E.first_name,
  E.sex,
  S.salary
FROM employees AS E
INNER JOIN salaries AS S ON
E.emp_no= S.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01-01-1986' AND '12-31-1986';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT DM.dept_no, DM.emp_no, D.dept_name, E.first_name, E.last_name
FROM ((dept_manager AS DM
INNER JOIN departments AS D ON DM.dept_no = D.dept_no)
INNER JOIN employees AS E ON DM.emp_no = E.emp_no);

--4-List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM ((employees AS E
INNER JOIN dept_emp ON E.emp_no = dept_emp.emp_no)
INNER JOIN departments AS D ON dept_emp.dept_no = D.dept_no);

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B." "B%"

SELECT E.first_name, E.last_name, E.sex
FROM employees as E
WHERE first_name='Hercules' AND last_name LIKE 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM ((employees AS E
INNER JOIN dept_emp ON E.emp_no = dept_emp.emp_no)
INNER JOIN departments AS D ON dept_emp.dept_no = D.dept_no)
WHERE D.dept_name='Sales'

--7--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM ((employees AS E
INNER JOIN dept_emp ON E.emp_no = dept_emp.emp_no)
INNER JOIN departments AS D ON dept_emp.dept_no = D.dept_no)
WHERE D.dept_name='Sales' OR D.dept_name='Development'

--8--In descending order list the frequency count of employee last names, i.e., how many employees share each last name.
 
Select last_name, count(*)
From employees 
Group By last_name
ORDER BY count(*) DESC