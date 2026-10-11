create database class2;

use class2;

create table people
(Id int primary key auto_increment,
People_name varchar(50) not null unique,
occupation varchar(50) not null,
age int, check (age > 18),
country varchar(30) default 'India');

insert into people(Id, people_name, occupation, age, country)
values(101, "Amith", "Engineer", 45, "USA"),
(102, "Ugandhar", "Student", 21, "India"),
(103, "Varun", "Student", 22, "India"),
(104, "Anamika", "Student", 21, "India"),
(105, "Alok", "Student", 20, "USA");

select * from people;

/*
================================ UPDATE ================================
*/

/* 
To update parts of the records & Syntax is 
update 'table_name'
set 'attribute/column_name' = 'new_value'
where 'primary_key' (Id or something) = 'primary_key' (101/102 or etc for the required record)
*/

/* 
single field / record
*/

update people
set occupation = "Engineer"
where id = 102;

/*
Multiple fields /  records
*/

update people
set occupation = "Doctor", country = "India"
where id = 101;

/*
================================ DELETE ================================
*/

/*
Delete rows from table but not column or table & Syntax is 
delete from 'table_name'
where 'primary_key' = 'primary_key';
*/

delete from people
where id = 105;  -- if we dont give where statement, the entire table rows gets deleted.

/* ############################ DQL - DATA QUERY LANGUAGE ############################ */

/*
================================ SELECT ================================
*/

/*
Select from the table & Syntax is 
select 'column_name' from 'table_name'; 
we can use '*' for all 
Select is a important thing and used in a lot of functions.
*/

select * from people;  -- selecting entire table

select id, age from people; -- selecting one or more columns

select * from people
where age>21 and country = 'India';  -- selecting all columns while applying filter to a certain column

select occupation from people
where age>21 and country = 'India';

/*
Select can be used in multiple quries for multiple purposes
*/

select round(avg(age)) as Avg_age
from people;

/*
Lets create a new table and see the number functions.
*/

create table employees
(id int auto_increment primary key,
name varchar(50),
salary decimal(10,2));

insert into employees(name, salary)
values('Alice', 50000),
('Bob', 60000),
('Charlie', 55000),
('David', 70000),
('Eve', 48000);

-- 1. ABS (Absolute value)

select abs(-900) as Abs_value;  -- gives +900

-- 2. CEILING (Round up)

select ceiling(4.3) as Roundup_value; -- Round up to nearest integer (next number)

-- 3. FLOOR (Round down)

select floor(4.9) as Rounddown_value; -- Round down to nearest integer (same number)

-- 4. RAND (Random Values)

select rand() as random_value; -- Any random number

-- 5. ROUND (Rounding to certain decimals)

select round(4.6282, 2) as rounded_number; -- Rounded to 2 decimal numbers

-- 6. POW (Power off)

select POW(4,2) as powered_num; -- 4 to the power of 2

-- 7. SQRT (Square Root)

select SQRT(16) as squareroot_num; -- square root of number 16

-- 8. COUNT (Counting Rows)

select count(*) as TotalEmp from employees; -- counts total rows in certain column / table

-- 9. MIN & MAX (Minimum and Maximum)

select min(salary) from employees;
select max(salary) from employees;

-- 10. SUM (Sum of values)

select SUM(salary) from employees;

-- 11. AVG (Average)

select round(avg(salary), 2) as Avg_salary
from employees; -- average of salary rounded to 2 decimals

-- 12. STD (Standard Deviation)

select std(salary) as sd_salary from employees;

-- 13. SIGN (Sign of the number)

select sign(-900) as signed_number; -- '-1' for -ve and '+1' for +ve

-- 14. ISNUMERIC (is a Number)

select '123' REGEXP '^[0-9]+$' as IsNumeric; -- '^' means start, '[0-9]' means applicable vales, '+' means more than one character and '$' means end.

-- 15. EXP (Exponential)

select EXP(3) as Exp_value;

-- 16. LOG (Logarthamic)

select log(10) as log_value;


/*
Round & Count are very important in number functions
*/

/*
Lets see the text functions.
*/

-- 1. LOCATE (Position of the word)

select locate('o', 'Hello World') as CharIndex; -- First position of the letter

-- 2. REPLACE (Replace the word)

select replace('Hello world', 'world', 'guys') as replaced; -- replaces 'world' with 'guys'

-- 3. CONCAT (Combine two strings)

select concat('ABC', 'DEF', 'GHI') as combined_text; -- combines all togther;
select concat(left('abcdef',2), '//', right('ghijk',2)) as combined_text;

-- 4. LOWER & UPPER (Lower case & Upper case)

select lower('HELLO') as lowercase;
select upper('hello') as uppercase;

-- 5. LTRIM & RTRIM (Remove trailing spaces from left and right)

