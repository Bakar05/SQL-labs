CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    emp_id INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO departments VALUES
(1, 'Finance'),
(2, 'Human Resources'),
(3, 'IT Support'),
(4, 'Marketing');

INSERT INTO employees VALUES
(101, 'Adeel', 55000, 1),
(102, 'Sana', 72000, 3),
(103, 'Bilal', 48000, 2),
(104, 'Mehwish', 83000, NULL),   -- No department
(105, 'Haris', 60000, 4);

INSERT INTO projects VALUES
(201, 'Project Alpha', 101),
(202, 'Project Beta', 103),
(203, 'Website Revamp', 102),
(204, 'Social Media Ads', NULL);  -- No employee assigned

-- Get employees and their departments where the department name contains 'Human'
SELECT E.emp_name, D.dept_name 
FROM Employees E
RIGHT JOIN Departments D 
	ON E.dept_id = D.dept_id
WHERE D.dept_name LIKE '%Human%';

-- Get departments and employees whose names start with 'A'
SELECT D.dept_name, E.emp_name
FROM Departments D
RIGHT JOIN Employees E 
	ON D.dept_id = E.dept_id
WHERE E.emp_name LIKE 'A%';

-- Get departments and employees earning less than 60000
SELECT D.dept_name, E.emp_name
FROM Departments D
RIGHT JOIN Employees E 
	ON D.dept_id = E.dept_id
WHERE E.salary < 60000;

-- Get all employees and their departments, ordered by department name
SELECT E.emp_name, D.dept_name
FROM Employees E
RIGHT JOIN Departments D 
	ON E.dept_id = D.dept_id
ORDER BY D.dept_name ASC;

-- Count how many employees are in each department
SELECT D.dept_name, COUNT(E.emp_name) AS total_EMPLOYEES
FROM Departments D 
RIGHT JOIN Employees E 
	ON D.dept_id = E.dept_id
GROUP BY D.dept_name;

-- Get project names and employees for projects containing 'Project'
SELECT P.project_name, E.emp_name
FROM Projects P 
RIGHT JOIN Employees E
	ON P.emp_id = E.emp_id 
WHERE P.project_name LIKE '%Project%';

-- Get project names and employees who work in the 'IT Support' department
SELECT P.project_name, E.emp_name
FROM Projects P 
RIGHT JOIN Employees E 
	ON P.emp_id = E.emp_id 
RIGHT JOIN Departments D 
	ON E.dept_id = D.dept_id
WHERE D.dept_name = 'IT Support';

-- Count how many employees are assigned to each project
SELECT P.project_name, COUNT(E.emp_name) AS total_EMPLOYEES
FROM Projects P 
RIGHT JOIN Employees E 
	ON P.emp_id = E.emp_id 
GROUP BY P.project_name;

-- Get projects, employees, and their departments
SELECT P.project_name, E.emp_name, D.dept_name
FROM Projects P 
RIGHT JOIN Employees E 
	ON P.emp_id = E.emp_id 
RIGHT JOIN Departments D 
	ON E.dept_id = D.dept_id;

-- Get project names and employees assigned to them
SELECT P.project_name, E.emp_name
FROM Projects P 
RIGHT JOIN Employees E 
	ON P.emp_id = E.emp_id;
