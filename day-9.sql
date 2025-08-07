-- Use the newly created database for subsequent operations
USE demojoins;

/*
Subqueries:

Definition:
A subquery, also known as a nested query or inner query, is a query embedded within another SQL query. 
It is enclosed in parentheses and can be used in various clauses such as SELECT, INSERT, UPDATE, or DELETE. 
Subqueries can return a single value, a single row, or a set of rows.

Purpose:
Subqueries are used to perform operations that require multiple steps or to filter results based on the 
results of another query. They can simplify complex queries by breaking them down into smaller, 
more manageable parts. Subqueries can also be used to retrieve data that will be used in the main query, 
allowing for more dynamic and flexible SQL statements.

Types of Subqueries:
1. Single-row subquery: Returns a single row and can be used with comparison operators.
2. Multiple-row subquery: Returns multiple rows and can be used with operators like IN, ANY, or ALL.
3. Scalar subquery: Returns a single value (one column, one row) and can be used in expressions.

Examples:

1. Single-row subquery:

   - Purpose: To find employees whose salary is greater than the average salary.
   
   SELECT EmployeeID, Name
   FROM Employees
   WHERE Salary > (SELECT AVG(Salary) FROM Employees); 
   
2. Multiple-row subquery:

Purpose: To find employees who work in departments with a budget greater than $100,000.

SELECT EmployeeID, Name
FROM Employees
WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE Budget > 100000);

3. Scalar subquery:

Purpose: To find the name of the employee with the highest salary.

SELECT Name
FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);

4. Correlated subquery:

Purpose: To find employees whose salary is above the average salary of their respective departments.

SELECT e.EmployeeID, e.Name
FROM Employees e
WHERE e.Salary > (SELECT AVG(Salary) FROM Employees WHERE DepartmentID = e.DepartmentID);

subqueries are a powerful feature in SQL that allow for more complex and dynamic queries by enabling the use 
of the results of one query within another. They can help simplify SQL statements and make them more readable 
and maintainable. 
*/
use demojoins;

-- Table-1 Faculty
select * from faculty;

-- 1. Find the Dean of the Faculty with the Longest Name
SELECT dean
FROM faculty
WHERE faculty_id = 
(
    SELECT faculty_id
    FROM faculty
    ORDER BY LENGTH(faculty_name) DESC
    LIMIT 1
);

-- 2. List Faculty Names with Descriptions Containing the Word "science"
SELECT faculty_name
FROM faculty
WHERE faculty_id IN (
    SELECT faculty_id
    FROM faculty
    WHERE faculty_description LIKE '%science%'
);

-- 3. Count the Number of Faculties Located in Buildings Starting with 'Building B'
SELECT COUNT(*)
FROM faculty
WHERE faculty_location IN (
    SELECT faculty_location
    FROM faculty
    WHERE faculty_location LIKE 'Building B%'
);

-- 4. Get the Faculty Name of the Faculty with the Same Location as 'Faculty of Arts'
SELECT faculty_name
FROM faculty
WHERE faculty_location = (
    SELECT faculty_location
    FROM faculty
    WHERE faculty_name = 'Faculty of Arts'
);

-- 5. Find the Faculty Names with Deans Whose Names Contain the Letter 'a'
SELECT faculty_name
FROM faculty
WHERE dean IN (
    SELECT dean
    FROM faculty
    WHERE dean LIKE '%a%'
);


-- Table-2 department
select * from department;


-- 1. Find the Department Head of the Department with the Longest Name
SELECT department_head
FROM department
WHERE department_id = (
    SELECT department_id
    FROM department
    ORDER BY LENGTH(department_name) DESC
    LIMIT 1
);

-- 2. List Departments Located in the Same Location as 'Department of Physics'
SELECT department_name
FROM department
WHERE department_location = (
    SELECT department_location
    FROM department
    WHERE department_name = 'Department of Physics'
);

-- 3. Count the Number of Departments Headed by 'Dr. Grace Black'
SELECT COUNT(*)
FROM department
WHERE department_head = (
    SELECT department_head
    FROM department
    WHERE department_name = 'Department of Civil Engineering'
);

-- 4. Get the Department Name of the Department with the Same Faculty as 'Department of Computer Science'
SELECT department_name
FROM department
WHERE faculty_id = (
    SELECT faculty_id
    FROM department
    WHERE department_name = 'Department of Computer Science'
);

-- 5. Find Departments with Descriptions Containing the Word 'engineering'
SELECT department_name
FROM department
WHERE department_id IN (
    SELECT department_id
    FROM department
    WHERE department_description LIKE '%engineering%'
);


