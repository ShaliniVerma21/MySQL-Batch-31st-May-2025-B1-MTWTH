-- Create a new database named 'demojoins'
CREATE DATABASE demojoins;

-- Use the newly created database for subsequent operations
USE demojoins;

/*
ex- Unversity database
1. faculty
2. department'
3. students 
4. marks

result -- student-id, student-name,faculty-name, total-marks, department-name
--> there must be 1 common attribute in each table to join each other.

In MySQL, joins are used to combine rows from two or more tables based on a related 
column between them. Joins allow you to retrieve data from multiple tables in a single 
query, making it easier to work with relational databases.

1. INNER JOIN:
   - Definition: The INNER JOIN keyword selects records that have matching values in both tables.
   - Purpose: To retrieve only the rows where there is a match in both tables, effectively filtering out 
   non-matching rows.
   
   - Example:
     SELECT a.EmployeeID, a.Name, b.DepartmentName
     FROM Employees a
     INNER JOIN Departments b ON a.DepartmentID = b.DepartmentID;

2. LEFT JOIN (or LEFT OUTER JOIN):
   - Definition: The LEFT JOIN keyword returns all records from the left table and the matched records from 
   the right table.
   
   - Purpose: To retrieve all records from the left table regardless of whether there is a match in the right 
   table, allowing for NULL values in the result set for non-matching rows.
   
   - Example:
     SELECT a.EmployeeID, a.Name, b.DepartmentName
     FROM Employees a
     LEFT JOIN Departments b ON a.DepartmentID = b.DepartmentID;

3. RIGHT JOIN (or RIGHT OUTER JOIN):
   - Definition: The RIGHT JOIN keyword returns all records from the right table and the matched records from 
   the left table.
   
   - Purpose: To retrieve all records from the right table regardless of whether there is a match in the left 
   table, allowing for NULL values in the result set for non-matching rows.
   
   - Example:
     SELECT a.EmployeeID, a.Name, b.DepartmentName
     FROM Employees a
     RIGHT JOIN Departments b ON a.DepartmentID = b.DepartmentID;

4. FULL JOIN (or FULL OUTER JOIN):
   - Definition: The FULL JOIN keyword returns all records when there is a match in either left or right table 
   records.
   
   - Purpose: To retrieve all records from both tables, including those that do not have matches in either table. 
   MySQL does not support FULL JOIN directly, but it can be simulated using a combination of LEFT JOIN and 
   RIGHT JOIN with a UNION.
   
   - Example:
     SELECT a.EmployeeID, a.Name, b.DepartmentName
     FROM Employees a
     LEFT JOIN Departments b ON a.DepartmentID = b.DepartmentID
     UNION
     SELECT a.EmployeeID, a.Name, b.DepartmentName
     FROM Employees a
     RIGHT JOIN Departments b ON a.DepartmentID = b.DepartmentID;

5. LEFT EXCLUSIVE JOIN:
   - Definition: This is not a standard SQL join type, but it can be simulated by using a LEFT JOIN and 
   filtering out the matched records from the right table.
   
   - Purpose: To retrieve records from the left table that do not have corresponding records in the right table.
   
   - Example:
     SELECT a.EmployeeID, a.Name
     FROM Employees a
     LEFT JOIN Departments b ON a.DepartmentID = b.DepartmentID
     WHERE b.DepartmentID IS NULL;

6. RIGHT EXCLUSIVE JOIN:
   - Definition: Similar to the left exclusive join, this is not a standard SQL join type but can be simulated 
   using a RIGHT JOIN and filtering out the matched records from the left table.
   
   - Purpose: To retrieve records from the right table that do not have corresponding records in the left table.
   
   - Example:
     SELECT b.DepartmentID, b.DepartmentName
     FROM Employees a
     RIGHT JOIN Departments b ON a.DepartmentID = b.DepartmentID
     WHERE a.EmployeeID IS NULL;

7. CROSS JOIN:
   - Definition: The CROSS JOIN keyword returns the Cartesian product of both tables, meaning it combines 
   every row of the first table with every row of the second table.
   
   - Purpose: To generate a combination of all records from both tables, which can be useful in certain 
   scenarios but may result in a large number of rows in the result set.
   
   - Example:
     SELECT a.EmployeeID, b.DepartmentName
     FROM Employees a
     CROSS JOIN Departments b;

8. SELF JOIN:
   - Definition: A SELF JOIN is a regular join but the table is joined with itself.
   
   - Purpose: To compare rows within the same table, such as finding hierarchical relationships or related 
   data within the same dataset.
   - Example:
     SELECT a.EmployeeID, a.Name, b.Name AS ManagerName
     FROM Employees a
     INNER JOIN Employees b ON a.ManagerID = b.EmployeeID;

In summary, joins are a powerful feature in SQL that allow you to combine data from multiple tables based on 
relationships between them. Understanding how to use different types of joins effectively is crucial for 
querying relational databases.
*/

