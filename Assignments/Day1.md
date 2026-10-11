PART 1 — Database Setup
You are building a small College Management Database.
Q1
Create a database called:
college_day1

The command should not produce an error if the database already exists.
Then select/use this database.
Expected result
The database should exist and be selected.
You should be able to verify it with:
SELECT DATABASE();

Expected:
college_day1

PART 2 — Create the Main Table
Create a table called:
students

Initially, it must contain exactly these columns:
Column	Data Type
student_id	INT
student_name	VARCHAR(50)
father_name	VARCHAR(50)
gender	CHAR(1)
date_of_birth	DATE
department	VARCHAR(30)


Q2
Write the CREATE TABLE statement.
Do not add constraints yet.
Then run:
DESCRIBE students;

Expected structure
Field	Type	Null
student_id	int	YES
student_name	varchar(50)	YES
father_name	varchar(50)	YES
gender	char(1)	YES
date_of_birth	date	YES
department	varchar(30)	YES


PART 3 — ALTER TABLE: Add Columns
The college now wants additional information.
Q3
Add this column:
email VARCHAR(100)

Then add these two columns:
phone_number CHAR(10)
address VARCHAR(100)

Use ALTER TABLE.
Expected final structure
You should now have:
student_id
student_name
father_name
gender
date_of_birth
department
email
phone_number
address

PART 4 — Modify a Column
The college has decided that student_id can never be empty.
Q4
Modify student_id so that it becomes:
INT NOT NULL

Then run:
DESCRIBE students;

Expected
student_id should show:
Null = NO

PART 5 — Drop a Column
The college decides that storing the father's name is unnecessary.
Q5
Remove:
father_name

from the table.
Expected final columns
student_id
student_name
gender
date_of_birth
department
email
phone_number
address

PART 6 — Rename a Column
The college wants a shorter column name.
Q6
Rename:
date_of_birth

to:
dob

Keep the data type as:
DATE

Expected
dob DATE

PART 7 — Rename the Table
The college wants the table to be called:
college_students

Q7
Rename:
students

to:
college_students

Then verify using:
DESCRIBE college_students;

PART 8 — Table Cloning
Now we're going to test whether you actually understand the difference between the cloning methods.
Your current table is:
college_students

Q8
Create a table called:
students_backup

that copies the columns and existing data from:
college_students

Q9
Create another table called:
students_structure

that copies the table structure/columns and constraints, but does not copy the data.
Use the LIKE method.
Q10
Create another table called:
students_empty

using:
CREATE TABLE ... AS SELECT ...

with a condition that guarantees zero rows are copied.
The table should still contain the columns.
PART 9 — Verify the Three Clones
Run:
SELECT * FROM college_students;
SELECT * FROM students_backup;
SELECT * FROM students_structure;
SELECT * FROM students_empty;

At this stage, because we haven't inserted students yet:
Expected
All four tables contain:
0 rows

But they differ in how their structure was created.
This distinction is important.
PART 10 — DROP
Now remove only the unnecessary test tables:
students_backup
students_structure
students_empty

Q11
Write one SQL statement that drops all three tables.
Expected
Only this table should remain:
college_students

PART 11 — Build a People Table
Now we're moving into DML + constraints.
Create a table:
people

with exactly these requirements:
Column	Requirement
person_id	INT, PRIMARY KEY, AUTO_INCREMENT
person_name	VARCHAR(50), NOT NULL, UNIQUE
occupation	VARCHAR(50), NOT NULL
age	INT, CHECK age > 18
country	VARCHAR(30), DEFAULT 'India'


Q12
Write the complete CREATE TABLE statement.
PART 12 — Understand the Constraints
Before inserting anything, run:
DESCRIBE people;

You should be able to identify:
person_id
PRIMARY KEY
AUTO_INCREMENT

person_name
NOT NULL
UNIQUE

occupation
NOT NULL

age
CHECK(age > 18)

country
DEFAULT 'India'

You should understand what each one does before continuing.
PART 13 — Insert #1
Insert this person:
person_name	occupation	age	country
Arjun	Engineer	24	USA


Q13
Insert the record.
You should not manually provide person_id.
Expected
Because person_id is AUTO_INCREMENT, the database generates it.
Expected:
person_id	person_name	occupation	age	country
1	Arjun	Engineer	24	USA


PART 14 — Multiple Row INSERT
Insert these three people in a single INSERT statement:
person_name	occupation	age	country
Ravi	Designer	27	India
Meera	Doctor	31	Canada
Kiran	Developer	22	India


Q14
Use one INSERT INTO statement.
Expected table
person_id	person_name	occupation	age	country
1	Arjun	Engineer	24	USA
2	Ravi	Designer	27	India
3	Meera	Doctor	31	Canada
4	Kiran	Developer	22	India


PART 15 — DEFAULT
Now insert:
person_name = "Priya"
occupation = "Teacher"
age = 29

Do not provide the country.
Q15
Write the INSERT statement.
Expected
The database automatically supplies:
country = India

