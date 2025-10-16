CREATE TABLE Employee (
	emp_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
	department VARCHAR(10) NOT NULL,
    job_title VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2),
    hire_date DATE,
    city VARCHAR(30)
);

INSERT INTO Employee (emp_id, first_name, last_name, department, job_title, salary, hire_date, city) VALUES
    (1, 'Ali', 'Khan', 'HR', 'HR manager', 85000.00, '2019-04-15', 'Lahore'),
    (2, 'Sara', 'Malik', 'IT', 'Software Engineer', 95000.00, '2020-01-12', 'Karachi'),
	  (3, 'Ahmed', 'Raza', 'Finance', 'Accountant', 70000.00, '2018-08-20', 'Lahore'),
    (4, 'Hina', 'Sheikh', 'IT', 'Data analyst', 88000.00, '2021-06-10', 'Islamabad'),
	  (5, 'Usman', 'Ali', 'Sales', 'Sales Executive', 60000.00, '2017-11-03', 'Karachi'),
    (6, 'Fatima', 'Noor', 'Finance', 'Finance Manager', 120000.00, '2016-03-13', 'Lahore'),
    (7, 'Zain', 'Iqbal', 'IT', 'Web Developer', 78000.00, '2022-01-25', 'Karachi'),
    (8, 'Nida', 'Hassan', 'Sales', 'Sales manager', 95000.00, '2019-09-14', 'Islamabad'),
    (9, 'Omar', 'Saeed', 'HR', 'Recruiter', 55000.00, '2020-10-05', 'Lahore'),
    (10, 'Ayesha', 'Khalid', 'IT', 'Network Engneer', 87000.00, '2018-05-22', 'Karachi');
    
SELECT first_name, last_name FROM Employee
WHERE department = 'IT';

SELECT first_name, last_name FROM Employee
WHERE hire_date > '2020-01-01';

SELECT first_name, last_name FROM Employee
WHERE salary > 80000.00 and city = 'Lahore'; 

SELECT first_name, last_name FROM Employee
WHERE department != 'Finance';

SELECT first_name, last_name FROM Employee
WHERE city = 'Karachi' OR city = 'Islamabad'; 

SELECT first_name, last_name FROM Employee
WHERE first_name LIKE 'A%';

SELECT first_name, last_name FROM Employee
WHERE salary > 70000.00 and salary  < 90000.00; 

SELECT 
	first_name AS Employee_first_name, 
	last_name AS Employee_last_name, 
	department AS Department_name 
FROM Employee;

SELECT 
	CONCAT(e.first_name, ' ', e.last_name) AS full_name, 
	salary as "monthly salary"
FROM Employee as e;

SELECT 
  first_name, 
  last_name, 
  salary * 12 AS annual_salary
FROM Employee;

SELECT department, COUNT(emp_id) AS Total_employee FROM Employee
GROUP BY department
ORDER BY Total_employee;

SELECT department, AVG(salary) AS average_salary FROM Employee
GROUP BY department
ORDER BY average_salary;

SELECT city, SUM(salary) AS salary FROM Employee
GROUP BY city
ORDER BY salary;

SELECT department, SUM(salary) AS salary
FROM Employee
GROUP BY department
ORDER BY salary;

SELECT first_name, last_name FROM Employee
WHERE first_name LIKE '%an%' or last_name LIKE '%an%';

SELECT city FROM Employee
WHERE city LIKE '%re';

SELECT first_name FROM Employee
WHERE first_name LIKE '_i%' ;