-- Create a table named 'student' with an ID and name
CREATE TABLE student (
    id INT PRIMARY KEY,          -- 'id' is the primary key and must be unique
    student_name VARCHAR(50)    -- 'student_name' can hold up to 50 characters
);

-- Insert records into the 'student' table
INSERT INTO student VALUES 
(101, 'Kirti'),                -- ID 101 for student Kirti
(102, 'Ravi'),                 -- ID 102 for student Ravi
(103, 'Lavish'),               -- ID 103 for student Lavish
(104, 'Trisha');               -- ID 104 for student Trisha

-- Retrieve all records from the 'student' table
SELECT * FROM student;

-- Create a table named 'course' with an ID and course name
CREATE TABLE course (
    id INT PRIMARY KEY,          -- 'id' is the primary key and must be unique
    course_name VARCHAR(80)      -- 'course_name' can hold up to 80 characters
);

-- Insert records into the 'course' table
INSERT INTO course VALUES
(107, 'English'),              -- ID 107 for course English
(102, 'Python'),               -- ID 102 for course Python
(104, 'Hindi'),                -- ID 104 for course Hindi
(108, 'Maths');                -- ID 108 for course Maths

-- Retrieve all records from the 'course' table
SELECT * FROM course;


-- Inner Join (also known as Simple Join / Equi Join): 
-- retrieves records that have matching values in both tables involved in the join.
-- Retrieve records with matching IDs from both tables
SELECT student.id, student_name, course_name 
FROM student 
INNER JOIN course ON student.id = course.id;

select * from student;

-- Left Join (also known as Left Outer Join): 
-- retrieves all records from the left table and the matched records from the right table.
-- Retrieve all records from 'student' and matching records from 'course'
SELECT student.id, student_name, course_name 
FROM student 
LEFT JOIN course ON student.id = course.id;

-- Right Join (also known as Right Outer Join): 
-- retrieves all records from the right table and the matched records from the left table.
-- Retrieve all records from 'course' and matching records from 'student'
SELECT course.id, student_name, course_name 
FROM student 
RIGHT JOIN course ON student.id = course.id;

-- Full Join (also known as Full Outer Join): 
-- It retrieves all records from both tables, matching rows where possible, and filling in NULL values where 
-- there are no matches.
-- Retrieve all records from both tables, with NULLs where there are no matches
SELECT student.id, student_name, course_name 
FROM student 
LEFT JOIN course ON student.id = course.id
UNION
SELECT student.id, student_name, course_name 
FROM student 
RIGHT JOIN course ON student.id = course.id;


SELECT student.id, student_name, course_name 
FROM student 
LEFT JOIN course ON student.id = course.id
UNION
SELECT course.id, student_name, course_name 
FROM student 
RIGHT JOIN course ON student.id = course.id;

-- Left Exclusive Join (also known as Left Anti Join):
-- retrieves rows from the left table that do not have matching rows in the right table.  
-- Retrieve records from 'student' that do not have matches in 'course'
SELECT student.id, student_name, course_name 
FROM student 
LEFT JOIN course ON student.id = course.id
WHERE course.id IS NULL;

-- Right Exclusive Join (also known as Right Anti Join): 
-- retrieves rows from the right table that do not have matching rows in the left table. 
-- Retrieve records from 'course' that do not have matches in 'student'
SELECT course.id, student_name, course_name 
FROM student 
RIGHT JOIN course ON student.id = course.id
WHERE student.id IS NULL;

