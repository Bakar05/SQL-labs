CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    employee_email VARCHAR(30) UNIQUE,
    name VARCHAR(50),
    age INT
);

CREATE TABLE department(
    department_id INT PRIMARY KEY,
    employee_id INT NOT NULL,
    department_email VARCHAR(30) UNIQUE,
    department_name VARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

INSERT INTO employee (employee_id, employee_email, name, age) VALUES
  (1, 'jahanzaib@gmail.com', 'Jahanzaib', 30),
  (2, 'ammar@gmail.com', 'ammar', 28),
  (3, 'bakar@gmail.com', 'bakar', 35);

INSERT INTO department (department_id, employee_id, department_email, department_name) VALUES
  (101, 1, 'hr@gmail.com', 'HR'),
  (102, 2, 'finance@gmail.com', 'Finance'),
  (103, 3, 'it@gmail.com', 'IT');

select * from department;
select * from employee;
SELECT 
    employee.name AS employee_name,
    department.department_name
FROM
    employee, department
where
    employee.employee_id = department.employee_id;
