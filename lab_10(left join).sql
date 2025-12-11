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

-- Retrieve all employees and their department names (if any)
SELECT E.emp_name, D.dept_name 
FROM Employees E
LEFT JOIN departments D 
    ON E.dept_id = D.dept_id;

-- Retrieve employees who earn more than 50,000 and their department names
SELECT E.emp_name, E.salary, D.dept_name 
FROM Employees E
LEFT JOIN departments D 
    ON E.dept_id = D.dept_id
WHERE E.salary > 50000;

-- Retrieve all departments and the employees belonging to them
SELECT D.dept_name, E.emp_name
FROM departments D 
LEFT JOIN Employees E
    ON D.dept_id = E.dept_id;

-- Retrieve employees and the project names they are associated with
SELECT E.emp_name, P.project_name
FROM Employees E
LEFT JOIN projects P 
    ON E.emp_id = P.emp_id;

-- Retrieve projects and the employees assigned to them
SELECT P.project_name, E.emp_name
FROM projects P 
LEFT JOIN Employees E
    ON  P.emp_id = E.emp_id ;

-- Retrieve employees who belong to departments with names containing 'Support'
SELECT E.emp_name, D.dept_name 
FROM Employees E
LEFT JOIN departments D 
    ON E.dept_id = D.dept_id
WHERE D.dept_name LIKE '%Support%';

-- Retrieve employees with salary between 50,000 and 80,000 and their department names
SELECT E.emp_name, E.salary, D.dept_name
FROM Employees E
LEFT JOIN departments D 
    ON E.dept_id = D.dept_id
WHERE E.salary BETWEEN 50000 AND 80000;

-- Count number of employees in each department
SELECT D.dept_name, COUNT(E.emp_name) AS total_EMPLOYEES
FROM departments D 
LEFT JOIN Employees E
    ON D.dept_id = E.dept_id
GROUP BY D.dept_name;

-- Find the highest salary in each department
SELECT D.dept_name, MAX(E.salary) AS max_salary
FROM Employees E
LEFT JOIN departments D 
    ON E.dept_id = D.dept_id
GROUP BY D.dept_name;

-- Retrieve employees whose names start with 'M' and their department names
SELECT E.emp_name, D.dept_name
FROM Employees E
LEFT JOIN departments D 
    ON E.dept_id = D.dept_id
WHERE E.emp_name LIKE 'M%';
