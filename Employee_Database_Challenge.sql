--CHALLENGE QUERIES
----------------------------------------------------------------------
--DELIVERABLE 1--

DROP TABLE retirement_titles;
--Make a retiree info table with name number and title info (not dept, not gender), 
--and only restricted birth dates: 1952-1955, order by employee number, export...
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    j.title,
	j.from_date,
    j.to_date
	INTO retirement_titles
FROM employees as e
INNER JOIN titles as j
	ON (e.emp_no = j.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;
	
SELECT * FROM retirement_titles;
SELECT COUNT(emp_no) FROM retirement_titles;

--COPY CHALLENGE 'CODE' HERE:
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;


DROP TABLE unique_titles;
--retiree info table with still employeed employees and latest title info...
SELECT DISTINCT ON (emp_no) emp_no,
    first_name,
	last_name,
    title
	INTO unique_titles
FROM retirement_titles as r
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;
SELECT COUNT(emp_no) FROM unique_titles;

SELECT DISTINCT title from unique_titles;
--sort and count retiree titles and put into new table...
SELECT COUNT(*), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC; 

SELECT * FROM retiring_titles;

----------------------------------------------------------------------
--DELIVERABLE 2--

DROP TABLE mentorship_eligibility;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
    e.birth_date,
	de.from_date,
    de.to_date,
	j.title
	INTO mentorship_eligibility
FROM employees as e
INNER JOIN titles as j
	ON (e.emp_no = j.emp_no)
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, de.to_date DESC;

SELECT * FROM mentorship_eligibility;
SELECT COUNT(emp_no) FROM mentorship_eligibility;

	
----------------------------------------------------------------------
--DELIVERABLE 3--

--mentor titles
SELECT DISTINCT title from mentorship_eligibility;
--sort and count retiree titles and put into new table...
SELECT COUNT(*), title
INTO mentor_titles
FROM mentorship_eligibility
GROUP BY title
ORDER BY count DESC; 

SELECT * FROM mentor_titles;

DROP TABLE mentor_titles;
--INCREASE MENTORSHIP PROGRAM ACCEPTED YEARS???
DROP TABLE mentorship_eligibility;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
    e.birth_date,
	de.from_date,
    de.to_date,
	j.title
	INTO mentorship_eligibility
FROM employees as e
INNER JOIN titles as j
	ON (e.emp_no = j.emp_no)
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1964-01-01' AND '1969-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, de.to_date DESC;

SELECT * FROM mentorship_eligibility;
SELECT COUNT(emp_no) FROM mentorship_eligibility;

--FOCUS ON DEPARTMENTS INSTEAD: RETIREE and MENTORSHIP DEPARTMENTS
DROP TABLE department_eligibility;
--sort and count retiree departments and put into new table...
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
    e.birth_date,
	de.from_date,
    de.to_date,
	de.dept_no,
	d.dept_name,
	j.title
	INTO department_eligibility
FROM employees as e
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
INNER JOIN departments as d
	ON (de.dept_no = d.dept_no)
INNER JOIN titles as j
ON (e.emp_no = j.emp_no)	
WHERE (e.birth_date BETWEEN '1964-01-01' AND '1969-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, de.to_date DESC;

SELECT * FROM department_eligibility;
SELECT COUNT(emp_no) FROM department_eligibility;
	
DROP TABLE department_titles;

SELECT DISTINCT (dept_name, title) from department_eligibility;
--sort and count department mentees and put into new table...
SELECT COUNT(*), dept_name
INTO department_titles
FROM department_eligibility
GROUP BY dept_name
ORDER BY count DESC; 

SELECT * FROM department_titles;

------------------------------------------------------------

DROP TABLE retirement_department_needs;
--sort and count retiree departments and put into new table...
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
    e.birth_date,
	de.from_date,
    de.to_date,
	de.dept_no,
	d.dept_name,
	j.title
	INTO retirement_department_needs
FROM employees as e
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
INNER JOIN departments as d
	ON (de.dept_no = d.dept_no)
INNER JOIN titles as j
ON (e.emp_no = j.emp_no)	
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, de.to_date DESC;


SELECT * FROM retirement_department_needs;
SELECT COUNT(emp_no) FROM retirement_department_needs;
	
DROP TABLE retirement_needs;

SELECT DISTINCT (dept_name, title) from retirement_department_needs;
--sort and count department mentees and put into new table...
SELECT COUNT(*), dept_name
INTO retirement_needs
FROM retirement_department_needs
GROUP BY dept_name
ORDER BY count DESC; 

SELECT * FROM retirement_needs;


--my preferred retirement count query...
DROP TABLE retirement_count;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
  e.first_name,
  e.last_name,
  j.title,
  j.from_date,
  j.to_date
  INTO retirement_count
FROM employees as e
INNER JOIN titles as j
ON (e.emp_no = j.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (to_date = '9999-01-01')
ORDER BY e.emp_no, j.from_date DESC;

SELECT * FROM retirement_count;
SELECT COUNT(emp_no) FROM retirement_count;


