-- 1.	Create the UniversityDB database. 
CREATE DATABASE lab_4;
USE lab_4;

--  2.	Create  tables Students  with proper constraints.
CREATE TABLE student (
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 17),
    gender VARCHAR(10),
	department VARCHAR(50),
	gpa DECIMAL(3,2) DEFAULT 0.0
);

--  2.	Create  tables course  with proper constraints.
CREATE TABLE course (
	course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
	credit_hours INT  DEFAULT -3,
	instructor VARCHAR(50),
    department VARCHAR(50),
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES student (student_id)
);

INSERT INTO student(student_id, name, age, gender, department, gpa) VALUES 
(1, 'Ali', 19, 'Male', 'Computer Science', 3.45),
(2, 'Sara', 21, 'Female', 'Software Engineering', 3.80),
(3, 'Ahmed', 20, 'Male', 'Business', 2.95),
(4, 'Ayesha', 22, 'Female', 'Computer Science', 3.60),
(5, 'Bilal', 23, 'Male', 'Electrical Engineering', 2.75),
(6, 'Fatima', 20, 'Female', 'Software Engineering', 3.10),
(7, 'Hassan', 19, 'Male', 'Computer Science', 3.00),
(8, 'Zainab', 21, 'Female', 'Business', 3.25);


INSERT INTO course(course_id, course_name, credit_hours, instructor, department, student_id) VALUES
(101, 'Database System', 3, 'Dr. Khalid', 'computer science', 1),
(102, 'Data Structure', 4, 'Dr. adeel', 'Software Engineering', 2),
(103, 'Marketing Principles', 3, 'Dr. Nida', 'Business', 3),
(104, 'Digital Logic Design', 3, 'Dr. Usman', 'Electrical Engineering', 5),
(105, 'Operating Systems', 4, 'Dr. Adeel', 'Computer Science', 4),
(106, 'Software Project Management', 3, 'Dr. Nida', 'Software Engineering', 6);

-- 3. Add a new column email (VARCHAR(100)) to the Students table.
ALTER TABLE student ADD EMAIL VARCHAR(100);

-- 4. Modify the gpa column to allow only values between 0.0 and 4.0 using a constraint.
ALTER TABLE student 
ADD CONSTRAINT gpa CHECK (gpa BETWEEN 0.0 AND 4.0);

-- 5.Change the column name instructor in the Courses table to teacher_name.
ALTER TABLE course 
RENAME COLUMN instructor TO teacher_name;

-- 6. Drop the email column from the Students table.
ALTER TABLE student 
DROP COLUMN EMAIL;

-- 7. Rename the table Courses to Subjects.
ALTER TABLE course 
RENAME TO Subjects;

-- 8. Delete the entire Subjects table from the database.
DROP TABLE Subjects;

-- 9. Insert two more students into the Students table.
INSERT INTO student (student_id, name, age, gender, department, gpa) VALUES
(9, 'Ammar', 20, 'Male', 'Computer Science', 2.7),
(10, 'Sana', 19, 'Female', 'Software Engineering', 3.0);

-- 10. Update Ali’s GPA to 3.9.
UPDATE student
SET gpa = 3.9
WHERE name = 'Ali';

-- 11. Change the department of all Software Engineering students to Computer Science
UPDATE student
SET department = 'Computer Science'
WHERE department = 'Software Engineering';

-- 12. Delete all students whose GPA is less than 3.0
DELETE FROM student
WHERE gpa < 3.0;

-- 13. Increase credit hours of all Computer Science courses by 1
UPDATE course
SET credit_hours = credit_hours + 1
WHERE department = 'Computer Science';

-- 14. Delete the course named 'Digital Logic Design'
DELETE FROM course
WHERE course_name = 'Digital Logic Design';

-- 15. Update all students older than 21 to have an additional 0.2 added to their GPA (without exceeding 4.0)
UPDATE student
SET gpa = LEAST(gpa + 0.2, 4.0)
WHERE age > 21 AND gpa < 4.0;

-- 16. Insert a new course named 'Machine Learning' (5 credit hours, taught by Dr. Khalid, for Computer Science department)
INSERT INTO course (course_id, course_name, credit_hours, teacher_name, department, student_id)
VALUES (107, 'Machine Learning', 5, 'Dr. Khalid', 'Computer Science', NULL);

-- 17. Display all records from the Students table
SELECT * FROM student;

-- 18. Show only the name, department, and GPA of all students
SELECT name, department, gpa FROM student;

-- 19. List all Computer Science students with GPA above 3.0
SELECT * FROM student
WHERE department = 'Computer Science' AND gpa > 3.0;

-- 20. Display all students whose names start with ‘A’
SELECT * FROM student
WHERE name LIKE 'A%';

-- 21. Show the oldest student
SELECT * FROM student
ORDER BY age DESC
LIMIT 1;

-- 22. Display the average GPA of all students
SELECT AVG(gpa) AS average_GPA FROM student;

-- 23. Show the number of students in each department
SELECT department, COUNT(*) AS Total_student
FROM student
GROUP BY department;

-- 24. Display students ordered by GPA in descending order
SELECT * FROM student
ORDER BY gpa DESC;

-- 25. Display all courses that have more than 3 credit hours
SELECT * FROM course
WHERE credit_hours > 3;

-- 26. Display all unique department names from the Students table
SELECT DISTINCT department FROM student;

-- 27. Display all female students sorted alphabetically
SELECT * FROM student
WHERE gender = 'Female'
ORDER BY name ASC;

-- 28. Display students between the ages of 19 and 22
SELECT * FROM student
WHERE age BETWEEN 19 AND 22;

-- 29. Count how many students are male and how many are female
SELECT gender, COUNT(*) AS count
FROM student
GROUP BY gender;

-- 30. Display the student(s) having the highest GPA
SELECT * FROM student
WHERE gpa = (SELECT MAX(gpa) FROM student);

-- 31. Display all courses taught by Dr. Adeel
SELECT * FROM course
WHERE teacher_name = 'Dr. Adeel';

-- 32. Display all courses belonging to the Computer Science department
SELECT * FROM course
WHERE department = 'Computer Science';

-- 33. Display all students whose department exists in the Courses table (use IN)
SELECT * FROM student
WHERE department IN (SELECT department FROM course);

-- 34. Display the total number of students enrolled
SELECT COUNT(*) AS total_students FROM student;

-- 35. Display the minimum and maximum GPA from the Students table
SELECT MIN(gpa) AS min_gpa, MAX(gpa) AS max_gpa FROM student;


