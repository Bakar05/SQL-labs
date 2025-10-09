CREATE TABLE student (
    student_id INT PRIMARY KEY,
	student_email VARCHAR(30) UNIQUE,  
    name VARCHAR(50),
    age INT
);

CREATE TABLE teacher (
    teacher_id INT PRIMARY KEY,
	student_id INT NOT NULL,
    teacher_email VARCHAR(30) UNIQUE, 
    name VARCHAR(50),
    courses VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

CREATE TABLE CS_admin (
    admin_id INT PRIMARY KEY,
    teacher_id INT NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    UNIQUE (teacher_id, student_id)  
);

INSERT INTO student (student_id, student_email, name, age) VALUES
(1, '70149125@example.com', 'Khan', 20),
(2, '70149126@example.com', 'Ahmed', 22),
(3, '70149127@example.com', 'Raza', 21);

INSERT INTO teacher (teacher_id, student_id, teacher_email, name, courses) VALUES
(101, 1, 'Jawad@example.com', 'Mr. Jawad', 'Math'),
(102, 2, 'khawaja@example.com', 'khawaja', 'Physics'),
(103, 3, 'Ali@example.com', 'Dr. Ali', 'CS');

INSERT INTO CS_admin (admin_id, teacher_id, student_id) VALUES
(201, 101, 1),
(202, 102, 2),
(203, 103, 3);


SELECT 
    student.name AS Student_name,
    teacher.name AS teacher_name
FROM 
    student, teacher
WHERE 
    student.student_id = teacher.student_id;

SELECT 
    student.name AS student_name,
    teacher.name AS teacher_name
FROM 
	CS_admin
JOIN 
    student ON CS_admin.student_id = student.student_id
JOIN 
    teacher ON CS_admin.teacher_id = teacher.teacher_id;

