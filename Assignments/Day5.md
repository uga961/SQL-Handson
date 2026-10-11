Part A — DDL, constraints and DML
Use the following scenario: a company wants to maintain employee records.
Q1. Create a database named day5_company and select it for use.
Q2. Create a table named employees with these columns:
Column	Requirement
emp_id	Integer, primary key, auto-increment
emp_name	VARCHAR(50), not null
email	VARCHAR(100), unique
age	Integer, must be greater than 18
department	VARCHAR(30), not null
salary	DECIMAL(10,2), default 25000
joining_date	DATE
Q3. Add a column city VARCHAR(30) to employees.
Q4. Change the salary column to DECIMAL(12,2).
Q5. Insert these five employees:
ID	Name	Email	Age	Department	Salary	Joining date
1	Asha	asha@demo.com	24	IT	65000	2022-03-10
2	Bharat	bharat@demo.com	29	HR	45000	2020-07-15
3	Charan	charan@demo.com	32	IT	85000	2019-01-20
4	Divya	divya@demo.com	26	Finance	55000	2023-06-01
5	Eshan	eshan@demo.com	35	IT	110000	2018-11-25
You may omit city and let it remain NULL.
Q6. Increase salaries by 10% for employees earning less than ₹60,000.
Q7. Delete employees whose age is greater than 60.
Q8. Explain the difference between DROP TABLE, TRUNCATE TABLE, and DELETE.
Part B — SELECT, functions and conditional logic
Use the employee data above.
Q9. Display employee names and salaries for employees earning between ₹50,000 and ₹90,000, inclusive.
Q10. Display each employee's name, salary, and salary category:
- Below ₹50,000 → Junior
- ₹50,000 through ₹80,000 → Mid-Level
- Above ₹80,000 → Senior
Use CASE.
Q11. Display each employee's name and how many complete days they have worked, using DATEDIFF() and NOW().
Q12. Display each employee's joining date in the format 25 November 2018, using DATE_FORMAT().
Q13. Convert the string '45000' into a numeric value using CAST().
Q14. Display the average salary rounded to two decimal places.
Part C — Aggregation, JOINs and set operators
Use these additional tables.
departments
DeptID	DeptName
10	IT
20	HR
30	Finance
40	Marketing
projects
ProjectID	EmpID	ProjectName	Budget
101	1	Website	100000
102	1	Security	80000
103	3	Analytics	150000
104	4	Payroll	60000
105	3	Automation	90000
Assume employees.emp_id matches projects.EmpID.
Q15. Display employee names and their department names using an INNER JOIN.
Q16. Display all departments, including departments with no employees, using a LEFT JOIN or an equivalent appropriate join arrangement.
Q17. Display each employee's name and the number of projects assigned to them. Include employees with zero projects.
Q18. Display departments whose average employee salary exceeds ₹60,000.
Q19. Display the total project budget assigned to each employee, sorted from highest to lowest.
Q20. Explain the difference between WHERE and HAVING, with one example of each.
Q21. Given two tables tbl1 and tbl2 with identical column structures, write queries using UNION, UNION ALL, INTERSECT, and EXCEPT.
Q22. What is the result of a CROSS JOIN between a table containing 5 employees and a table containing 4 departments?
Part D — Subqueries
Q23. Find employees earning more than the average salary of all employees. Do not hardcode the average.
Q24. Find the employee or employees earning the highest salary using a subquery with MAX().
Q25. Find employees working in departments where at least one employee earns more than ₹80,000. Use IN.
Q26. Find employees whose salary is greater than the salary of Asha. Use a scalar subquery.
Q27. Find employees whose salary is greater than the average salary of their own department. This is a correlated subquery: the inner query must refer to the outer employee's department.
Part E — Window functions
Q28. Display every employee's name, department, salary, and department-wise average salary using AVG() OVER (PARTITION BY ...).
Q29. Rank employees by salary within each department using DENSE_RANK(). The highest salary must receive rank 1.
Q30. Display every employee's salary alongside the previous salary in descending salary order, using LAG().
Part F — Triggers, views and stored procedures
Q31. Create a table salary_log with columns for employee ID, old salary, new salary, and change time.
Q32. Create an AFTER UPDATE trigger on employees that logs salary changes to salary_log. Use OLD and NEW values. Log only when the salary actually changes.
Q33. Create a view named high_salary_employees that shows employees earning more than ₹80,000. Then retrieve all rows from the view.
Q34. Create a stored procedure named show_it_employees that displays all IT employees, then call it.
Q35. Explain the difference between a trigger, a stored procedure, and a view.

Bonus challenges
These combine multiple concepts and are intentionally harder.
B1. Find the top two highest-paid employees in each department. Use a window function and explain why a normal LIMIT 2 would not solve the problem.
B2. Find employees who earn more than the average salary across the entire company but whose salary is below the maximum salary in their own department.
B3. Create a view showing department names, employee counts, and average salaries. Include departments with zero employees.
B4. Explain what happens if an AFTER UPDATE trigger attempts to insert into salary_log, but that insert fails. Consider the behavior of transactional tables such as InnoDB.
B5. A query uses ROW_NUMBER() to rank employees by salary. Two employees have the same salary. Explain how ROW_NUMBER(), RANK(), and DENSE_RANK() handle that tie.