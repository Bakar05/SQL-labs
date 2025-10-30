
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_title VARCHAR(50),
    salary INT,
    department_id INT
);

INSERT INTO employees (emp_id, first_name, last_name, job_title, salary, department_id) VALUES
(101, 'Ali', 'Khan', 'Developer', 70000, 2),
(102, 'Sara', 'Raza', 'Designer', 55000, 3),
(103, 'Hassan', 'Mian', 'Developer', 65000, 2),
(104, 'Mina', 'Siddiqui', 'HR Assistant', 45000, 1),
(105, 'Mubashir', 'Nazeem', 'Developer', 80000, 2),
(106, 'Maryam', 'Zahid', 'Accountant', 60000, 4),
(107, 'Arsalan', 'Ali', 'Support Officer', 40000, 3);

SELECT * FROM EMPLOYEES;

SELECT first_name, last_name, salary FROM employees;

SELECT * FROM employees 
WHERE job_title = "DEVELOPER";

SELECT * FROM employees 
WHERE salary > 60000;

SELECT * FROM employees
WHERE first_name LIKE "M%";

SELECT * FROM employees 
WHERE department_id = 2;

SELECT * FROM employees 
ORDER BY salary DESC;

UPDATE employees 
SET salary = salary + 5000 
WHERE emp_id = "104";

SELECT salary FROM employees 
WHERE emp_id = 104;

DELETE FROM employees 
WHERE emp_id = 107;

SELECT * FROM employees;

INSERT INTO employees(emp_id, first_name, last_name, job_title, salary, department_id) 
VALUES (108, 'ZARA', 'IQBAL', 'INTERN', 30000, 1);

UPDATE employees 
SET department_id = 4 
WHERE first_name = 'HASSAN';

SELECT * FROM employees;

DELETE FROM employees 
WHERE salary < 45000;

ALTER TABLE employees 
RENAME COLUMN job_title TO DESIGNATION;

ALTER TABLE employees 
ADD HIRE_DATE DATE;
