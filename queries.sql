--Troubleshooting titles table + retirement queries...

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
