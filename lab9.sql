CREATE TABLE Department (
    DepartmentID   INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
INSERT INTO Department (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Operations');  -- Department with no employees initially
CREATE TABLE Employeess (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary INT,
    DepartmentID INT,
    ManagerID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
INSERT INTO Employeess (EmpID, EmpName, Salary, DepartmentID, ManagerID) VALUES
(101, 'Ali',   50000, 2, 105),
(102, 'Sana',  60000, 1, 106),
(103, 'Ahmed', 70000, 4, NULL),
(104, 'Maria', 65000, 2, 105),
(105, 'Fahad', 80000, 2, NULL),
(106, 'Zara',  75000, 1, NULL),
(107, 'Bilal', 45000, 3, 106),
(108, 'Hina',  55000, 5, 105),
(109, 'Asim',  40000, NULL, NULL),  -- unassigned department
(110, 'Nida',  72000, 4, 103);

SELECT E.EmpName, D.DepartmentName 
FROM Employeess E
INNER JOIN Department D 
	ON E.DepartmentID = D.DepartmentID;

SELECT E.EmpName, Salary, D.DepartmentName 
FROM Employeess E
INNER JOIN Department D 
	ON E.DepartmentID = D.DepartmentID
WHERE E.Salary > 60000;

SELECT E.EmpName, E.Salary, D.DepartmentName 
FROM Employeess E
INNER JOIN Department D 
	ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentID <3;


SELECT E.EmpName, D.DepartmentName, M.EmpName AS ManagerName
FROM Employeess E
INNER JOIN 
	Department D ON E.DepartmentID = D.DepartmentID
INNER JOIN 
	Employeess M ON E.ManagerID = M.EmpID;
    
SELECT E.EmpName AS EmployeeName, D.DepartmentName, E.Salary 
FROM Employeess E
INNER JOIN Department D 
ON E.DepartmentID = D.DepartmentID
ORDER BY E.Salary DESC;

SELECT E.EmpName, D.DepartmentName 
FROM Employeess E
INNER JOIN Department D 
	ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = "IT";


SELECT E.EmpName, E.Salary, D.DepartmentName 
FROM Employeess E
INNER JOIN Department D 
	ON E.DepartmentID = D.DepartmentID
WHERE E.Salary > 50000 AND E.Salary  < 70000;

SELECT D.DepartmentName, COUNT(E.DepartmentID) AS Total_employees
FROM Employeess E
INNER JOIN Department D 
	ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName;

SELECT E.EmpName, D.DepartmentName, AVG(E.Salary) AS average_salary
FROM Employeess E
INNER JOIN Department D 
	ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName, E.EmpName;

SELECT E.EmpName, D.DepartmentName 
FROM Employeess E
INNER JOIN Department D 
	ON E.DepartmentID = D.DepartmentID
WHERE E.EmpName LIKE "A%";
