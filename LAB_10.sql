CREATE TABLE STUDENT (
   StudentID INT PRIMARY KEY,
   StudentName VARCHAR(50),
   DeptID INT,
   Marks INT,
   MentorID INT
);

INSERT INTO STUDENT VALUES
  (1, 'Ali', 10, 85, NULL),
  (2, 'Sara', 20, 72, 1),
  (3, 'Hamza', 10, 90, 1),
  (4, 'Ayesha', 30, 60, 2),
  (5, 'Usman', NULL, 45, 2);

CREATE TABLE DEPARTMENT (
   DeptID INT PRIMARY KEY,
   DeptName VARCHAR(50)
);
INSERT INTO DEPARTMENT VALUES
  (10, 'Computer Science'),
  (20, 'Information Technology'),
  (40, 'Business');

CREATE TABLE COURSE (
   CourseID VARCHAR(5) PRIMARY KEY,
   CourseName VARCHAR(50)
);

INSERT INTO COURSE VALUES
  ('C1', 'Database Systems'),
  ('C2', 'Operating Systems'),
  ('C3', 'Artificial Intelligence');

CREATE TABLE GRADE (
   Grade CHAR(1),
   MinMarks INT,
   MaxMarks INT
);

INSERT INTO GRADE VALUES
  ('A', 80, 100),
  ('B', 65, 79),
  ('C', 50, 64),
  ('F', 0, 49);

SELECT S.StudentName, C.CourseName
FROM STUDENT S
CROSS JOIN COURSE C;

SELECT S.StudentName, D.DeptName
FROM STUDENT S
CROSS JOIN DEPARTMENT D;

SELECT S.StudentName, G.Grade, G.MinMarks, G.MaxMarks
FROM STUDENT S
CROSS JOIN GRADE G;

SELECT C.CourseName, D.DeptName
FROM COURSE C
CROSS JOIN DEPARTMENT D;

SELECT S.StudentName, G.Grade
FROM STUDENT S
CROSS JOIN GRADE G;

SELECT S.StudentName, D.DeptName
FROM STUDENT S
LEFT JOIN DEPARTMENT D ON S.DeptID = D.DeptID
  
UNION
  
SELECT S.StudentName, D.DeptName
FROM STUDENT S
RIGHT JOIN DEPARTMENT D ON S.DeptID = D.DeptID ;

SELECT D.DeptName
FROM DEPARTMENT D
LEFT JOIN STUDENT S ON S.DeptID = D.DeptID

UNION
  
SELECT D.DeptName
FROM DEPARTMENT D
RIGHT JOIN STUDENT S
 ON S.DeptID = D.DeptID;

SELECT S.StudentName
FROM STUDENT S
LEFT JOIN DEPARTMENT D ON S.DeptID = D.DeptID

UNION
  
SELECT S.StudentName
FROM STUDENT S
RIGHT JOIN DEPARTMENT D ON S.DeptID = D.DeptID;

SELECT S.StudentName, D.DeptName
FROM STUDENT S
LEFT JOIN DEPARTMENT D
 ON S.DeptID = D.DeptID

UNION
  
SELECT S.StudentName, D.DeptName
FROM DEPARTMENT D
RIGHT JOIN STUDENT S
 ON S.DeptID = D.DeptID;

SELECT S.StudentName, D.DeptName
FROM STUDENT S
LEFT JOIN DEPARTMENT D ON S.DeptID = D.DeptID
  
UNION
  
SELECT S.StudentName, D.DeptName
FROM STUDENT S
RIGHT JOIN DEPARTMENT D ON S.DeptID = D.DeptID ;

SELECT
  S.StudentName AS Diligent_Student,
  M.StudentName AS Inteligent_Mentor
FROM STUDENT S
JOIN STUDENT M ON S.MentorID = M.StudentID;
SELECT 
  M.StudentName AS Mentor
FROM STUDENT S
JOIN STUDENT M ON S.MentorID = M.StudentID;

SELECT
  S.StudentName AS Student,
  M.StudentName AS Mentor,
  M.Marks AS MentorMarks,
  S.Marks AS StudentMarks
FROM STUDENT S
JOIN STUDENT M ON S.MentorID = M.StudentID
WHERE M.Marks > S.Marks;

SELECT DISTINCT S1.StudentName AS Student1, S2.StudentName AS Student2
FROM STUDENT S1
JOIN STUDENT S2
 ON S1.MentorID <>S2.MentorID;

SELECT 
  S.StudentName AS Student,
  M.StudentName AS Mentor,
  S.DeptID AS StudentDept,
  M.DeptID AS MentorDept
FROM STUDENT S
JOIN STUDENT M
 ON S.MentorID = M.StudentID
WHERE S.DeptID != M.DeptID;

SELECT S.StudentName, G.Grade
FROM STUDENT S
JOIN GRADE G
 ON S.Marks BETWEEN G.MinMarks AND G.MaxMarks;

SELECT S.StudentName, G.Grade
FROM STUDENT S
JOIN GRADE G
 ON S.Marks BETWEEN G.MinMarks AND G.MaxMarks
WHERE G.Grade = 'A';

SELECT S.StudentName, S.Marks, G.Grade
FROM STUDENT S
JOIN GRADE G
 ON S.Marks BETWEEN G.MinMarks AND G.MaxMarks
WHERE G.Grade = 'F';

SELECT S.StudentName, S.Marks, G.Grade, G.MinMarks, G.MaxMarks
FROM STUDENT S
JOIN GRADE G
 ON S.Marks BETWEEN G.MinMarks AND G.MaxMarks;
