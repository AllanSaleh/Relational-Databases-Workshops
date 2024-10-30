-- DDL: Data Definition Language: Creating our database based off of our ERD
CREATE DATABASE student_db;

USE student_db;

-- Create Students  Table/Entity
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    start_date DATE
);

-- Create Cohort Table/Entity
CREATE TABLE cohorts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cohort_name VARCHAR(50) NOT NULL
);

-- DML: Data Manipulation Language: Manipulating/Inserting data into our tables
-- UPDATE & DELETE DATA
INSERT INTO students (
    first_name,
    last_name,
    email,
    start_date
) VALUES (
    'Tony',
    'Sotelo',
    'tonys@ct.com',
    '2024-09-01'
);

INSERT INTO students (
    first_name,
    last_name,
    email,
    start_date
) VALUES (
    'Rahil',
    'Charniya',
    'rahilc@ct.com',
    '2024-08-01'
), (
    'Victoria',
    'Santiago',
    'victioras@ct.com',
    '2024-04-01'
);

INSERT INTO cohorts (
    cohort_name
) VALUES (
    'OCT SE CORE'
);

UPDATE students
SET email = 'beststudentever@gmail.com'
WHERE id = 3;

DELETE FROM students
WHERE id = 3;

-- DQL (Data Query Language): Searching/Querying data from our database 
SELECT *
FROM students;

SELECT first_name, last_name
FROM students;

-- Filtering Data (WHERE Clause)
SELECT *
FROM students
WHERE start_date BETWEEN '2024-07-01' AND '2024-10-01'
ORDER BY last_name DESC;

-- Sorting Data (ORDER BY Clause: Ascending order is default)
SELECT *
FROM students
WHERE MOD(ID,2)<>0
ORDER BY id DESC;