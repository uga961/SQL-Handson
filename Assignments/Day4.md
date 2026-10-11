Reference tables
Use the Student_Records table from your class notes.
Student_Id	First_Name	Address	Age	Percentage	Grade
201	Akash	Delhi	18	89	A2
202	Bhavesh	Kanpur	19	93	A1
203	Yash	Delhi	20	89	A2
204	Bhavna	Delhi	19	78	B1
205	Yatin	Lucknow	20	75	B1
206	Ishika	Ghaziabad	19	51	C1
207	Vivek	Goa	20	62	B2
Also use the set-operator tables from class:
tbl1
Id	Name
1	Sam
2	Harry
3	Jack
tbl2
Id	Name
3	Jack
4	leo
5	max
For stored procedure questions, use Student_Records10, which has the same structure and data as Student_Records.

Part A — SELECT and filtering
Q1. Display all columns for students whose percentage is greater than 80.
Q2. Display only First_Name, Age, and Percentage for students aged between 19 and 20, inclusive.
Q3. Display students whose grade is either B1 or B2, using IN.
Q4. Display students whose percentage is not greater than 80. Use NOT.
Q5. Find students whose first name starts with A.
Q6. Find students whose first name ends with H.
Q7. Find students whose first name contains the letter A, regardless of its position.
Q8. Find students whose first name starts with A and has exactly one additional character. Use _ correctly.
Part B — Set operators
Q9. Write a query that combines tbl1 and tbl2 and removes duplicate rows.
Q10. Write a query that combines both tables while preserving duplicates.
Q11. Return only rows common to both tables using INTERSECT.
Q12. Return rows present in tbl1 but not in tbl2, using EXCEPT.
Q13. Explain the difference between UNION and UNION ALL in one or two sentences.
MySQL note: INTERSECT and EXCEPT are supported in MySQL 8.0.31 and later. If your installed version is older, tell me your version and we can use equivalent queries. This note is additional context; your class notes list the operators by name.
Part C — Conditions and combined logic
Q14. Display students who live in Delhi and have a percentage greater than 80.
Q15. Display students who live in Delhi or have a percentage greater than 90.
Q16. Display students whose age is not 18 and whose grade is B1 or B2.
Q17. Display students whose percentage is between 60 and 90, inclusive, and whose address is either Delhi or Goa.
Part D — Arithmetic operations
Write SQL queries for the following:
Q18. Calculate 7 DIV 2.
Q19. Calculate 7 / 2.
Q20. Calculate the sum, difference, product, and quotient of 18 and 4 in one query, using aliases to label each result.
Q21. What does SELECT 10 / 0; return in your MySQL environment? Execute it and report the result or error. Your notes say division by zero gives NULL; verify that behavior in your setup.
Part E — Aggregates and multi-logic practice
These questions combine Class 4 filtering with the aggregate functions you learned earlier.
Q22. Find the average percentage for all students, rounded to two decimal places.
Q23. Count the students in each grade. Display the grade and student count, with the largest group first.
Q24. Display each address and its average student percentage, but only for addresses whose average is greater than 80.
Q25. Display the top two students by percentage, showing their names and percentages.
Part F — Stored procedures
Use Student_Records10.
Q26. Write a stored procedure called show_students that displays every row from Student_Records10. Then call it.
Q27. Write a stored procedure called high_scorers that displays students whose percentage is greater than 80. Then call it.
Q28. Explain the purpose of DELIMITER // and DELIMITER ; when defining a stored procedure in the MySQL client.
Q29. Your class notes show:
CREATE PROCEDURE tred()
BEGIN
    SELECT * FROM Student_Records10;
END //


Explain why the procedure definition uses END // rather than END; when the delimiter has been changed to //.
Part G — Debugging
For each question, identify the error and rewrite the query correctly.
Q30.
SELECT First_Name Percentage
FROM Student_Records
WHERE Percentage > 80
ORDER BY Percentage DESC
LIMIT 3;


Hint: Look carefully at the selected columns.
Bonus B1. Fix this query so it returns students living in Delhi or Goa with a percentage greater than 70:
SELECT *
FROM Student_Records
WHERE Address = 'Delhi' OR Address = 'Goa'
AND Percentage > 70;


Bonus B2. Explain why parentheses matter when combining AND and OR.
Bonus B3. Your stored procedure is already created, and you run CREATE PROCEDURE tred() again. What problem might occur, and what would you do before recreating it?
Bonus B4. A query uses WHERE Percentage > 80 and HAVING AVG(Percentage) > 80. Explain the difference between the two filters.