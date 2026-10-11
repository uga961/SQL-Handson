/*
==============================================================
SQL Practice - Day 5
Topic: Triggers, Window Functions, and Views in MySQL

This file covers:
- Trigger creation and behavior
- ROW_NUMBER, RANK, DENSE_RANK
- LAG and LEAD analytic functions
- SQL VIEW creation and usage

Use this file for advanced SQL concepts and practical window analysis.
==============================================================
*/

create database class5;
use class5;

/*
Trigger in MYSQL
A trigger in MYSQL is a special rule that automatically runs when a special action happend on a table.

if this happens => then do that automatically.

Example - Log insert into a table, Suppose you have two table
1. student table (id, name)
2. Student_log(id, name, action_time)

Now we want log every new student added in table.

Create student_log table
*/

create table student
(id int,
name varchar(100));

create table student_log
(id int,
name varchar(100),
action_time datetime);

-- Trigger 

delimiter //
create trigger log_student_insert
after insert on student 
for each row

begin 
	insert into student_log(id,name, action_time)
    values (new.id, new.name, now());
end;
//
delimiter ;

insert into student
values (516,'Ugandhar');

select * from student_log;

show triggers from class5;

-- we have multiple things like 'after' 'before' 'insert' 'update' 'delete' and lot of more functions to use within trigger


/* Window Function */


CREATE TABLE Employees
(
EmpID INT PRIMARY KEY,
EmpName VARCHAR(50),
DeptID INT,
Salary INT

);

INSERT INTO Employees (EmpID, EmpName, DeptID, Salary) VALUES
(1, 'Alice', 101, 50000),
(2, 'Bob', 102, 60000),
(3, 'Charlie', 103, 70000),
(4, 'David', 101, 55000),
(5, 'Eve', 102, 62000);

CREATE TABLE Departments (
DeptID INT PRIMARY KEY,
DeptName VARCHAR(50)

);

INSERT INTO Departments (DeptID, DeptName) VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance'),
(104, 'Marketing');

-- 1. RANK Function

-- row_number()

select EmpID, EmpName, DeptID, Salary,
row_number() over (partition by DeptID order by salary Desc) AS RowNum
from employees;

-- row_number() without pratition by 

select EmpID, EmpName, DeptID, Salary,
row_number() over (order by salary Desc) AS RowNum
from employees;

-- rank()

select EmpID, EmpName, DeptID, Salary,
rank() over (partition by DeptID order by salary Desc) AS RankNum
from employees;

-- dense_rank()

select EmpID, EmpName, DeptID, Salary,
dense_rank() over (partition by DeptID order by salary Desc) AS DenseNum
from employees;

-- 2. AGGREGATE Function

-- sum

select DeptID,
sum(salary) over (partition by DeptID) as TotalSalary
from employees;

-- max & min

select DeptID,
max(salary) over (partition by DeptID) as maxSalary
from employees;

-- round

select DeptID,
round(avg(salary) over (partition by DeptID),2) as AvgSalary
from employees;

-- 3. ANALYTIC Function

-- lag

select EmpId, EmpName, Salary,
lag(Salary) over (order by salary desc) as PrevSalary
from employees;

select EmpId, EmpName, Salary,
lag(Salary,2) over (order by salary desc) as PrevSalary
from employees;

-- lead

select EmpId, EmpName, Salary,
lead(Salary) over (order by salary desc) as NextSalary
from employees;

select EmpId, EmpName, Salary,
lead(Salary,2) over (order by salary desc) as NextSalary
from employees;



/* VIEW Function */

/*
A SQL View is like a virtual table created from a SELECT query.
It doesn't store data itself - it just shows data from other tables in a neat, ready-made format.
You use it to simplify complex queries and make data easier to read.
*/

CREATE TABLE employees101 (
id INT,
name VARCHAR(100),
department VARCHAR(50),
salary INT);

INSERT INTO employees101 VALUES
(1, 'Alice', 'HR', 50000),
(2, 'Bob','IT', 70000),
(3, 'Charlie', 'Finance', 60000);

select * from employees101;

CREATE VIEW IT_emp as
select id , name, salary
from employees101
where department = 'IT';


select * from IT_emp;

select id , avg(salary) as avg_sal
from IT_emp
group by id;

CREATE VIEW emp_with_bonus AS
SELECT id, name, salary,
salary * 0.10 AS bonus,
salary + (salary * 0.10) AS total_salary
FROM employees101;

select * from emp_with_bonus;