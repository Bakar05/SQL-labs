CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(10) NOT NULL,
    job_title VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2),
    hire_date DATE,
	gender VARCHAR(30),
    city VARCHAR(30)
);

INSERT INTO Employee (emp_id, first_name, last_name, department, job_title, salary, hire_date, gender, city) VALUES
    (1, 'Ali', 'Khan', 'HR', 'HR manager', 85000.00, '2019-04-15', 'Male', 'Lahore'),
    (2, 'Sara', 'Malik', 'IT', 'Software Engineer', 95000.00, '2020-01-12', 'Female', 'Karachi'),
    (3, 'Ahmed', 'Raza', 'Finance', 'Accountant', 70000.00, '2018-08-20', 'Male', 'Lahore'),
    (4, 'Hina', 'Sheikh', 'IT', 'Data analyst', 88000.00, '2021-06-10', 'Female', 'Islamabad'),
    (5, 'Usman', 'Ali', 'Sales', 'Sales Executive', 60000.00, '2017-11-03', 'Male', 'Karachi'),
    (6, 'Fatima', 'Noor', 'Finance', 'Finance Manager', 120000.00, '2016-03-13', 'Female', 'Lahore'),
    (7, 'Zain', 'Iqbal', 'IT', 'Web Developer', 78000.00, '2022-01-25', 'Male',  'Karachi'),
    (8, 'Nida', 'Hassan', 'Sales', 'Sales manager', 95000.00, '2019-09-14', 'Female', 'Islamabad'),
    (9, 'Omar', 'Saeed', 'HR', 'Recruiter', 55000.00, '2020-10-05', 'Male', 'Lahore'),
    (10, 'Ayesha', 'Khalid', 'IT', 'Network Engneer', 87000.00, '2018-05-22', 'Female',  'Karachi');
    
SELECT department, COUNT(emp_id) as total_employee
FROM Employee
GROUP BY department;
    
SELECT department, SUM(salary) as total_salary
FROM Employee
GROUP BY department;

SELECT department, AVG(salary) as average_salary
FROM Employee
GROUP BY department;

SELECT department, MAX(salary) as highest_salary
FROM Employee
GROUP BY department;

SELECT department, MIN(salary) as lowest_salary
FROM Employee
GROUP BY department;

SELECT job_title, COUNT(emp_id) as total_employee
FROM Employee
GROUP BY job_title;

SELECT gender, COUNT(emp_id) as total_employee
FROM Employee
GROUP BY gender;

SELECT job_title, AVG(salary) as average_salary
FROM Employee
GROUP BY job_title;

SELECT city, COUNT(emp_id) as total_employee
FROM Employee
GROUP BY city;
    
