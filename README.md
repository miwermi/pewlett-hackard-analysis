                                                                                           Michelle Werner (5/22/2022)
# Pewlet Hackard Retirement-Ready Employment Analysis

# Overiew
Pewlet Hackard is a large company with several thousand employees. Because so many employees are nearing retirement-age, the company is concerned about a silver tsunami ahead, and wants to be sure new employees are trained well-trained and mentored before the more experienced staff heads out the door.  The HR analyist on staff needs to answer questions about who will be retireing in the next few years and how many positions might need to be filled, and I will be helping him build a hearty relational database from mulitple excell files that all the company has used to store employee data up to now.

## Step 1: Reviewing the data
There are six main cvs files that store employee data.  Bobby (the Pewlet Hackard HR analyst) and I worked together to generate this ERD (Entity Relationship Diagram) to have a visual of the conceptual, logical, and physical content of each table that will be added to our final database. The image below clearly shows primary and foreign keys in each table and the way each table relates/connects to another.

<img src="https://raw.githubusercontent.com/miwermi/pewlett-hackard-analysis/main/EmployeeDB.png" alt="Fig 1. Pewlet Hackard Employee ERD" />
Fig 1. Pewlet Hackard Employee ERD (created with quickdatabasediagrams.com)

## Step 2: Preparing the new database
The decision to use PostgreSQL and the accompanying PGadmin software to build, access and query the data. Once the database was initialized, the empty structure for each of the 6 tables in our ERD was created and the csv content was loaded. Once each tables content was confirmed without errors, we could begin writing queries to pull specific data and create new tables that contain retirement-specific data to easily answer all of our retirement questions.

The two biggest questions being:
- What is the nmber of retirement eligible employees and what are the jobs they will leave empty?
- Who are the employees that would be the best eligible candidates for any mentorship program?

# Results

 - bullet1
 - bullet2
 - bullet3
 - bullet4

# Summary

How many roles will need to be filled as the 'silver tsunami' begins to make an impact?
Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
