-- This is a comment
/* 
This is also a comment
but for multiple lines 
*/

/* ############################ DDL - DATA DEFINITION LANGUAGE ############################ */

/*
================================ CREATE ================================
*/

create database if not exists class1;   -- we can use "create database 'database_name';"

/* create database 'database_name' for first time
and use create database if not exists 'databasename'; for preventing error in duplication */

/* 
Creating a database is not enough and we have to use it, 
so we use the command use 'database_name' 
*/	

-- Every line should end with semicolumn (;)

use class1;

/* Creattion of a table, the syntax is 
create table 'table_name' / 'database_name.table_name'
('column_name' variable);
*/

create table class1.student
(Roll_no int,
Student_name varchar(50),
Father_name varchar(50),
Gender char(2),
Age int,
DoB date);

-- describe student;
-- select * from student;

/*
================================ ALTER ================================
*/

/* Changes the properties of the table */

use class1;

/*
 Single Column
*/

/*
Addition of new column & Syntax is
alter table table_name
add(column_name variable)';' for single  or last line & ',' for multiple lines
*/

alter table student
add (Subject_name varchar(50)); -- Adds a new column 'Subject_name' 

-- select * from student;

/*
Multiple Columns
*/

alter table student
add (Address varchar(50)),
add (Pin_Code char(6));

-- select * from student;

/*
Modification of existing column & Syntax is
alter table table_name
modify column_name variable 'property';
*/

alter table student
modify Roll_no int Not null; -- Changes the property of Roll_no to 'NOT NULL'

-- describe student;

/*
Drop/Deletion of existing column & Syntax is
alter table table_name
drop column 'column_name';
*/

alter table student
drop column age; -- drops the age column from the table.

-- describe student;

/*
Rename of existing column & Syntax is
alter table table_name
change column 'column_name' 'New_name' variable;
*/

alter table student
change column DoB Date_of_Birth date;

-- describe student;

/*
================================ RENAME ================================
*/

/*
Rename of existing table & Syntax is
alter table table_name
rename to 'New_Name';
*/

alter table student
rename to student_details;

alter table student_details
rename to student;

/*
================================ COPY/CLONE ================================
*/

/* 
Copying/Cloning of the table & Syntax is 
create table if not exists 'new_table_name'
select * from 'main_table_name;
*/

create table if not exists copy_of_student
select * from student;

/* 
Copying/Cloning of the table format only (columns and constrains) & Syntax is 

Method 1:
create table if not exists 'new_table_name' like 'main_table_name' (only copies/clones the column names and constrains.)

Method 2:
create table 'table_name'
as
select * from 'main_table_name'
where 1 = 0  (Since 1 != 0, and the loop failes and copies only the columns and variables but not any rows)
*/

create table if not exists student_demo like student; 

create table if not exists demo
as
select * from student
where 1=0;

/*
================================ DROP ================================
*/

/* 
To delete or drop any table /s or database & Syntax is 
drop table 'table1_name', 'table2_name';
drop database 'database_name';
*/

drop table copy_of_student, student_demo, demo;

drop database uga961;

/*
================================ TRUNCATE ================================
*/

/* 
Removal of entire data without removing the structre or anything & Syntax is 
tuncate table 'table_name';
*/

-- truncate table 'table_name';

/* ############################ DML - DATA MODIFICATION LANGUAGE ############################ */

create table people
(Id int primary key auto_increment,
People_name varchar(50) not null unique,
occupation varchar(50) not null,
age int, check (age > 18),
country varchar(30) default 'India');

-- select * from people;

/*
================================ INSERT ================================
*/

/* 
To insert values into the table & Syntax is 
insert into 'table_name'(clm1, clm2, clm3)
values (v1,v2,v3);  -- for srings, use "value1"
or
insert into 'table_name'
values (v11,v21,v31), (v12,v22,v32);  -- no need of mentioning all the column names
*/

insert into people(Id, people_name, occupation, age, country)
values(101, "Amith", "Engineer", 45, "USA");

-- select * from people;

insert into people(Id, people_name, occupation, age, country)
values(102, "Ugandhar", "Student", 21, "India"),
(103, "Varun", "Student", 22, "India");

-- select * from people;

insert into people
values(104, "Anamika", "Student", 21, "India");

/*
No need to mention auto_increment column and default column some times
*/

insert into people(people_name, occupation, age)
values("Alok", "plumber", 23);