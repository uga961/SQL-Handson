Part A — Quick Recall
These are intentionally short.
Q1 — Identify the category
Put each command into the correct category:
CREATE
ALTER
INSERT
UPDATE
DELETE
SELECT
TRUNCATE
DROP

Choose from:
DDL
DML
DQL

Q2 — What does this do?
UPDATE people
SET occupation = 'Engineer'
WHERE id = 103;

Answer in one sentence.
Q3 — What is the danger?
What happens if you execute:
UPDATE people
SET occupation = 'Engineer';

without a WHERE?
Q4 — Same question for DELETE
What happens here?
DELETE FROM people;

How is this different from:
DROP TABLE people;

Part B — Work With Existing Data
Assume this table exists:
people

id	people_name	occupation	age	country
101	Amith	Engineer	45	USA
102	Ugandhar	Student	21	India
103	Varun	Student	22	India
104	Anamika	Student	21	India
105	Alok	Student	20	USA


Q5 — UPDATE
Change Ugandhar's occupation from:
Student

to:
Engineer

Write the SQL.
Q6 — Multiple-column UPDATE
Change Amith's:
occupation → Doctor
country → India

Write one SQL statement.
Q7 — DELETE
Delete Alok's record.
Write the SQL.
Q8 — Predict the table
After Q5, Q6 and Q7, what should the table contain?
Give the expected rows.
Part C — SELECT
Using the original/current people table:
Q9
Write a query that returns only:
people_name
age

Q10
Return all columns for people:
older than 21
AND
from India

Q11
Return only the occupation of people:
older than 21
AND
from India

Q12 — Prediction
What does this return?
SELECT ROUND(AVG(age)) AS Avg_age
FROM people;

Use the table after Q5–Q7.
Give the expected number.
Part D — Aggregate Functions
Consider:
employees

id	name	salary
1	Alice	50000
2	Bob	60000
3	Charlie	55000
4	David	70000
5	Eve	48000


Q13
Write queries to find:
a. Number of employees
b. Lowest salary
c. Highest salary
d. Total salary
e. Average salary rounded to 2 decimals
You can write five separate queries.
Q14 — Prediction
What is:
SELECT MIN(salary) FROM employees;

Expected:
48000

Don't just copy that. Explain why.
Q15 — One-query challenge
Write a single query that returns:
Total Employees
Minimum Salary
Maximum Salary
Total Salary
Average Salary

Expected column names are up to you.
Part E — Numeric Functions
Q16 — Predict all outputs
What will each return?
SELECT ABS(-900);
SELECT CEILING(4.3);
SELECT FLOOR(4.9);
SELECT ROUND(4.6282, 2);
SELECT POW(4,2);
SELECT SQRT(16);
SELECT SIGN(-900);

Expected output:
Function	Output
ABS	?
CEILING	?
FLOOR	?
ROUND	?
POW	?
SQRT	?
SIGN	?


Q17 — Debugging
A student writes:
SELECT ROUND(AVG(salary), 2)
FROM employee;

but gets:
Table 'employee' doesn't exist

The actual table is:
employees

Fix the query.
Part F — Text Functions
Don't write huge queries here. Just solve the outputs.
Q18
What is the output of:
SELECT LOCATE('o', 'Hello World');

Q19
What is the output?
SELECT REPLACE(
    'Hello World',
    'World',
    'SQL'
);

Q20
Predict:
SELECT LEFT('Ugandhar', 5);

and:
SELECT RIGHT('Ugandhar', 5);

Q21
Predict:
SELECT SUBSTRING('Ugandhar', 3, 3);

Q22
What does this produce?
SELECT CONCAT(
    LEFT('abcdef', 2),
    '//',
    RIGHT('ghijk', 2)
);

Q23
Write one query that takes:
Ugandhar

and returns:
UGANDHAR

using a function from today's class.
Part G — Date Functions
Use this table:
events

id	event_name	event_date
1	New Year	2025-01-01 00:00:00
2	Company Meeting	2025-03-15 14:30:00
3	Conference	2025-06-20 09:00:00
4	Christmas	2025-12-25 18:00:00


Q24
Write a query that returns:
event_name
event_year
event_month
event_day

For example:
event_name	event_year	event_month	event_day
New Year	2025	1	1
Company Meeting	2025	3	15
Conference	2025	6	20
Christmas	2025	12	25


Q25
Write a query that displays:
event_name
event_date formatted as:

