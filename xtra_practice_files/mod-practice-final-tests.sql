SELECT * from departments;
SELECT * from dept_manager;
SELECT * from dept_emp;
SELECT * from employees;
SELECT * from titles;
SELECT * from salaries;

--Drop table titles;
SELECT * from titles;

CREATE TABLE titles (
job_no INT NOT NULL,
  emp_no INT NOT NULL,
  title VARCHAR,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE titles (
emp_no INT NOT NULL,
  title VARCHAR,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- 90398 results

WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';
-- 21209 results

WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';
-- 22857 results

WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';
-- 23228 results

WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';
-- 23104 results

SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
--41380 results

SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- make new table of employees to retire: 

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

-- Need employee number (next part of module)
DROP TABLE retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;


-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
	retirement_info.last_name,
    dept_emp.to_date 
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;

--same thing shorter:
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
	de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

--same thing shorter:
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Use Left Join for retirement_info and dept_emp tables into new table 'current_emp' eligible for retirement
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT * FROM current_emp;

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO department_count
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;


SELECT * FROM salaries
ORDER BY to_date DESC;

--make employee info table with restricted dates
SELECT emp_no, first_name, last_name, gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

DROP TABLE emp_info;

--CHALLENGE QUERIES

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;


DROP TABLE awesome_table;

--retiree info table with restricted dates and title info
SELECT DISTINCT ON (de.from_date) e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    j.title,
	de.from_date,
    de.to_date
	INTO awesome_table
FROM employees as e
INNER JOIN titles as j
	ON (e.emp_no = j.emp_no)
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY de.from_date DESC;
	
SELECT * FROM awesome_table
ORDER BY emp_no;

SELECT COUNT (emp_no) FROM awesome_table;


SELECT COUNT(*) AS LastPosition FROM (SELECT DISTINCT de_from_date FROM retirement_titles);

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);

SELECT * FROM manager_info;

-- List of employees per department
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
	INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
	ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
	ON (de.dept_no = d.dept_no);
	
SELECT * FROM dept_info;
	
-- Skill drills (?)	
SELECT * FROM dept_info
WHERE dept_name = 'Sales';

-- This uses the IN but does not actually return anyone in both departments.  Moving on...
SELECT * FROM dept_info
WHERE dept_name IN ('Sales', 'Development')
ORDER BY last_name, first_name;





	