-- Self Join: (Inner Self Join/Outer Self Join/Self-Reference Join/Self-Relating Join/Table Self Join)
-- Self Join is a special case of a join that allows a table to be joined with itself. 
-- Join the 'student' table with itself based on matching IDs
SELECT student.id, student_name, course_name 
FROM student, course 
WHERE student.id = course.id;

-- Cross Join:(also known as a Cartesian Join or Cartesian Product Join) 
-- A Cross Join retrieves the Cartesian product of two tables, meaning every row from the first table is 
-- combined with every row from the second table.
-- Retrieve the Cartesian product of 'student' and 'course' tables
SELECT student.id, student_name, course_name 
FROM student 
CROSS JOIN course;

-- Table-1
-- Create the faculty table to store information about faculty members
CREATE TABLE faculty (
  faculty_id INT PRIMARY KEY, -- Unique identifier for each faculty
  faculty_name VARCHAR(255), -- Name of the faculty
  faculty_description TEXT, -- Description of the faculty
  dean VARCHAR(255), -- Dean of the faculty
  faculty_location VARCHAR(255), -- Location of the faculty
  faculty_contact_info VARCHAR(255) -- Contact information for the faculty
);

-- Insert sample data into the faculty table
INSERT INTO faculty (faculty_id, faculty_name, faculty_description, dean, faculty_location, 
faculty_contact_info) VALUES
(1, 'Faculty of Science', 'Covers various scientific disciplines', 'Dr. Alice Smith', 'Building A', 
'alice.smith@example.com'),
(2, 'Faculty of Engineering', 'Focuses on engineering and technology', 'Dr. Bob Johnson', 'Building B', 
'bob.johnson@example.com'),
(3, 'Faculty of Arts', 'Includes humanities and social sciences', 'Dr. Carol Williams', 'Building C', 
'carol.williams@example.com'),
(4, 'Faculty of Business', 'Offers business and management courses', 'Dr. David Brown', 'Building D',
'david.brown@example.com'),
(5, 'Faculty of Education', 'Dedicated to teacher training and education studies', 'Dr. Eva Davis', 
'Building E', 'eva.davis@example.com');


-- Table-2
-- Create the department table to store information about departments within faculties
CREATE TABLE department (
  department_id INT PRIMARY KEY, -- Unique identifier for each department
  department_name VARCHAR(255), -- Name of the department
  department_description TEXT, -- Description of the department
  faculty_id INT, -- Foreign key referencing the faculty
  department_head VARCHAR(255), -- Head of the department
  department_location VARCHAR(255), -- Location of the department
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);

-- Insert sample data into the department table
INSERT INTO department (department_id, department_name, department_description, faculty_id, department_head, 
department_location) VALUES
(1, 'Department of Physics', 'Study of matter and energy', 1, 'Dr. Emily White', 'Room 101'),
(2, 'Department of Computer Science', 'Focus on computing and programming', 1, 'Dr. Frank Green', 'Room 102'),
(3, 'Department of Civil Engineering', 'Deals with infrastructure and construction', 2, 'Dr. Grace Black', 
'Room 201'),
(4, 'Department of Mechanical Engineering', 'Focus on machinery and mechanics', 2, 'Dr. Henry Blue', 'Room 202'),
(5, 'Department of History', 'Study of past events and societies', 3, 'Dr. Irene Red', 'Room 301');


-- Table-3
-- Create the students table to store information about students
CREATE TABLE students (
  student_id INT PRIMARY KEY, -- Unique identifier for each student
  student_name VARCHAR(255), -- Name of the student
  student_email VARCHAR(255), -- Email of the student
  department_id INT, -- Foreign key referencing the department
  enrollment_year INT, -- Year of enrollment
  faculty_id INT, -- Foreign key referencing the faculty
  FOREIGN KEY (department_id) REFERENCES department(department_id), -- Establishing relationship with department
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);

-- Insert sample data into the students table
INSERT INTO students (student_id, student_name, student_email, department_id, enrollment_year, faculty_id) VALUES
(1, 'John Doe', 'john.doe@example.com', 1, 2021, 1),
(2, 'Jane Smith', 'jane.smith@example.com', 2, 2020, 1),
(3, 'Alice Johnson', 'alice.johnson@example.com', 1, 2022, 1),
(4, 'Bob Brown', 'bob.brown@example.com', 3, 2021, 2),
(5, 'Charlie Davis', 'charlie.davis@example.com', 4, 2023, 2);