-- table-3 students

-- 1. Find the Names of Students Enrolled in the Same Department as 'Jane Smith'
SELECT student_name
FROM students
WHERE department_id = (
    SELECT department_id
    FROM students
    WHERE student_name = 'Jane Smith'
);

-- 2. Count the Number of Students Enrolled in Each Faculty
SELECT faculty_id, COUNT(*) AS student_count
FROM students
GROUP BY faculty_id
HAVING faculty_id IN (
    SELECT faculty_id
    FROM faculty
    WHERE faculty_name LIKE 'Faculty of%'
);

-- 3. Get the Email of the Student with the Latest Enrollment Year in the Same Department as 'Alice Johnson'
SELECT student_email
FROM students
WHERE enrollment_year = (
    SELECT MAX(enrollment_year)
    FROM students
    WHERE department_id = (
        SELECT department_id
        FROM students
        WHERE student_name = 'Alice Johnson'
    )
);
select * from students;
-- 4. List Students Who Are in Departments with More Than 2 Students
SELECT student_name
FROM students
WHERE department_id IN (
    SELECT department_id
    FROM students
    GROUP BY department_id
    HAVING COUNT(*) > 0
);
-- inner query
    SELECT department_id
    FROM students
    GROUP BY department_id
    HAVING COUNT(*) > 0;

-- 5. Find Students Who Are in the Same Faculty as 'Bob Brown' but Enrolled in a Different Year
SELECT student_name
FROM students
WHERE faculty_id = (
    SELECT faculty_id
    FROM students
    WHERE student_name = 'Bob Brown'
) AND enrollment_year <> (
    SELECT enrollment_year
    FROM students
    WHERE student_name = 'Bob Brown'
);

-- Homework is write subqueries for salary and marks table

-- Subqueries including 5 tables



-- Sub-Queries with 2 Tables

-- 1. Find students who scored above the highest mark in a specific subject
SELECT s.student_name, m.marks_obtained
FROM students s
JOIN marks m ON s.student_id = m.student_id
WHERE m.marks_obtained > (SELECT MAX(marks_obtained) FROM marks WHERE subject_name = 'Mathematics');

-- 2. Find faculty members who earn less than the minimum salary in their department
SELECT f.faculty_name, s.amount
FROM faculty f
JOIN salary s ON f.faculty_id = s.faculty_id
WHERE s.amount < (SELECT MIN(amount) FROM salary WHERE department_id = f.department_id);

-- 3. Find students who scored above the average marks in a specific subject
SELECT s.student_name, m.marks_obtained
FROM students s
JOIN marks m ON s.student_id = m.student_id
WHERE m.marks_obtained > (SELECT AVG(marks_obtained) FROM marks WHERE subject_name = 'Science');

-- 4. Find faculty members who earn more than the average salary in their department
SELECT f.faculty_name, s.amount
FROM faculty f
JOIN salary s ON f.faculty_id = s.faculty_id
WHERE s.amount > (SELECT AVG(amount) FROM salary WHERE department_id = f.department_id);

-- 5. Find students who scored above the highest mark in a specific subject and have a faculty member with a 
-- specific title
SELECT s.student_name, m.marks_obtained
FROM students s
JOIN marks m ON s.student_id = m.student_id
WHERE m.marks_obtained > (SELECT MAX(marks_obtained) FROM marks WHERE subject_name = 'Mathematics')
AND s.faculty_id IN (SELECT faculty_id FROM faculty WHERE title = 'Professor');

-- 6. Find faculty members who earn less than the minimum salary in their department and have students with 
-- low marks
SELECT f.faculty_name, s.amount
FROM faculty f
JOIN salary s ON f.faculty_id = s.faculty_id
WHERE s.amount < (SELECT MIN(amount) FROM salary WHERE department_id = f.department_id)
AND EXISTS (SELECT 1 FROM students s2 JOIN marks m ON s2.student_id = m.student_id 
WHERE s2.faculty_id = f.faculty_id AND m.marks_obtained < 40);


-- Sub-Queries with 3 Tables

-- 1. Find students who scored above the highest mark in a specific subject and are from a specific department
SELECT s.student_name, m.marks_obtained
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN department d ON s.department_id = d.department_id
WHERE m.marks_obtained > (SELECT MAX(marks_obtained) FROM marks WHERE subject_name = 'Mathematics')
AND d.department_name = 'Computer Science';

