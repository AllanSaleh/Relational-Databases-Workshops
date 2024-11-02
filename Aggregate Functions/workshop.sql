-- DDL: Data Definition Language: Creating our database based off of our ERD

CREATE DATABASE student_db;

USE student_db;

CREATE TABLE students (
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100),
start_date DATE,
-- cohort_id INT,
-- FOREIGN KEY(cohort_id) REFERENCES cohorts(id) 
);

-- Create Cohort Table/Entity
CREATE TABLE cohorts (
id INT AUTO_INCREMENT PRIMARY KEY,
cohort_name VARCHAR(50) NOT NULL
);

-- DML: Data Manipulation Language: Manipulating/Inserting data into our tables
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

SELECT * FROM students;

SELECT first_name, last_name FROM students;

-- Filtering Data (WHERE Clause)
SELECT *
FROM students
WHERE start_date BETWEEN '2024-07-01' AND '2024-10-01'
ORDER BY last_name DESC;

SELECT *
FROM students
WHERE MOD(ID,2)<>0
ORDER BY id DESC;

-- ALTER TABLE: adding 'cohort_id' attribute with FK constraint
ALTER TABLE students
ADD cohort_id INT;

ALTER TABLE students
ADD CONSTRAINT cohort_id
FOREIGN KEY (cohort_id) REFERENCES cohorts(id);

ALTER TABLE cohorts
ADD cohort_size INT;

SELECT * FROM cohorts;

UPDATE cohorts
SET cohort_size = 80
WHERE id = 1;

INSERT INTO cohorts (cohort_name, cohort_size)
VALUES ("SEP SE CORE", 70);

-- Aggregate Functions: SUM(), MIN(), MAX(), AVG(), COUNT()

-- COUNT(): Returns the amount of entries
SELECT COUNT(*)
FROM students;

SELECT COUNT(*)
FROM students
WHERE start_date BETWEEN '2024-07-01' AND '2024-10-01';

-- SUM(): Returns the sum of the entries 
SELECT SUM(cohort_size) as "Number of Students"
FROM cohorts;

-- MIN(): Returns the minimum value of the selected column
SELECT MIN(cohort_size)
FROM cohorts;

SELECT cohort_name, cohort_size
FROM cohorts
WHERE cohort_size = (SELECT MIN(cohort_size) FROM cohorts);

-- MAX(): Returns the maximum value of the selected column
SELECT MAX(cohort_size)
FROM cohorts;

-- AVG(): Returns the average value of the selected column
SELECT AVG(cohort_size)
FROM cohorts; 