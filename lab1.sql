CREATE database if not exists Practice;
DROP database if exists Practice;

USE practice;

CREATE TABLE student(
	student_id INT ,
    name VARCHAR (50),
    age INT ,
    department VARCHAR (50)
);

INSERT INTO student VALUES (1,"ali",34,"cs","A","student@gamil.com");
INSERT INTO student VALUES (2,"jahnzaib",21,"cs", "A","student@gamil.com");

INSERT INTO student (student_id, name, age, department, grade, email) VALUES
(3,"ammar",20,"cs", "A","student@gamil.com"),
(4,"bakar",20,"cs", "A","student@gamil.com"),
(5,"ammar",21,"cs", "A","student@gamil.com");

SELECT name, age FROM student;

CREATE TABLE teacher (
	teacher_id INT,
    name VARCHAR (50),
    qualification VARCHAR(50),
	courses VARCHAR(20)
);

INSERT INTO teacher (teacher_id, name, qualification, courses) VALUES
(1, "jawad", "MS computer science", "DB"),
(2, "imran", "BS computer science", "DAA"),
(3, "ahmad", "BS computer science", "Compiler");

ALTER TABLE student 
	ADD grade char,
	ADD email  varchar(50); 

ALTER TABLE student 
	MODIFY age SMALLINT;

drop table student;

INSERT INTO student VALUES (1,"ali",34,"cs","A","student@gamil.com");
INSERT INTO student VALUES (2,"jahnzaib",21,"cs", "A","student@gamil.com");

INSERT INTO student (student_id, name, age, department, grade, email) VALUES
(1,"ali",34,"cs","A","student@gamil.com"),
(2,"jahnzaib",21,"cs", "A","student@gamil.com"),
(3,"ammar",20,"cs", "A","student@gamil.com"),
(4,"bakar",20,"cs", "A","student@gamil.com"),
(5,"ammar",21,"cs", "A","student@gamil.com");
    
ALTER TABLE student 
CHANGE name student_name VARCHAR(50);

ALTER TABLE student 
RENAME to students;