25 December 2025

Hint: use DATE_FORMAT().
The relevant MySQL format specifiers include %d, %M, and %Y. MySQL Developer Zone
Q26
What does this produce for the Company Meeting row?
SELECT DATE_ADD(
    event_date,
    INTERVAL -10 DAY
)
FROM events
WHERE event_name = 'Company Meeting';

Calculate the date yourself.
Q27
What is the last day of the month for:
2025-02-15

using LAST_DAY()?
Part H — Conversion Functions
Assume:
conversions

contains:
number_value	date_value	float_value
'123'	'2025-03-01'	'45.67'
'456'	'2024-12-25'	'78.90'
'789'	'2023-07-10'	'12.34'


Q28
Write a query that converts:
number_value

from a string into an integer.
Expected:
number_value	converted
123	123
456	456
789	789


Q29
Write a query that converts:
date_value

into an actual DATE and displays it as:
DD-MM-YYYY

For example:
01-03-2025

Part I — CASE
This is one of the more important Day 2 concepts.
Given:
employees100

id	name	salary
1	Alice	3000
2	Bob	6000
3	Charlie	9000
4	David	12000


The rules are:
salary < 5000       → Low
5000–10000          → Good
salary > 10000      → Best

Q30
Write a query that produces:
name	salary	Income_type
Alice	3000	Low
Bob	6000	Good
Charlie	9000	Good
David	12000	Best


Use CASE.
Final Challenge — Don't Look at the Previous Questions
This is the part that tests whether you actually understood Day 1 + Day 2.
You are given a new table:
company_staff

Create it with:
Column	Requirement
staff_id	INT, PK, AUTO_INCREMENT
staff_name	VARCHAR(50), NOT NULL, UNIQUE
department	VARCHAR(30), NOT NULL
salary	INT, CHECK > 0
country	VARCHAR(30), DEFAULT 'India'
joining_date	DATE


Challenge 1
Create the table.
Challenge 2
Insert these five employees:
Name	Department	Salary	Country	Joining Date
Rahul	Engineering	65000	India	2024-01-15
Priya	HR	45000	India	2023-06-20
Arjun	Engineering	85000	USA	2022-03-10
Meera	Finance	55000	India	2024-09-01
Karan	Engineering	110000	UK	2021-11-25


Use one INSERT statement.
Challenge 3
Increase Rahul's salary to:
70000

using UPDATE.
Challenge 4
Change Meera's:
department → Management

and:
country → India

using one UPDATE.
Challenge 5
Write a query that displays only employees:
from India
AND
salary > 50000

Challenge 6
Write a query that returns:
Total Employees
Minimum Salary
Maximum Salary
Average Salary
Total Salary

Challenge 7
Create a calculated column called:
salary_level

using CASE:
salary < 50000       → Junior
50000–80000          → Mid
> 80000              → Senior

Expected result after the updates:
Name	Salary	Salary Level
Rahul	70000	Mid
Priya	45000	Junior
Arjun	85000	Senior
Meera	55000	Mid
Karan	110000	Senior


Challenge 8
Display:
staff_name
joining_date

with the date formatted as:
DD Month YYYY

Expected examples:
Rahul     15 January 2024
Priya     20 June 2023
...

Challenge 9
Create a new column in the result called:
years_worked

You don't need to calculate this perfectly to the decimal. Use a date function you learned today to calculate the difference between the joining date and today.
Challenge 10 — Debug this
A student writes:
SELECT
    staff_name,
    salary,
    CASE
        WHEN salary < 50000 THEN 'Junior'
        WHEN salary > 50000 AND salary < 80000 THEN 'Mid'
        WHEN salary > 80000 THEN 'Senior'
    END AS salary_level
FROM company_staff;

Identify the problem with this logic.
Specifically:
What happens to an employee earning exactly 50000 or exactly 80000?
Then fix the CASE.
Bonus: SQL Detective
Don't execute these. Predict what happens.
Detective 1
UPDATE company_staff
SET salary = salary + 5000
WHERE department = 'Engineering';

How many employees are affected?
Detective 2
DELETE FROM company_staff
WHERE country = 'USA';

Which employee disappears?
Detective 3
SELECT COUNT(*)
FROM company_staff
WHERE salary > 50000;

What number should you get after the updates?
Detective 4
SELECT ROUND(AVG(salary), 2)
FROM company_staff;

Calculate the expected result manually.