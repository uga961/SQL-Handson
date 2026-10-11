# SQL Handson Practice

This repository is a collection of MySQL SQL practice scripts created during the SQL Primer course. Each file focuses on a specific topic and can be executed in a MySQL client such as MySQL Workbench, phpMyAdmin, or the MySQL command line.

## Overview

The scripts are organized by date and cover both foundational and intermediate SQL concepts. They are designed to help learners practice:

- Database creation and management
- Table structure design and updates
- Inserting, updating, and deleting records
- Querying data using SELECT and WHERE
- SQL functions for numbers, strings, and dates
- Grouping, filtering, sorting, and aggregation
- Joins and set operations
- Stored procedures, triggers, window functions, and views

## File Summary

| File | Topic | Main Concepts |
|---|---|---|
| [Mar 10.sql](./Mar%2010.sql) | Database and table basics | CREATE DATABASE, USE, CREATE TABLE, ALTER, RENAME, COPY/CLONE, DROP, TRUNCATE, INSERT |
| [Mar 11.sql](./Mar%2011.sql) | Data update and SQL functions | UPDATE, DELETE, SELECT, numeric functions, string functions, date functions |
| [Mar 12.sql](./Mar%2012.sql) | Data analysis and joins | GROUP BY, HAVING, ORDER BY, JOINS, aggregation, case-based analysis |
| [Mar 13.sql](./Mar%2013.sql) | Intermediate SQL practice | UNION, UNION ALL, WHERE, LIKE, arithmetic operators, stored procedures |
| [Mar 16.sql](./Mar%2016.sql) | Advanced SQL features | Triggers, window functions, ranking, lag/lead, views |

## Suggested Learning Flow

1. Start from [Mar 10.sql](./Mar%2010.sql) to learn database and table setup.
2. Continue with [Mar 11.sql](./Mar%2011.sql) to practice data updates and SQL functions.
3. Move to [Mar 12.sql](./Mar%2012.sql) to learn aggregation, grouping, and joins.
4. Use [Mar 13.sql](./Mar%2013.sql) to strengthen intermediate SQL logic with set operations and filters.
5. Finish with [Mar 16.sql](./Mar%2016.sql) to practice advanced SQL features.

## Notes

- Many scripts create their own demo databases such as `class1`, `class2`, `class3`, `class4`, and `class5`.
- Some examples use `DELIMITER` blocks because they define stored procedures and triggers.
- These scripts are educational and intended for practice rather than production database design.
- The code is written in a beginner-friendly style with comments to explain the syntax and purpose of each command.

## Typical MySQL Execution Flow

```sql
-- Example
CREATE DATABASE IF NOT EXISTS class1;
USE class1;

CREATE TABLE student (
    Roll_no INT,
    Student_name VARCHAR(50)
);

INSERT INTO student (Roll_no, Student_name)
VALUES (1, 'Alice');

SELECT * FROM student;
```

## Repository Structure

```text
SQL Handson/
├── Mar 10.sql
├── Mar 11.sql
├── Mar 12.sql
├── Mar 13.sql
├── Mar 16.sql
├── README.md
```

## Learning Outcome

By the end of these files, a learner should be comfortable with:

- Creating and managing databases and tables
- Writing CRUD operations
- Using SQL functions and filters
- Building analytical queries with groupings and ordering
- Applying joins and set-based logic
- Using advanced SQL constructs like procedures, triggers, and views