-- Table-4
-- Create the salary table to store salary information for faculty members
CREATE TABLE salary (
  salary_id INT PRIMARY KEY, -- Unique identifier for each salary record
  faculty_id INT, -- Foreign key referencing the faculty
  amount DECIMAL(10, 2), -- Salary amount
  payment_date DATE, -- Date of salary payment
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);

-- Insert sample data into the salary table
INSERT INTO salary (salary_id, faculty_id, amount, payment_date) VALUES
(1, 1, 75000.00, '2023-01-15'),
(2, 2, 80000.00, '2023-01-15'),
(3, 3, 70000.00, '2023-01-15'),
(4, 4, 72000.00, '2023-01-15'),
(5, 5, 68000.00, '2023-01-15');

-- Table-5
-- Create the marks table to store marks obtained by students
CREATE TABLE marks (
  marks_id INT PRIMARY KEY, -- Unique identifier for each marks record
  student_id INT, -- Foreign key referencing the student
  subject_name VARCHAR(255), -- Name of the subject
  marks_obtained INT, -- Marks obtained by the student
  semester INT, -- Semester in which the marks were obtained
  FOREIGN KEY (student_id) REFERENCES students(student_id) -- Establishing relationship with students
);

-- Insert sample data into the marks table
INSERT INTO marks (marks_id, student_id, subject_name, marks_obtained, semester) VALUES
(1, 1, 'Physics', 85, 1),
(2, 1, 'Mathematics', 90, 1),
(3, 2, 'Computer Science', 88, 2),
(4, 3, 'Physics', 92, 1),
(5, 4, 'Civil Engineering', 75, 2),
(6, 5, 'Business Management', 80, 1);



-- Inner Join (also known as Simple Join / Equi Join): 
-- retrieves records that have matching values in both tables involved in the join.

-- join 2 tables
SELECT faculty.faculty_id, faculty_name, student_name 
FROM students
INNER JOIN faculty ON students.faculty_id = faculty.faculty_id;

-- join 2 tables
SELECT faculty.*, student_name 
FROM students
INNER JOIN faculty ON students.faculty_id = faculty.faculty_id;

-- join 3 tables
SELECT T1.faculty_id, faculty_name, department_name, student_name 
FROM students as T1
INNER JOIN faculty as T2 ON T1.faculty_id = T2.faculty_id
INNER JOIN department as T3 ON T2.faculty_id = T3.faculty_id;

-- join 4 tables
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM marks m
INNER JOIN students s ON m.student_id = s.student_id
INNER JOIN department d ON s.department_id = d.department_id
INNER JOIN faculty f ON d.faculty_id = f.faculty_id;

SELECT f.faculty_name, s.amount, d.department_name, st.student_name
FROM salary s
INNER JOIN faculty f ON s.faculty_id = f.faculty_id
INNER JOIN department d ON f.faculty_id = d.faculty_id
INNER JOIN students st ON d.department_id = st.department_id;

-- join 5 tables
SELECT st.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM marks m
INNER JOIN students st ON m.student_id = st.student_id
INNER JOIN department d ON st.department_id = d.department_id
INNER JOIN faculty f ON d.faculty_id = f.faculty_id
INNER JOIN salary s ON f.faculty_id = s.faculty_id;

-- Left Join (also known as Left Outer Join): 
-- retrieves all records from the left table and the matched records from the right table.

-- Join 2 Tables: marks and students
SELECT T1.student_name, T2.subject_name, T2.marks_obtained
FROM students T1
LEFT JOIN marks T2 ON T1.student_id = T2.student_id;

-- Join 2 Tables: salary and faculty
SELECT T1.faculty_name, T2.amount
FROM faculty T1
LEFT JOIN salary T2 ON T1.faculty_id = T2.faculty_id;

-- Join 3 Tables: students, department, and faculty
SELECT T1.student_name, T2.department_name, T3.faculty_name
FROM students T1
LEFT JOIN department T2 ON T1.department_id = T2.department_id
LEFT JOIN faculty T3 ON T2.faculty_id = T3.faculty_id;