Expected new row:
person_id	person_name	occupation	age	country
5	Priya	Teacher	29	India


PART 16 — Constraint Test: UNIQUE
Q16
Try to insert:
person_name = Ravi
occupation = Manager
age = 30
country = India

What should happen?
It should fail.
Why?
Because:
Ravi

already exists and person_name has a UNIQUE constraint.
Do not change the table to make it work.
PART 17 — Constraint Test: NOT NULL
Q17
Try inserting a person with:
person_name = NULL
occupation = Engineer
age = 25
country = India

Expected
The INSERT should fail.
Reason
person_name has:
NOT NULL

PART 18 — Constraint Test: CHECK
Q18
Try inserting:
person_name = "Rahul"
occupation = "Student"
age = 18
country = India

Expected
The INSERT should fail.
Why?
The table requires:
age > 18

But:
18 > 18

is false.
PART 19 — Another CHECK Test
Q19
Try:
person_name = "Sanjay"
occupation = "Student"
age = 17
country = India

Expected:
FAIL
Then try:
person_name = "Sanjay"
occupation = "Student"
age = 19
country = India

Expected:
SUCCESS
PART 20 — INSERT Without Column Names
Now insert one more person:
person_id = 6
person_name = "Vikram"
occupation = "Analyst"
age = 26
country = "UK"

Q20
Insert the complete row without mentioning the column names.
You should understand why the values must be supplied in the correct column order.
Expected:
person_id	person_name	occupation	age	country
6	Vikram	Analyst	26	UK


PART 21 — AUTO_INCREMENT Check
Now insert:
person_name = "Neha"
occupation = "Scientist"
age = 28

Do not provide:
- person_id
- country
Q21
What should happen?
Expected:
person_id = 7
country = India

So:
person_id	person_name	occupation	age	country
7	Neha	Scientist	28	India


PART 22 — DDL + DML Mixed Challenge
Now let's stop following the order of your class.
You are given a completely new requirement.
Create a database:
company_day1

Inside it create:
employees

with the following initial columns:
Column	Type
employee_id	INT
employee_name	VARCHAR(50)
job_role	VARCHAR(50)
joining_date	DATE


Q22
Create the database and table.
Q23
Now modify the table so that:
employee_id

becomes:
INT NOT NULL

Then add:
salary INT
department VARCHAR(30)

Q24
The company decides that job_role should instead be called:
designation

Rename the column.
Q25
The company doesn't want to store salary anymore.
Drop:
salary

Q26
Rename:
employees

to:
company_employees

PART 23 — Final Challenge
This is the main Day 1 assessment.
You are designing a library database.
Create:
library_day1

and use it.
Then create a table:
books

with:
Column	Requirement
book_id	INT, PRIMARY KEY, AUTO_INCREMENT
book_name	VARCHAR(100), NOT NULL, UNIQUE
author	VARCHAR(50), NOT NULL
price	INT
publication_country	VARCHAR(30), DEFAULT 'India'


Q27
Create the database and table.
Q28
Insert these books:
book_name	author	price	publication_country
Atomic Habits	James Clear	500	USA
The Alchemist	Paulo Coelho	350	Brazil
Wings of Fire	A.P.J. Abdul Kalam	450	India
Clean Code	Robert Martin	700	USA


Use one INSERT statement.
Q29
Insert:
book_name = "The Pragmatic Programmer"
author = "David Thomas"
price = 650

Don't provide the country.
Expected
publication_country = India

Q30
Create a clone of books called:
books_backup

including the current data.
Q31
Create:
books_structure

that copies the structure using LIKE.
It should contain:
0 rows

Q32
Create:
books_empty

using:
CREATE TABLE ... AS SELECT

and a condition that produces zero rows.
PART 24 — Final Verification
At the end, run:
SELECT * FROM books;
SELECT * FROM books_backup;
SELECT * FROM books_structure;
SELECT * FROM books_empty;

Expected books
book_id	book_name	author	price	publication_country
1	Atomic Habits	James Clear	500	USA
2	The Alchemist	Paulo Coelho	350	Brazil
3	Wings of Fire	A.P.J. Abdul Kalam	450	India
4	Clean Code	Robert Martin	700	USA
5	The Pragmatic Programmer	David Thomas	650	India


Expected books_backup
Same 5 rows.
Expected books_structure
0 rows, but the table structure should exist.
Expected books_empty
0 rows, with the selected column structure created by the AS SELECT method.
Part 25 — Final Destruction Test
This tests whether you understand the difference between DROP and TRUNCATE.
Q33
Create a temporary table:
test_table

with:
id INT
name VARCHAR(50)

Insert three rows.
Then use:
TRUNCATE

Verify
SELECT * FROM test_table;

Expected:
Empty set

But:
DESCRIBE test_table;

should still work.
Q34
Now remove the table completely using:
DROP TABLE

Then try:
DESCRIBE test_table;

Expected:
Error — table does not exist.