select ltrim('Ugandhar    ') as ltirmed;
select rtrim('       Ugandhar') as rtrimed;


-- 6. LEFT & RIGHT (Left and Right values)

select left('Ugandhar', 5) as lef;
select right('ugandhar',5) as rig;

-- 7. SUBSTRING (Part of the main String)

select substring('ugandhar',3,3) as subtext; -- ('string', 'start_pos', 'no_of_char')

-- 8. REPEAT (Repeats the same string)

select repeat('Ugandhar ',3) as repeatedtext;

-- 9. SPACE

select Space(5) as spaces;

-- 10. REVERSE (Revesre the string)

select reverse('ugandhar') as rev_text;

-- 11. CHAR_LENGTH (Length of the string)

select char_length('ugandhar') as length_of_the_name;

/* 
Length - bytes 
*/

/*
Lets see the date functions.
*/

use class2;
create table events
(id int auto_increment primary key,
event_name varchar(100),
event_date datetime);

insert into events(event_name, event_date)
values('New Year','2025-01-01 00:00:00'),
('Company Meeting','2025-03-15 14:30:00'),
('Conference' , '2025-06-20 09:00:00'),
('Chirstmas' , '2025-12-25 18:00:00');

-- 1. NOW

select now() as current_info;

-- 2. YEAR / DAY / MONTH

select event_name, year(event_date) as event_year from events;
select event_name, day(event_date) as event_day from events;
select event_name, month(event_date) as event_month from events;

-- 3. DATEDIFF (Difference between dates)

select event_name, ABS(datediff(event_date, now())) as remaining_days from events;

-- 4. DATE_ADD (Adds specific number of days/months/years to existing date)

select event_name, date_add(event_date, interval -10 day) as revised_date from events; -- can use '-ve' or '+ve' as well.

-- 5. CURRENT_TIMESTAMP 

select current_timestamp as currenttime;

-- 6. DATE_FORMAT (For specific format of data)

select event_name, date_format(event_date, '%M') as event_month from events; -- 'm' for the month number & 'M' for the month name
select event_name, date_format(event_date, '%W') as event_week from events; -- 'm' for the week number & 'M' for the week name
select event_name, date_format(event_date, '%Y') as event_week from events; -- 'y' for the short year & 'Y' for the full year

-- 7. LAST_DAY (Last of the month)

select last_day(event_date) as lastday from events;

-- 8. MAKEDATE (Make date on specific day of the year)

select makedate(2026, 200) as date;

-- 9. STR_TO_DATE check 

select event_name, if(str_to_date(event_date, '%y-%m-%s %h:%:%s') is not null, 1,0) as is_valid from events;

-- 10. UTC_TIMESTAMP

select utc_timestamp as utctime;

/*
Lets see the conversion functions.
*/

create table conversions
(id int auto_increment primary key,
number_value varchar(10),
date_value varchar(20),
float_value varchar(10),
datetime_value varchar(25));

insert into conversions(number_value, date_value, float_value, datetime_value)
values('123', '2025-03-01', '45.67', '2025-03-01 14:30:00'),
('456', '2024-12-25', '78.90', '2024-12-25 08:15:00'),
('789', '2023-07-10', '12.34', '2023-07-10 22:45:00');

-- 1. CAST - Convert string to integer

select number_value, cast(number_value as signed) as convertedinteger from conversions; -- signed will take -ve also

-- 2. CAST - Convert string to decimal

select number_value, cast(number_value as decimal(5,2)) as converteddecimal from conversions;

-- 3. CAST - Convert String to date

select date_value, cast(date_value as date) as converteddate from conversions;
select datetime_value, cast(datetime_value as datetime) as converteddate from conversions;

select date_value, date_format(cast(date_value as date), '%d-%m-%y' ) as formated_date from conversions;
select date_value, date_format(cast(date_value as date), '%d-%M-%Y' ) as formated_date from conversions;

/*
What is a CASE Statement in MySQL?
The CASE statement is used to implement conditional logic in SQL queries.
It works like an IF-ELSE staIement and is useful for creating computed columns based on conditions. 
*/

/*
SELECT
	column1,
	column2,
	CASE
		WHEN condition1 THEN result1
		WHEN condition2 THEN result2
	ELSE default_result
	END AS new_column
FROM table_name;
*/

CREATE TABLE employees100 (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
salary INT

);

INSERT INTO employees100 (name, salary) VALUES
('Alice', 3000),
('Bob', 6000),
('Charlie', 9000),
('David', 12000);

select 
	name,
    salary,
    case
		when salary < 5000 then 'Low'
        when salary between 5000 and 10000 then 'Good'
        when salary > 10000 then 'Best'
	end as Income_type
from employees100;
        