-- Join 3 Tables: marks, students, and department
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name
FROM students s
LEFT JOIN marks m ON s.student_id = m.student_id
LEFT JOIN department d ON s.department_id = d.department_id;

-- Join 4 Tables: marks, students, department, and faculty
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM students s
LEFT JOIN marks m ON s.student_id = m.student_id
LEFT JOIN department d ON s.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id;

-- Join 4 Tables: salary, faculty, department, and students
SELECT f.faculty_name, s.amount, d.department_name, st.student_name
FROM faculty f
LEFT JOIN salary s ON f.faculty_id = s.faculty_id
LEFT JOIN department d ON f.faculty_id = d.faculty_id
LEFT JOIN students st ON d.department_id = st.department_id;

-- Join 5 Tables: marks, students, department, faculty, and salary
SELECT st.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM students st
LEFT JOIN marks m ON st.student_id = m.student_id
LEFT JOIN department d ON st.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
LEFT JOIN salary s ON f.faculty_id = s.faculty_id;
use demojoins;



-- Right Join (also known as Right Outer Join): 
-- retrieves all records from the right table and the matched records from the left table.

-- Join 2 Tables: marks and students
SELECT s.student_name, m.subject_name, m.marks_obtained
FROM students s
RIGHT JOIN marks m ON s.student_id = m.student_id;

-- Join 2 Tables: salary and faculty
SELECT f.faculty_name, s.amount
FROM salary s
RIGHT JOIN faculty f ON s.faculty_id = f.faculty_id;

--  Join 3 Tables: students, department, and faculty
SELECT s.student_name, d.department_name, f.faculty_name
FROM department d
RIGHT JOIN students s ON d.department_id = s.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id;

--  Join 3 Tables: marks, students, and department
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name
FROM marks m
RIGHT JOIN students s ON m.student_id = s.student_id
RIGHT JOIN department d ON s.department_id = d.department_id;

-- Join 4 Tables: marks, students, department, and faculty
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM marks m
RIGHT JOIN students s ON m.student_id = s.student_id
RIGHT JOIN department d ON s.department_id = d.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id;

-- Join 4 Tables: salary, faculty, department, and students
SELECT f.faculty_name, s.amount, d.department_name, st.student_name
FROM salary s
RIGHT JOIN faculty f ON s.faculty_id = f.faculty_id
RIGHT JOIN department d ON f.faculty_id = d.faculty_id
RIGHT JOIN students st ON d.department_id = st.department_id;

-- Join 5 Tables: marks, students, department, faculty, and salary
SELECT st.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM marks m
RIGHT JOIN students st ON m.student_id = st.student_id
RIGHT JOIN department d ON st.department_id = d.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id
RIGHT JOIN salary s ON f.faculty_id = s.faculty_id;


-- Full Join (also known as Full Outer Join): 
-- It retrieves all records from both tables, matching rows where possible, and filling in NULL values where there are no matches.
-- Retrieve all records from both tables, with NULLs where there are no matches

--  Join 2 Tables: marks and students
SELECT s.student_name, m.subject_name, m.marks_obtained
FROM students s
LEFT JOIN marks m ON s.student_id = m.student_id
UNION
SELECT s.student_name, m.subject_name, m.marks_obtained
FROM students s
RIGHT JOIN marks m ON s.student_id = m.student_id;

-- Join 2 Tables: salary and faculty
SELECT f.faculty_name, s.amount
FROM faculty f
LEFT JOIN salary s ON f.faculty_id = s.faculty_id
UNION
SELECT f.faculty_name, s.amount
FROM faculty f
RIGHT JOIN salary s ON f.faculty_id = s.faculty_id;

-- Join 3 Tables: students, department, and faculty
SELECT s.student_name, d.department_name, f.faculty_name
FROM students s
LEFT JOIN department d ON s.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
UNION
SELECT s.student_name, d.department_name, f.faculty_name
FROM students s
RIGHT JOIN department d ON s.department_id = d.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id;

