create database class4;

use class4;

-- set operators:
-- 1.union: this will remove duplicate from tables.
-- 2.union all:this will not remove duplicates.

-- 3.intersect:Data that is present in both the tables.
-- 4.Except:data that is present in either table1.For e.g A-B OR B-A.

create table tbl1
(Id int, Name char(10));

insert into tbl1
values(1,'Sam'),(2,'Harry'),(3,'Jack');

create table tbl2
(Id int, Name char(5));

insert into tbl2
values(3,'Jack'),(4,'leo'),(5,'max');



select * from tbl1
union 
select * from tbl2;

select * from tbl1
union all
select * from tbl2;




/* ALL at a glance */

CREATE TABLE Student_Records(
Student_Id Int PRIMARY KEY,
First_Name VARCHAR (20),
Address VARCHAR (20),
Age Int NOT NULL,
Percentage Int NOT NULL,
Grade VARCHAR (10));

INSERT INTO Student_Records VALUES
(201, "Akash", "Delhi", 18, 89, "A2"),
(202, "Bhavesh", "Kanpur", 19, 93, "A1"),
(203, "Yash", "Delhi", 20, 89, "A2"),
(204, "Bhavna", "Delhi", 19, 78, "B1"),
(205, "Yatin", "Lucknow", 20, 75, "B1"),
(206, "Ishika", "Ghaziabad", 19, 51, "C1"),
(207, "Vivek", "Goa", 20, 62, "B2");

/* SELECT */

-- all columns

select * from student_records;

-- one column

select First_name from student_records;

-- two or more columns

select student_id, first_name from student_records;

-- alias name 

select student_id as register_number from student_records;

-- where clause

select * from student_records
where percentage >80;

-- OR & AND

select * from student_records
where address = 'lucknow' and grade ='b1';

select * from student_records
where address = 'lucknow' or grade ='b1';

-- NOT

select * from student_records
where not percentage >80;

-- Comparision

select * from student_records
where age <18;

select * from student_records
where age >18;

select * from student_records
where age =18;

select * from student_records
where age <>18; -- not is equal to '<>'

-- Between

select * from student_records
where age between 19 and 20;

-- IN

select * from student_records
where grade in ('b1','b2');


-- Like (pattern matching)

/*
% (percent) - this wilcard character matches
			  zero , one or more than one char
_ (underscore) - this wilcard character matches
				only one or a single char.
*/

select * from student_records
where grade like 'A_'; -- anything starts with A and has 1 character of anything.

select * from student_records
where first_name like '%H'; -- any text ends woth H

select * from student_records
where first_name like 'A%'; -- any text starts with A

select * from student_records
where first_name like 'A%H';  -- start with A and end with H

select * from student_records
where first_name like '%A%';  -- any text with A

-- Arthmetics operation
-- divide by 0, gives NULL

select 7 div 2; -- remainder without decimal
select 7/2; -- remainder with decimal
select 7*2;

select 7+2;
select 7-2;


/* #################################################### MACROS #################################################### */

/*
A ** stored procedure ** in MySQL is a saved block of SQL code that you can run anytime with a single command.
It helps automate repetitive tasks, improves performance, and keeps your code organized
You execute it using
'CALL procedure_name()';
*/

CREATE TABLE Student_Records10(
Student_Id Int PRIMARY KEY,
First_Name VARCHAR (20),
Address VARCHAR (20),
Age Int NOT NULL,
Percentage Int NOT NULL,
Grade VARCHAR (10));


INSERT INTO Student_Records10 VALUES
(201, "Akash", "Delhi", 18, 89, "A2"),
(202, "Bhavesh", "Kanpur", 19, 93, "A1"),
(203, "Yash", "Delhi", 20, 89, "A2"),
(204, "Bhavna", "Delhi", 19, 78, "B1"),
(205, "Yatin", "Lucknow", 20, 75, "B1"),
(206, "Ishika", "Ghaziabad", 19, 51, "C1"),
(207, "Vivek", "Goa", 20, 62, "B2");

select * from student_records10;

-- Store Procedure

delimiter //

create procedure tred()

begin

select * from Student_Records10;

end //

delimiter ;

-- call

call tred;