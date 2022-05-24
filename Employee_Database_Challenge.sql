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