-- Join 3 Tables: marks, students, and department
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name
FROM marks m
LEFT JOIN students s ON m.student_id = s.student_id
LEFT JOIN department d ON s.department_id = d.department_id
UNION
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name
FROM marks m
RIGHT JOIN students s ON m.student_id = s.student_id
RIGHT JOIN department d ON s.department_id = d.department_id;

--  Join 4 Tables: marks, students, department, and faculty
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM marks m
LEFT JOIN students s ON m.student_id = s.student_id
LEFT JOIN department d ON s.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
UNION
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM marks m
RIGHT JOIN students s ON m.student_id = s.student_id
RIGHT JOIN department d ON s.department_id = d.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id;

-- Join 5 Tables: marks, students, department, faculty, and salary
SELECT st.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM marks m
LEFT JOIN students st ON m.student_id = st.student_id
LEFT JOIN department d ON st.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
LEFT JOIN salary s ON f.faculty_id = s.faculty_id
UNION
SELECT st.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM marks m
RIGHT JOIN students st ON m.student_id = st.student_id
RIGHT JOIN department d ON st.department_id = d.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id
RIGHT JOIN salary s ON f.faculty_id = s.faculty_id;




-- Left Exclusive Join (also known as Left Anti Join):
-- retrieves rows from the left table that do not have matching rows in the right table.  

-- Join 2 Tables: marks and students
SELECT s.student_name, m.subject_name, m.marks_obtained
FROM students s
LEFT JOIN marks m ON s.student_id = m.student_id
WHERE m.student_id IS NULL;

-- Join 2 Tables: salary and faculty
SELECT f.faculty_name, s.amount
FROM faculty f
LEFT JOIN salary s ON f.faculty_id = s.faculty_id
WHERE s.faculty_id IS NULL;

-- Join 3 Tables: students, department, and faculty
SELECT s.student_name, d.department_name, f.faculty_name
FROM students s
LEFT JOIN department d ON s.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
WHERE d.department_id IS NULL AND f.faculty_id IS NULL;

-- Join 3 Tables: marks, students, and department
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name
FROM marks m
LEFT JOIN students s ON m.student_id = s.student_id
LEFT JOIN department d ON s.department_id = d.department_id
WHERE d.department_id IS NULL;

-- Join 4 Tables: marks, students, department, and faculty
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM marks m
LEFT JOIN students s ON m.student_id = s.student_id
LEFT JOIN department d ON s.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
WHERE d.department_id IS NULL AND f.faculty_id IS NULL;

-- Join 5 Tables: marks, students, department, faculty, and salary
SELECT st.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM marks m
LEFT JOIN students st ON m.student_id = st.student_id
LEFT JOIN department d ON st.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
LEFT JOIN salary s ON f.faculty_id = s.faculty_id
WHERE d.department_id IS NULL AND f.faculty_id IS NULL AND s.faculty_id IS NULL;



-- Right Exclusive Join (also known as Right Anti Join): 
-- retrieves rows from the right table that do not have matching rows in the left table. 

-- Join 2 Tables: marks and students
SELECT s.student_name, m.subject_name, m.marks_obtained
FROM marks m
RIGHT JOIN students s ON m.student_id = s.student_id
WHERE m.student_id IS NULL;

-- Join 2 Tables: salary and faculty
SELECT f.faculty_name, s.amount
FROM salary s
RIGHT JOIN faculty f ON s.faculty_id = f.faculty_id
WHERE s.faculty_id IS NULL;

-- Join 3 Tables: students, department, and faculty
SELECT s.student_name, d.department_name, f.faculty_name
FROM department d
RIGHT JOIN students s ON d.department_id = s.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id
WHERE s.student_id IS NULL;

-- Join 3 Tables: marks, students, and department
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name
FROM department d
RIGHT JOIN students s ON d.department_id = s.department_id
RIGHT JOIN marks m ON s.student_id = m.student_id
WHERE s.student_id IS NULL;

-- Join 4 Tables: marks, students, department, and faculty
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM department d
RIGHT JOIN students s ON d.department_id = s.department_id
RIGHT JOIN marks m ON s.student_id = m.student_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id
WHERE s.student_id IS NULL;

