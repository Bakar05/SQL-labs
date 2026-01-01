/* Create Department table */
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

/* Create Student table */
CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cgpa DECIMAL(3,2) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

/* Insert data into Department table */
INSERT INTO department (dept_id, dept_name) VALUES
    (1, 'Computer Science'),
    (2, 'Electrical Engineering'),
    (3, 'Mechanical Engineering');

/* Insert data into Student table */
INSERT INTO student (id, name, cgpa, dept_id) VALUES
    (101, 'Ali Khan', 3.75, 1),
    (102, 'Sara Ahmed', 3.40, 2),
    (103, 'Bilal Hussain', 3.10, 3),
    (104, 'Fatima Noor', 3.90, 1),
    (105, 'Usman Tariq', 2.95, 3),
    (106, 'Ayesha Malik', 3.60, 2),
    (107, 'Hamza Iqbal', 3.25, 3),
    (108, 'Zara Sheikh', 3.85, 1),
    (109, 'Imran Javed', 2.80, 3),
    (110, 'Nida Farooq', 3.50, 2);

/* 1. Students whose CGPA is below the overall average */
SELECT name, cgpa
FROM student
WHERE cgpa < (
    SELECT AVG(cgpa)
    FROM student
);

/* 2. Student(s) with the minimum CGPA */
SELECT name, cgpa
FROM student
WHERE cgpa = (
    SELECT MIN(cgpa)
    FROM student
);

/* 3. Departments having more than one student */
SELECT dept_name
FROM department
WHERE dept_id IN (
    SELECT dept_id
    FROM student
    GROUP BY dept_id
    HAVING COUNT(id) > 1
);

/* 4. Student(s) with the maximum CGPA */
SELECT name, cgpa
FROM student
WHERE cgpa = (
    SELECT MAX(cgpa)
    FROM student
);

/* 5. Departments with at least one student having CGPA greater than 3.2 */
SELECT dept_name
FROM department
WHERE dept_id IN (
    SELECT dept_id
    FROM student
    WHERE cgpa > 3.2
);

/* 6. Display student details along with department name and department average CGPA */
SELECT 
    s.id,
    s.name,
    (
        SELECT d.dept_name
        FROM department d
        WHERE d.dept_id = s.dept_id
    ) AS dept_name,
    (
        SELECT AVG(s2.cgpa)
        FROM student s2
        WHERE s2.dept_id = s.dept_id
    ) AS dept_avg_cgpa
FROM student s
ORDER BY s.dept_id;

/* 7. One student with CGPA less than the maximum CGPA */
SELECT name, cgpa
FROM student
WHERE cgpa < (
    SELECT MAX(cgpa)
    FROM student
)
LIMIT 1;

/* 8. Maximum CGPA in each department */
SELECT 
    d.dept_id,
    d.dept_name,
    (
        SELECT MAX(s1.cgpa)
        FROM student s1
        WHERE s1.dept_id = d.dept_id
    ) AS max_cgpa
FROM department d
ORDER BY d.dept_id;

/* 9. Departments whose average CGPA is greater than the overall average CGPA */
SELECT 
    d.dept_id,
    d.dept_name
FROM department d
WHERE (
        SELECT AVG(s.cgpa)
        FROM student s
        WHERE s.dept_id = d.dept_id
      ) > (
        SELECT AVG(cgpa)
        FROM student
      )
ORDER BY d.dept_id;

/* 10. Departments having more than one student (using JOIN) */
SELECT d.dept_name
FROM department d
JOIN student s
    ON d.dept_id = s.dept_id
GROUP BY d.dept_id, d.dept_name
HAVING COUNT(s.id) > 1;

/*  11. Departments with students having CGPA > 3.2 (using JOIN) */
SELECT DISTINCT d.dept_name
FROM department d
JOIN student s
    ON d.dept_id = s.dept_id
WHERE s.cgpa > 3.2;