-- 2. Find faculty members who earn less than the minimum salary in their department and have students with low 
-- marks
SELECT f.faculty_name, s.amount
FROM faculty f
JOIN salary s ON f.faculty_id = s.faculty_id
JOIN department d ON f.department_id = d.department_id
WHERE s.amount < (SELECT MIN(amount) FROM salary WHERE department_id = f.department_id)
AND EXISTS (SELECT 1 FROM students s2 JOIN marks m ON s2.student_id = m.student_id 
WHERE s2.faculty_id = f.faculty_id AND m.marks_obtained < 40);

-- 3. Find students who scored above the average marks in a specific subject and have a faculty member with 
-- a specific title
SELECT s.student_name, m.marks_obtained
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN faculty f ON s.faculty_id = f.faculty_id
WHERE m.marks_obtained > (SELECT AVG(marks_obtained) FROM marks WHERE subject_name = 'Science')
AND f.title = 'Professor';

-- 4. Find faculty members who earn more than the average salary in their department and have students 
-- with high marks
SELECT f.faculty_name, s.amount
FROM faculty f
JOIN salary s ON f.faculty_id = s.faculty_id
JOIN department d ON f.department_id = d.department_id
WHERE s.amount > (SELECT AVG(amount) FROM salary WHERE department_id = f.department_id)
AND EXISTS (SELECT 1 FROM students s2 JOIN marks m ON s2.student_id = m.student_id 
WHERE s2.faculty_id = f.faculty_id AND m.marks_obtained > 80);

-- 5. Find students who scored above the highest mark in a specific subject, are from a specific department, 
-- and have a faculty member with a specific title
SELECT s.student_name, m.marks_obtained
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN faculty f ON s.faculty_id = f.faculty_id
JOIN department d ON s.department_id = d.department_id
WHERE m.marks_obtained > (SELECT MAX(marks_obtained) FROM marks WHERE subject_name = 'Mathematics')
AND d.department_name = 'Computer Science'
AND f.title = 'Professor';

-- 6. Find faculty members who earn less than the minimum salary in their department, have students 
-- with low marks, and are from a specific department
SELECT f.faculty_name, s.amount
FROM faculty f
JOIN salary s ON f.faculty_id = s.faculty_id
JOIN department d ON f.department_id = d.department_id
WHERE s.amount < (SELECT MIN(amount) FROM salary WHERE department_id = f.department_id)
AND EXISTS (SELECT 1 FROM students s2 JOIN marks m ON s2.student_id = m.student_id 
WHERE s2.faculty_id = f.faculty_id AND m.marks_obtained < 40)
AND d.department_name = 'Electrical Engineering';

-- Sub-Queries with 4 Tables

-- 1. Find students who scored above the average marks in their department and have a faculty member 
-- with a specific title
SELECT s.student_name, m.marks_obtained, d.department_name, f.faculty_name
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN department d ON s.department_id = d.department_id
JOIN faculty f ON d.faculty_id = f.faculty_id
WHERE m.marks_obtained > (SELECT AVG(marks_obtained) FROM marks m2 
                           JOIN students s2 ON m2.student_id = s2.student_id 
                           WHERE s2.department_id = d.department_id)
AND f.title = 'Professor';

-- 2. Find faculty members who earn more than the average salary of their department and have students 
-- with high marks
SELECT f.faculty_name, s.amount, d.department_name
FROM faculty f
JOIN salary s ON f.faculty_id = s.faculty_id
JOIN department d ON f.department_id = d.department_id
WHERE s.amount > (SELECT AVG(amount) FROM salary s2 
                   JOIN faculty f2 ON s2.faculty_id = f2.faculty_id 
                   WHERE f2.department_id = d.department_id)
AND EXISTS (SELECT 1 FROM students s3 
            JOIN marks m ON s3.student_id = m.student_id 
            WHERE s3.department_id = d.department_id AND m.marks_obtained > 80);
            
-- 3. Find students who scored above the average marks in their department and are taught by faculty members 
-- with a specific salary range
SELECT s.student_name, m.marks_obtained, d.department_name, f.faculty_name, sa.amount
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN department d ON s.department_id = d.department_id
JOIN faculty f ON d.faculty_id = f.faculty_id
JOIN salary sa ON f.faculty_id = sa.faculty_id
WHERE m.marks_obtained > (SELECT AVG(marks_obtained) FROM marks m2 
                           JOIN students s2 ON m2.student_id = s2.student_id 
                           WHERE s2.department_id = d.department_id)
AND sa.amount BETWEEN 50000 AND 100000;

