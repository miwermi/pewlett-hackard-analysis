                                                                                           Michelle Werner (5/22/2022)
# Pewlet Hackard Employee Retirement Analysis

## Overview
Pewlet Hackard is a large company with several thousand employees. Because so many employees are nearing retirement age, the company is concerned about a silver tsunami ahead, and wants to be sure new employees are trained well-trained and mentored before the more experienced staff heads out the door.  The HR analyst on staff needs to answer questions about who will be retiring in the next few years and how many positions might need to be filled, and I will be helping him build a hearty relational database from multiple excel files that all the company has used to store employee data up to now.

### Step 1: Reviewing the data
There are six main csv files that store all of the company's employee data.  Bobby (the Pewlet Hackard HR analyst) and I worked together to generate this ERD (Entity Relationship Diagram) to have a visual of the conceptual, logical, and physical content of each table that will be added to our final database. The image below clearly shows primary and foreign keys in each table and the way each table relates/connects to another.

<img src="https://raw.githubusercontent.com/miwermi/pewlett-hackard-analysis/main/EmployeeDB.png" alt="Fig 1. Pewlet Hackard Employee ERD" />
Fig 1. Pewlet Hackard Employee ERD (created with quickdatabasediagrams.com)

### Step 2: Preparing the new database
The decision was made to use the PostgreSQL environment for the new database and the accompanying PGadmin software to build, access and easily query the data. Once the database was initialized, the empty structure for each of the 6 tables in our ERD was created and the csv content of all 6 was loaded into the new environment. Once each table's content was confirmed without errors, we could begin writing queries to pull specific data and create new tables that contained retirement-specific data -- and easily answer all of our retirement questions.

The two biggest questions being:
- What is the number of retirement eligible employees and what are the jobs they will leave empty?
- Who are the employees that would be the best eligible candidates for any mentorship program?

### Step 3: Writing the queries

Initially, we searched for employees of retirement age using the birth date information in the main 'employee' table. We had settled on employees born between January 1st, 1952 and December 31st, 1955 -- and were terrified to realize that was over 90K employees.  Because of this we searched by each year individually, but all were fairly consistent with between 21K and ~23K employees/year - so we tried to limit the number by including a length of service range as well and created our first attempt at a retirement list with the query:

    SELECT emp_no, first_name, last_name
    INTO retirement_info
    FROM employees
    WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
    AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

From there we looked at departments, titles, and salaries individually, and created a few summary tables combining different characteristics like retirement eligible and salary info or retirment eligible and department, etc. But wait!  In looking at the date, we realized that it contained people who no longer worked at Pewlet Hackard with end dates that were already in the past - AND that many employees had multiple listings due to promotions and job title changes.
We had to rethink our logic. Eventually we succeeded in getting a quality list, and our query to return accurate counts and quality information. We used the following:

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
  
The query above returns 72,458 results, which is equal to the number returned in a query without DISTINCT ON or designating a from_date ORDER BY, but Bobby and I could think of situations where someone might be holding an interim position and perhaps entered as 'current' with two titles (or some other similar entry error since this table does not contain a unique primary key such as 'job_id' and multiple titles are allowable for each employee number), so we agreed this query would knock any issue like that out as well.  We were pleasantly surprised that the new query count matched the simpler query (without a DISTINCT ON or from_date consideration). 72,458 employees are retirement age and currently still employed - and that number has been double-checked.

## Results

The results of our Pewlet Hackard employee data analysis revealed a lot of useful data insights and answer the initial questions that called for this analysis.  Results that we believe will are most useful are:

 - bullet1
 - bullet2
 - bullet3
 - bullet4

## Summary

How many roles will need to be filled as the 'silver tsunami' begins to make an impact?
Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

Titles... but Departments?  Mentors??
