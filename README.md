# SQL Hands-On Practice

[![Database](https://img.shields.io/badge/Database-MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Tool](https://img.shields.io/badge/IDE-MySQL%20Workbench-00758F?style=flat-square&logo=mysql&logoColor=white)](https://www.mysql.com/products/workbench/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)

A structured collection of MySQL practice scripts and exercises developed during the **SQL Primer** course. This repository provides a day-by-day roadmap covering foundational DDL/DML operations to advanced relational database concepts like window functions, stored procedures, triggers, and analytical views.

---

## Overview

This repository serves as a hands-on guide for learning SQL using **MySQL Workbench**. The scripts follow a progressive learning path designed to help developers and analysts build, query, and optimize relational databases through practical SQL execution.

---

## Key Features

* 📊 **Structured Curriculum:** Day-by-day modules covering SQL fundamentals to advanced features.
* 🛠️ **MySQL Workbench Ready:** Fully formatted `.sql` scripts with explicit delimiter statements for easy execution.
* 📝 **Annotated Code:** Detailed inline comments explaining syntax, execution order, and database logic.
* 🧠 **Practical Assignments:** Includes dedicated practice problems and query challenges in the `Assignments/` folder.

---

## Repository Architecture

```text
SQL-Handson/
│
├── Day 1.sql            # Database & Table Basics (DDL & Basic DML)
├── Day 2.sql            # Data Manipulation & Built-in Functions
├── Day 3.sql            # Data Analysis, Aggregations & Joins
├── Day 4.sql            # Set Operations, Filtering & Stored Procedures
├── Day 5.sql            # Advanced Features (Triggers, Window Functions, Views)
├── Assignments/         # Practice sets and assignment queries
└── README.md            # Project documentation

```

---

## Curriculum Breakdown

| Module | Topic | Core Concepts & Commands |
| --- | --- | --- |
| **[Day 1.sql](https://www.google.com/search?q=./Day%25201.sql)** | Database & Table Setup | `CREATE DATABASE`, `USE`, `CREATE TABLE`, `ALTER`, `RENAME`, `DROP`, `TRUNCATE`, `INSERT` |
| **[Day 2.sql](https://www.google.com/search?q=./Day%25202.sql)** | Data Updates & Functions | `UPDATE`, `DELETE`, `SELECT`, Numeric, String, and Date/Time Functions |
| **[Day 3.sql](https://www.google.com/search?q=./Day%25203.sql)** | Data Analysis & Joins | `GROUP BY`, `HAVING`, `ORDER BY`, Inner/Outer `JOINS`, Aggregations, `CASE` Statements |
| **[Day 4.sql](https://www.google.com/search?q=./Day%25204.sql)** | Intermediate Queries | `UNION`, `UNION ALL`, `LIKE`, Pattern Matching, Arithmetic Operators, Stored Procedures |
| **[Day 5.sql](https://www.google.com/search?q=./Day%25205.sql)** | Advanced SQL Features | Triggers, Window Functions (`ROW_NUMBER`, `RANK`, `LAG`, `LEAD`), Views |

---

## Getting Started with MySQL Workbench

### Prerequisites

Make sure you have **MySQL Server** and **MySQL Workbench** installed on your machine.

* Download from [MySQL Official Downloads](https://www.google.com/search?q=https://dev.mysql.com/downloads/workbench/)

### Execution Instructions

1. **Clone the repository:**
```bash
git clone [https://github.com/uga961/SQL-Handson.git](https://github.com/uga961/SQL-Handson.git)

```


2. **Launch MySQL Workbench** and connect to your MySQL Server instance.
3. Open any script file (`File -> Open SQL Script...` or `Ctrl + Shift + O`).
4. Execute the script line-by-line using `Ctrl + Enter` or run the whole file using `Ctrl + Shift + Enter`.

---

## Code Blueprint Example

Here is a quick look at the typical execution flow used throughout the scripts:

```sql
-- Create and switch to a dedicated working database
CREATE DATABASE IF NOT EXISTS class1;
USE class1;

-- Define table schema
CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50) NOT NULL,
    enrollment_date DATE
);

-- Insert sample records
INSERT INTO student (student_name, enrollment_date)
VALUES ('Alice', CURDATE());

-- Retrieve and analyze data
SELECT * FROM student;

```

> **Note:** Scripts defining Stored Procedures or Triggers utilize custom `DELIMITER //` blocks to ensure smooth execution in MySQL Workbench.

---

## Key Learning Outcomes

By working through these scripts, you will master:

* Designing schema layouts and executing CRUD operations.
* Writing analytical queries using aggregate functions, groupings, and table joins.
* Performing complex window calculations (`RANK`, `DENSE_RANK`, `LAG`/`LEAD`).
* Automating database logic using **Stored Procedures**, **Triggers**, and reusable **Views**.

---

## Contributing

Suggestions, bug fixes, and additional SQL exercises are welcome!

1. **Fork** the repository.
2. **Create** a new branch (`git checkout -b feature/SQL-Challenge`).
3. **Commit** your enhancements (`git commit -m 'Add new join challenge'`).
4. **Push** to the branch (`git push origin feature/SQL-Challenge`).
5. **Open** a Pull Request.

---

## Author

**Vaddi Ugandhar**

* **GitHub:** [@uga961](https://www.google.com/search?q=https://github.com/uga961)

---

## License

Distributed under the MIT License. See `LICENSE` for details.

---