-- 4. Find faculty members who earn less than the minimum salary in their department and have students 
-- with low marks
SELECT f.faculty_name, s.amount, d.department_name
FROM faculty f
JOIN salary s ON f.faculty_id = s.faculty_id
JOIN department d ON f.department_id = d.department_id
WHERE s.amount < (SELECT MIN(amount) FROM salary s2 
                   JOIN faculty f2 ON s2.faculty_id = f2.faculty_id 
                   WHERE f2.department_id = d.department_id)
AND EXISTS (SELECT 1 FROM students s3 
            JOIN marks m ON s3.student_id = m.student_id 
            WHERE s3.faculty_id = f.faculty_id AND m.marks_obtained < 40);
            
-- 5. Find students who scored above the average marks in their department and are supervised by faculty 
-- members with a specific title and salary range
SELECT s.student_name, m.marks_obtained, d.department_name, f.faculty_name, sa.amount
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN department d ON s.department_id = d.department_id
JOIN faculty f ON d.faculty_id = f.faculty_id
JOIN salary sa ON f.faculty_id = sa.faculty_id
WHERE m.marks_obtained > (SELECT AVG(marks_obtained) FROM marks m2 
                           JOIN students s2 ON m2.student_id = s2.student_id 
                           WHERE s2.department_id = d.department_id)
AND f.title = 'Associate Professor'
AND sa.amount > 60000;



-- Sub-Queries with 5 Tables

-- 1. Find students with marks greater than the average marks in a department, faculty, and salary range

SELECT s.student_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN department d ON s.department_id = d.department_id
JOIN faculty f ON d.faculty_id = f.faculty_id
JOIN salary s ON f.faculty_id = s.faculty_id
WHERE m.marks_obtained > (SELECT AVG(marks_obtained) FROM marks 
WHERE department_id = d.department_id AND faculty_id = f.faculty_id AND amount BETWEEN 50000 AND 100000);

-- 2. Find faculty with salary greater than the average salary in a department, faculty, and student count
SELECT f.faculty_name, s.amount, d.department_name, f.faculty_name, COUNT(s.student_id) AS student_count
FROM faculty f
JOIN salary s ON f.faculty_id = s.faculty_id
JOIN department d ON f.department_id = d.department_id
JOIN students s ON d.department_id = s.department_id
WHERE s.amount > (SELECT AVG(amount) FROM salary 
WHERE department_id = d.department_id AND faculty_id = f.faculty_id AND student_count > 10);

-- 3. Find students who scored above the average marks in their department, are taught by faculty members 
-- with a specific title, and belong to a specific salary range
SELECT s.student_name, m.marks_obtained, d.department_name, f.faculty_name, sa.amount
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN department d ON s.department_id = d.department_id
JOIN faculty f ON d.faculty_id = f.faculty_id
JOIN salary sa ON f.faculty_id = sa.faculty_id
WHERE m.marks_obtained > (SELECT AVG(marks_obtained) FROM marks m2 
                           JOIN students s2 ON m2.student_id = s2.student_id 
                           WHERE s2.department_id = d.department_id)
AND f.title = 'Professor'
AND sa.amount BETWEEN 70000 AND 120000;

-- 4. Find faculty members who earn less than the minimum salary in their department, have students 
-- with low marks, and are from a specific department
SELECT f.faculty_name, s.amount, d.department_name
FROM faculty f
JOIN salary s ON f.faculty_id = s.faculty_id
JOIN department d ON f.department_id = d.department_id
WHERE s.amount < (SELECT MIN(amount) FROM salary s2 
                   JOIN faculty f2 ON s2.faculty_id = f2.faculty_id 
                   WHERE f2.department_id = d.department_id)
AND EXISTS (SELECT 1 FROM students s3 
            JOIN marks m ON s3.student_id = m.student_id 
            WHERE s3.faculty_id = f.faculty_id AND m.marks_obtained < 40)
AND d.department_name = 'Mathematics';

-- 5. Find students who scored above the average marks in their department, are supervised by faculty 
-- members with a specific title, and have faculty members earning above a certain salary
SELECT s.student_name, m.marks_obtained, d.department_name, f.faculty_name, sa.amount
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN department d ON s.department_id = d.department_id
JOIN faculty f ON d.faculty_id = f.faculty_id
JOIN salary sa ON f.faculty_id = sa.faculty_id
WHERE m.marks_obtained > (SELECT AVG(marks_obtained) FROM marks m2 
                           JOIN students s2 ON m2.student_id = s2.student_id 
                           WHERE s2.department_id = d.department_id)
AND f.title = 'Associate Professor'
AND sa.amount > 80000;

