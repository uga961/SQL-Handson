Part A — Core SQL
Q1. DDL / DML / DQL
Classify each command as DDL, DML, or DQL:
CREATE TABLE employees (...);

UPDATE employees
SET salary = 60000
WHERE EmpID = 5;

SELECT * FROM employees;

DELETE FROM employees
WHERE EmpID = 5;

ALTER TABLE employees ADD email VARCHAR(100);

Q2. Constraints
Create this table:
students
Column	Requirement
student_id	INT, primary key, auto increment
name	VARCHAR(50), NOT NULL
email	VARCHAR(100), UNIQUE
age	INT, must be greater than 18
city	VARCHAR(30), default 'Chennai'


Write the CREATE TABLE statement.
Q3. UPDATE
Given:
employees
EmpID | EmpName | salary
1     | Alice   | 45000
2     | Bob     | 60000
3     | Charlie | 80000

Increase the salary by 15% only for employees earning more than 50,000.
Write the query.
Part B — SELECT + Functions
Q4. SELECT + WHERE
Using used_phone_data, display:
brand_name
ram
used_price

for phones satisfying both:
- RAM >= 8
- used price < 200
Sort the result by used_price from highest to lowest.
Q5. Date functions
For this date:
2024-02-15

Give the result of:
YEAR(...)
MONTH(...)
DAY(...)
LAST_DAY(...)

Q6. DATE_FORMAT
Write a query using DATE_FORMAT() that displays:
release_year

as:
Year: 2024

Assume the date is:
2024-08-15

Q7. DATEDIFF + DATE_ADD
Given:
start_date = '2025-03-10'

Write queries to:
A. Find the number of days between 2025-04-01 and 2025-03-10.
B. Find the date 45 days after 2025-03-10.
Part C — CASE + CAST
Q8. CASE
Using used_phone_data, create a calculated column called price_category:
used_price > 300       → 'Expensive'
used_price 150–300     → 'Medium'
otherwise              → 'Cheap'

Display:
brand_name
used_price
price_category

Q9. CAST
Suppose:
number_value = '125'

Write a query that converts it into an integer using CAST() and gives it the alias:
converted_number

Part D — GROUP BY / HAVING / ORDER BY
Q10. GROUP BY
Using used_phone_data, find the average used price for each brand.
Display:
brand_name
avg_price

Round the average to 2 decimal places.
Q11. GROUP BY + HAVING
Find brands whose average used price is greater than 150.
Display:
brand_name
avg_price

Use GROUP BY and HAVING.
Q12. WHERE vs HAVING
Which is the better query if you want to calculate the average used price only for Honor phones?
Option A
SELECT brand_name, AVG(used_price)
FROM used_phone_data
WHERE brand_name = 'Honor'
GROUP BY brand_name;

Option B
SELECT brand_name, AVG(used_price)
FROM used_phone_data
GROUP BY brand_name
HAVING brand_name = 'Honor';

Choose one and explain why.
Q13. ORDER BY + LIMIT
Find the top 5 brands with the highest average used price.
Display:
brand_name
avg_price

Round the average to 2 decimals.
Part E — JOINs
Use these tables:
Employees
EmpID	EmpName	DeptID
1	Alice	101
2	Bob	102
3	Charlie	103
4	David	101
5	Eve	NULL


Departments
DeptID	DeptName
101	HR
102	IT
103	Finance
104	Marketing


Q14. INNER JOIN
Write a query to display:
EmpName
DeptName

for employees who have a matching department.
Q15. LEFT JOIN
Write a query that displays all employees, including employees who don't have a department.
What will Eve's DeptName be?
Q16. RIGHT JOIN
Write a query that displays all departments, including departments that have no employees.
Which department will appear without an employee?
Q17. FULL JOIN in MySQL
MySQL doesn't directly support FULL JOIN.
Write a query using:
LEFT JOIN
UNION
RIGHT JOIN

to return all employees and all departments.
Part F — JOIN Understanding
Q18. CROSS JOIN
If:
Employees = 5 rows
Departments = 4 rows

How many rows will this produce?
SELECT *
FROM Employees
CROSS JOIN Departments;

And explain why.
Q19. SELF JOIN
Using only the Employees table, write a query to find employees who work in the same department, without matching an employee with themselves.
Expected columns:
Employee1
Employee2
DeptID

Q20. SELF JOIN reasoning
For the given data, which employee pairs should appear?
Alice   → 101
Bob     → 102
Charlie → 103
David   → 101
Eve     → NULL

Don't write SQL. Just give the pairs.
Part G — Anti JOIN
Q21.
You want to find employees who do not have a matching department.
Which approach is correct?
A.
SELECT e.EmpName
FROM Employees e
LEFT JOIN Departments d
ON e.DeptID = d.DeptID
WHERE d.DeptID IS NULL;

or
B.
SELECT e.EmpName
FROM Employees e
INNER JOIN Departments d
ON e.DeptID = d.DeptID
WHERE d.DeptID IS NULL;

Choose one and explain why.
Part H — Mixed Questions
These are intentionally more realistic.
Q22. GROUP BY + CASE + ORDER BY
Using used_phone_data, find the average used price for each OS.
Create a category:
average price > 150 → 'High'
otherwise           → 'Low'

Display:
os
avg_price
price_category

Sort from highest average price to lowest.
Q23. JOIN + WHERE
Using Employees and Departments, find employees who work in:
HR

Display:
EmpName
DeptName

Q24. JOIN + GROUP BY
Find the number of employees in each department.
Expected:
DeptName
employee_count

Include departments that currently have zero employees.
Think carefully about which JOIN you need.
Q25. Date + CASE
Suppose an employee table contains:
EmpName
joining_date

Write a query that displays:
EmpName
joining_date
experience_category

Rules:
years worked >= 5 → 'Experienced'
years worked 2–4 → 'Mid-level'
otherwise → 'Fresher'

Calculate years worked using:
FLOOR(DATEDIFF(NOW(), joining_date) / 365)

Part I — Debugging
Q26.
What's wrong with this query?
SELECT brand_name, AVG(used_price)
WHERE used_price > 100
FROM used_phone_data
GROUP BY brand_name;

Rewrite it correctly.
Q27.
What's wrong here?
SELECT brand_name,
       AVG(used_price)
FROM used_phone_data
WHERE AVG(used_price) > 150
GROUP BY brand_name;

Rewrite it correctly.
Q28.
Fix this query:
SELECT name,
CASE
    WHERE salary > 70000 THEN 'High',
    WHEN salary BETWEEN 50000 AND 70000 THEN 'Medium',
    ELSE THEN 'Low'
END AS status
FROM employees;

Part J — Final Challenges
Q29. Phone Analysis
Using used_phone_data, find the 3 brands with the highest average used price among phones with 8 GB or more RAM.
Required:
brand_name
avg_price

Use:
- WHERE
- GROUP BY
- AVG
- ROUND
- ORDER BY
- LIMIT
Q30. Final SQL Challenge
Using the Employees and Departments tables:
Return departments that have at least 2 employees.
Expected:
DeptName
employee_count

Sort by employee_count descending.
You will need to combine:
JOIN
GROUP BY
COUNT
HAVING
ORDER BY

Bonus — No typing
Answer these conceptually:
B1.
What's the difference between:
WHERE

and
HAVING

B2.
What's the difference between:
INNER JOIN
LEFT JOIN
RIGHT JOIN
CROSS JOIN

in one sentence each.
B3.
Why does this produce an error?
SELECT os, AVG(used_price)
FROM used_phone_data;

B4.
In a CASE expression, why do we use WHEN instead of WHERE?