-- Join 5 Tables: marks, students, department, faculty, and salary
SELECT st.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM salary s
RIGHT JOIN faculty f ON s.faculty_id = f.faculty_id
RIGHT JOIN department d ON f.faculty_id = d.faculty_id
RIGHT JOIN students st ON d.department_id = st.department_id
RIGHT JOIN marks m ON st.student_id = m.student_id
WHERE st.student_id IS NULL;



-- Self Join: (Inner Self Join/Outer Self Join/Self-Reference Join/Self-Relating Join/Table Self Join)
-- Self Join is a special case of a join that allows a table to be joined with itself. 

-- Join 2 Tables: students (e.g., finding students with the same department)
SELECT s1.student_name AS Student1, s2.student_name AS Student2, d.department_name
FROM students s1
JOIN students s2 ON s1.department_id = s2.department_id AND s1.student_id <> s2.student_id
JOIN department d ON s1.department_id = d.department_id;

-- Join 2 Tables: salary (e.g., finding faculty with the same salary)
SELECT f1.faculty_name AS Faculty1, f2.faculty_name AS Faculty2, s.amount
FROM faculty f1
JOIN faculty f2 ON f1.faculty_id <> f2.faculty_id
JOIN salary s ON f1.faculty_id = s.faculty_id AND f2.faculty_id = s.faculty_id;

-- Join 3 Tables: students, department, and faculty (e.g., finding students and their faculty)
SELECT s.student_name, d.department_name, f.faculty_name
FROM students s
JOIN department d ON s.department_id = d.department_id
JOIN faculty f ON d.faculty_id = f.faculty_id;

-- Join 3 Tables: marks, students, and department (e.g., finding students with the same marks in a subject)
SELECT s1.student_name AS Student1, s2.student_name AS Student2, m.subject_name, m.marks_obtained
FROM marks m
JOIN students s1 ON m.student_id = s1.student_id
JOIN students s2 ON m.student_id = s2.student_id AND s1.student_id <> s2.student_id;

-- Join 4 Tables: marks, students, department, and faculty (e.g., finding students and their faculty with marks)
SELECT s.student_name, d.department_name, f.faculty_name, m.subject_name, m.marks_obtained
FROM marks m
JOIN students s ON m.student_id = s.student_id
JOIN department d ON s.department_id = d.department_id
JOIN faculty f ON d.faculty_id = f.faculty_id;

-- Join 5 Tables: marks, students, department, faculty, and salary (e.g., finding students, their faculty, and salary of faculty)
SELECT s.student_name, d.department_name, f.faculty_name, s.salary AS Faculty_Salary, m.subject_name, m.marks_obtained
FROM marks m
JOIN students s ON m.student_id = s.student_id
JOIN department d ON s.department_id = d.department_id
JOIN faculty f ON d.faculty_id = f.faculty_id
JOIN salary s ON f.faculty_id = s.faculty_id;



-- Cross Join:(also known as a Cartesian Join or Cartesian Product Join) 
-- A Cross Join retrieves the Cartesian product of two tables, meaning every row from the first table is 
-- combined with every row from the second table.

-- Join 2 Tables: marks and students
SELECT m.subject_name, m.marks_obtained, s.student_name
FROM marks m
CROSS JOIN students s;

-- Join 2 Tables: salary and faculty
SELECT f.faculty_name, s.amount
FROM salary s
CROSS JOIN faculty f;

-- Join 3 Tables: students, department, and faculty
SELECT s.student_name, d.department_name, f.faculty_name
FROM students s
CROSS JOIN department d
CROSS JOIN faculty f;

-- Join 3 Tables: marks, students, and department
SELECT m.subject_name, m.marks_obtained, s.student_name, d.department_name
FROM marks m
CROSS JOIN students s
CROSS JOIN department d;

-- Join 4 Tables: marks, students, department, and faculty
SELECT m.subject_name, m.marks_obtained, s.student_name, d.department_name, f.faculty_name
FROM marks m
CROSS JOIN students s
CROSS JOIN department d
CROSS JOIN faculty f;

-- Join 5 Tables: marks, students, department, faculty, and salary
SELECT m.subject_name, m.marks_obtained, s.student_name, d.department_name, f.faculty_name, s.amount
FROM marks m
CROSS JOIN students s
CROSS JOIN department d
CROSS JOIN faculty f
CROSS JOIN salary s;