-- 6. Find faculty members who earn more than the average salary in their department and have students 
-- with high marks, while also being from a specific department
SELECT f.faculty_name, s.amount, d.department_name
FROM faculty f
JOIN salary s ON f.faculty_id = s.faculty_id
JOIN department d ON f.department_id = d.department_id
WHERE s.amount > (SELECT AVG(amount) FROM salary s2 
                   JOIN faculty f2 ON s2.faculty_id = f2.faculty_id 
                   WHERE f2.department_id = d.department_id)
AND EXISTS (SELECT 1 FROM students s3 
            JOIN marks m ON s3.student_id = m.student_id 
            WHERE s3.department_id = d.department_id AND m.marks_obtained > 85)
AND d.department_name = 'Computer Science';

-- 7. Find students who scored above the highest mark in a specific subject, belong to a specific department, 
-- and are taught by faculty members with a specific title and salary range
SELECT s.student_name, m.marks_obtained, d.department_name, f.faculty_name, sa.amount
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN department d ON s.department_id = d.department_id
JOIN faculty f ON d.faculty_id = f.faculty_id
JOIN salary sa ON f.faculty_id = sa.faculty_id
WHERE m.marks_obtained > (SELECT MAX(marks_obtained) FROM marks WHERE subject_name = 'Mathematics')
AND d.department_name = 'Engineering'
AND f.title = 'Professor'
AND sa.amount BETWEEN 60000 AND 100000;


-- Multiple types of Subqueries

-- 1. Single Row Subqueries
-- A single-row subquery returns only one row and can be used with comparison operators.
-- Example: Find students who scored more than the highest mark in a specific subject.
SELECT s.student_name, m.marks_obtained
FROM students s
JOIN marks m ON s.student_id = m.student_id
WHERE m.marks_obtained > (SELECT MAX(marks_obtained) FROM marks WHERE subject_name = 'Mathematics');


-- 2. Multi-row Subqueries
-- A multi-row subquery returns multiple rows and is typically used with operators 
-- like IN, ANY, or ALL.
-- Example: Find students who scored above the average marks of all students.
SELECT s.student_name, m.marks_obtained
FROM students s
JOIN marks m ON s.student_id = m.student_id
WHERE m.marks_obtained > (SELECT AVG(marks_obtained) FROM marks);


-- 3. Correlated Subqueries
-- A correlated subquery references columns from the outer query and is executed 
-- for each row processed by the outer query.
-- Example: Find students who scored above the average marks in their department.
SELECT s.student_name, m.marks_obtained, d.department_name
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN department d ON s.department_id = d.department_id
WHERE m.marks_obtained > (SELECT AVG(marks_obtained) 
                           FROM marks m2 
                           JOIN students s2 ON m2.student_id = s2.student_id 
                           WHERE s2.department_id = d.department_id);
                           

-- 4. Using IN Operator
-- The IN operator allows you to specify multiple values in a WHERE clause.
-- Example: Find students who scored in the top 10 marks in any subject.
SELECT s.student_name, m.marks_obtained
FROM students s
JOIN marks m ON s.student_id = m.student_id
WHERE m.marks_obtained IN (SELECT marks_obtained 
                            FROM marks 
                            ORDER BY marks_obtained DESC 
                            LIMIT 10);


-- 5. Using EXISTS Operator
-- The EXISTS operator checks for the existence of rows returned by a subquery.
-- Example: Find faculty members who have students with low marks.
SELECT f.faculty_name
FROM faculty f
WHERE EXISTS (SELECT 1 
              FROM students s 
              JOIN marks m ON s.student_id = m.student_id 
              WHERE s.faculty_id = f.faculty_id AND m.marks_obtained < 40);


-- 6. Using ANY Operator
-- The ANY operator compares a value to each value returned by the subquery and 
-- returns true if any comparison is true.
-- Example: Find students who scored more than any student in a specific department.
SELECT s.student_name, m.marks_obtained
FROM students s
JOIN marks m ON s.student_id = m.student_id
WHERE m.marks_obtained > ANY (SELECT m2.marks_obtained 
                               FROM marks m2 
                               JOIN students s2 ON m2.student_id = s2.student_id 
                               WHERE s2.department_id = 'Computer Science');


-- 7. Using ALL Operator
-- The ALL operator compares a value to all values returned by the subquery and 
-- returns true if the comparison is true for all values.
-- Example: Find students who scored more than all students in a specific subject.
SELECT s.student_name, m.marks_obtained
FROM students s
JOIN marks m ON s.student_id = m.student_id
WHERE m.marks_obtained > ALL (SELECT m2.marks_obtained 
                               FROM marks m2 
                               WHERE m2.subject_name = 'Mathematics');
                               
                               