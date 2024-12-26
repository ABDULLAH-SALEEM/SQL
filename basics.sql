CREATE DATABASE College;

CREATE DATABASE IF NOT EXISTS College;

USE College;

DROP DATABASE IF EXISTS Company;

SHOW DATABASES;
SHOW TABLES;


CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(50),
age INT NOT NULL
);

INSERT INTO student VALUES(1,"Abdullah", 22);
INSERT INTO student VALUES(2,"Asad", 23);

INSERT INTO student
(id,name,age)
VALUES
(3,"Ali",24),
(4,"zain", 20);

SELECT * FROM student;

CREATE TABLE temp1(
id INT UNIQUE NOT NULL,
name VARCHAR(50) NOT NULL,
age INT NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE temp2(
id INT UNIQUE NOT NULL,
name VARCHAR(50) NOT NULL,
age INT NOT NULL CHECK (age>=18),
PRIMARY KEY(id)
);

INSERT INTO temp1 VALUES(0001,"Abdullah Saleem", 22);

INSERT INTO temp1 VALUES(0001,"Abdullah Saleem", 22);-- will through error


SELECT * FROM temp1;



CREATE DATABASE school;

USE school;

CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL CHECK (marks>=0),
grade VARCHAR(2),
city VARCHAR(20)
);

CREATE TABLE department(
id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE teacher(
id INT PRIMARY KEY,
name VARCHAR(50),
dep_id INT ,
FOREIGN KEY(dep_id) REFERENCES department(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

-- ALTER TABLE SCHEMA ADD COLUMN, DROP COLUMN, RENAME TABLE, CHANGE COLUMN, MODIFY COLUMN

ALTER TABLE student ADD COLUMN age INT NOT NULL CHECK (age>0) DEFAULT 20;
ALTER TABLE student DROP COLUMN age;
ALTER TABLE student RENAME TO pupil;

ALTER TABLE student CHANGE COLUMN age dob DATETIME NOT NULL;
ALTER TABLE student MODIFY COLUMN age  DATETIME NOT NULL;

-- TRUNCATE TABLE (deletes alll table data unlike DROP which delete the table itself)

TRUNCATE TABLE department;


SELECT * FROM student;


INSERT INTO department VALUES(001, "SCIENCE");
INSERT INTO department VALUES(002, "ENGLISH");

UPDATE  department
SET name="SCI"
WHERE id=001;

DELETE FROM department WHERE id=002;


DROP TABLE department;

INSERT INTO teacher VALUES(001,"AHAD",001),(002,"ALI",002),(003,"ANAS",001);

SELECT * FROM teacher;
SELECT * FROM department;
INSERT INTO student VALUES
(001, "ABDULLAH SALEEM", 80, "A", "KARACHI"),
(002, "ASAD ALI", 85, "A", "KARACHI"),
(003, "ANAS", 73, "B", "LAHORE"),
(004, "ZAIN", 20, "F", "KARACHI"),
(005, "HASSAN", 70, "C", "ISLAMABAD"),
(006, "ALI", 60, "C", "PESHAWAR");

SELECT * FROM student;

SELECT name, grade FROM student;

SELECT DISTINCT city FROM student;

SELECT * FROM student WHERE marks>=80;

SELECT * FROM student WHERE marks>=70 AND city="KARACHI" OR city="PESHAWAR";

-- ARTHEMATIC OPERATORS +, -, /, *, %
-- COMPARISON OPERATORS ==, !=, >, >=, <, <=
-- LOGICAL OPERATORS AND, OR, NOT, IN, BETWEEN, LIKE, ANY 

SELECT * FROM student WHERE marks BETWEEN 70 AND 80;

SELECT * FROM student WHERE marks IN(20,70,90);

-- LIMIT -- TO LIMIT DATA  
SELECT * FROM student WHERE marks IN(20,70,90, 85) LIMIT 2;

-- ORDER BY CLAUSE ASC DESC

SELECT * FROM student ORDER BY marks ASC;

-- Aggregate Functions COUNT(), MIN(), MAX(),AVG(), SUM()

SELECT COUNT(marks) FROM student;

-- GROUP BY

SELECT COUNT(name), city FROM student GROUP BY city;

SELECT AVG(marks), city FROM student GROUP BY city ORDER BY AVG(marks) ASC;


SELECT grade, COUNT(name) FROM student GROUP BY grade;


-- HAVING CLAUSE

SELECT city, COUNT(name) FROM student GROUP BY city HAVING MAX(marks)>80;

-- Update Query

-- UPDATE table_name
-- SET col1=val1,col2=val2
-- WHERE condtion

-- SET SQL_SAFE_UPDATES=0;
UPDATE student
SET grade="A+"
WHERE grade="A";

UPDATE student
SET marks=marks+1;

UPDATE student
SET marks=marks+20
WHERE id=4;

SELECT * FROM student;


-- DELETE

-- DELETE FROM table_name WHERE condition;

DELETE FROM student WHERE marks=40;


-- JOINS IN SQL (used to join two or more tables based on common columns)
-- INNER JOIN. (used to get common data between two or more tables)
-- OUTER JOIN  
   -- LEFT JOIN  (used to get data of either table A or data overlapping betwen table A or table B)
   -- RIGHT JOIN.(used to get data of either table B or data overlapping betwen table A or table B)
   -- FULL JOIN. (used to get full combined data of both tables)

-- JOIN SYNTAX
-- SELECT colums FROM tableA JOIN NAME tableB ON tableA.col=tableB.col 
INSERT INTO teacher(id,name) VALUES (004, "zain");
-- INNER JOIN
SELECT  * FROM teacher INNER JOIN department ON teacher.dep_id=department.id;
-- LEFT JOIN
SELECT * FROM teacher LEFT JOIN department ON teacher.dep_id=department.id;
-- RIGHT JOIN
SELECT * FROM teacher RIGHT JOIN department ON teacher.dep_id=department.id;
-- FULLL JOIN
SELECT * FROM teacher 
RIGHT JOIN department 
ON teacher.dep_id=department.id 
UNION
SELECT * FROM teacher 
LEFT JOIN department 
ON teacher.dep_id=department.id ;

-- LEFT EXCLUSIVE JOIN (used to get data of table A which is not common in table B)
SELECT * FROM teacher LEFT JOIN department ON teacher.dep_id=department.id WHERE department.id IS NULL;


-- RIGHT EXCLUSIVE JOIN (used to get data of table B which is not common in table A)
SELECT * FROM teacher RIGHT JOIN department ON teacher.dep_id=department.id WHERE teacher.dep_id IS NULL;

-- SELF JOIN (used to join table with itself)
SELECT * FROM teacher AS A JOIN teacher AS B ON A.dep_id=B.id;


-- SQL SUB QUERRIES




