create database xyzCollege;

use xyzCollege;

drop database xyzcollege;

-- Foriegn Keys
-- Delete and Update Cascade

/*What are Foreign Keys?
 A foreign key is a field in one table that links to the primary key of another table.
 It creates a relationship between the two tables.*/

/*Delete Cascade
A delete cascade means that when a record in the parent table
(the table with the primary key) is deleted, all corresponding records
in the child table (the table with the foreign key) will also be deleted
automatically.*/

/*Update Cascade
An update cascade means that when the primary key of a record in the
parent table is updated, all corresponding foreign keys in the child
table will also be updated automatically.*/

-- Create 5 tables ( Departments, Faculty, Students, Marks, and Salary)

-- Table-1
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,                
    -- Unique identifier for each department
    DepartmentName VARCHAR(100) NOT NULL,        
    -- Name of the department, cannot be NULL
    DepartmentHead VARCHAR(100),                
    -- Head of the department (optional)
    CreationDate DATE NOT NULL,                  
    -- Date the department was created, cannot be NULL
    Budget DECIMAL(15, 2) CHECK (Budget >= 0),  
    -- Budget for the department, must be non-negative
    Location VARCHAR(100),                      
    -- Location of the department (optional)
    PhoneNumber VARCHAR(15),                    
    -- Contact phone number for the department (optional)
    Email VARCHAR(100) UNIQUE,                  
    -- Email address for the department, must be unique
    Status ENUM('Active', 'Inactive') DEFAULT 'Active'
    -- Status of the department (default is 'Active')
);

-- insert values
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentHead, CreationDate, Budget, Location, 
PhoneNumber, Email, Status) VALUES
(1, 'Computer Science', 'Dr. Aditi Joshi', '2015-08-01', 600000.00, 'Main Campus', '022-12345678', 
'cs@mumbaiuniversity.edu', 'Active'),
(2, 'Mechanical Engineering', 'Dr. Rohan Mehta', '2016-07-15', 550000.00, 'Engineering Block', 
'022-23456789', 'mech@mumbaiuniversity.edu', 'Active'),
(3, 'Civil Engineering', 'Dr. Priya Sharma', '2017-09-10', 500000.00, 'Engineering Block', 
'022-34567890', 'civil@mumbaiuniversity.edu', 'Active'),
(4, 'Electrical Engineering', 'Dr. Vikram Singh', '2018-01-20', 520000.00, 'Engineering Block', 
'022-45678901', 'electrical@mumbaiuniversity.edu', 'Inactive'),
(5, 'Information Technology', 'Dr. Neha Gupta', '2019-03-05', 480000.00, 'IT Building', 
'022-56789012', 'it@mumbaiuniversity.edu', 'Active'),
(6, 'Business Administration', 'Dr. Sanjay Rao', '2014-11-11', 700000.00, 'Management Building', 
'022-67890123', 'business@mumbaiuniversity.edu', 'Active'),
(7, 'Psychology', 'Dr. Anjali Verma', '2020-02-25', 300000.00, 'Arts Block', 
'022-78901234', 'psychology@mumbaiuniversity.edu', 'Active'),
(8, 'Economics', 'Dr. Karan Desai', '2018-06-30', 350000.00, 'Social Sciences Building',
 '022-89012345', 'economics@mumbaiuniversity.edu', 'Inactive'),
(9, 'Mathematics', 'Dr. Sneha Patil', '2016-04-15', 400000.00, 'Science Block',
 '022-90123456', 'maths@mumbaiuniversity.edu', 'Active'),
(10, 'History', 'Dr. Amit Bhatia', '2015-12-01', 250000.00, 'Arts Block', 
'022-01234567', 'history@mumbaiuniversity.edu', 'Active');

select * from departments;

-- Table-2
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,                          
    -- Unique identifier for each faculty member
    FacultyName VARCHAR(100) NOT NULL,                  
    -- Name of the faculty member, cannot be NULL
    DepartmentID INT,                                  
    -- Department the faculty belongs to (optional)
    HireDate DATE NOT NULL,                            
    -- Date the faculty member was hired, cannot be NULL
    Email VARCHAR(100) UNIQUE NOT NULL,                
    -- Email address of the faculty member, must be unique
    PhoneNumber VARCHAR(15),                            
    -- Contact phone number for the faculty member (optional)
   
    -- Here Enum is a String Object
    Position ENUM('Professor', 'Associate Professor', 'Assistant Professor', 'Lecturer') NOT NULL,
    -- Position of the faculty member
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
        ON DELETE SET NULL                            
        -- If a department is deleted, set the Faculty's DepartmentID to NULL
        ON UPDATE CASCADE                              
        -- If a DepartmentID is updated, update it in Faculty
);

-- insert 10 records
INSERT INTO Faculty (FacultyID, FacultyName, DepartmentID, HireDate, Email, PhoneNumber, Position) VALUES
(1, 'Dr. Aditi Sharma', 1, '2015-08-01', 'aditi.sharma@mumbaiuniversity.edu.in', '9876543210', 'Professor'),
(2, 'Prof. Rajesh Mehta', 2, '2016-09-15', 'rajesh.mehta@mumbaiuniversity.edu.in', '8765432109', 
'Associate Professor'),
(3, 'Dr. Neha Patil', 3, '2018-01-10', 'neha.patil@mumbaiuniversity.edu.in', '7654321098', 'Assistant Professor'),
(4, 'Mr. Amit Desai', 1, '2020-07-20', 'amit.desai@mumbaiuniversity.edu.in', '6543210987', 'Lecturer'),
(5, 'Dr. Kavita Joshi', 2, '2017-05-25', 'kavita.joshi@mumbaiuniversity.edu.in', '5432109876', 'Professor'),
(6, 'Prof. Sanjay Kulkarni', 3, '2019-11-11', 'sanjay.kulkarni@mumbaiuniversity.edu.in', '4321098765', 
'Associate Professor'),
(7, 'Ms. Pooja Nair', 4, '2021-06-30', 'pooja.nair@mumbaiuniversity.edu.in', '3210987654', 'Assistant Professor'),
(8, 'Dr. Ramesh Bhat', 5, '2014-03-15', 'ramesh.bhat@mumbaiuniversity.edu.in', '2109876543', 'Professor'),
(9, 'Mr. Vikram Singh', 4, '2022-02-01', 'vikram.singh@mumbaiuniversity.edu.in', '1098765432', 'Lecturer'),
(10, 'Dr. Sneha Iyer', 5, '2020-12-12', 'sneha.iyer@mumbaiuniversity.edu.in', '0987654321', 'Associate Professor');

select * from faculty;

-- Table-3
-- Table: Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,                        
    -- Unique identifier for each student (Primary Key)
   
    StudentName VARCHAR(100) NOT NULL,                  
    -- Name of the student, cannot be NULL
    -- This field stores the full name of the student.
   
    DepartmentID INT,                                  
    -- Department the student belongs to (optional)
    -- This field links to the Departments table to indicate the student's department.
   
    EnrollmentDate DATE NOT NULL,                      
    -- Date the student was enrolled, cannot be NULL
    -- This field records the date the student enrolled in the university.
   
    Email VARCHAR(100) UNIQUE NOT NULL,                
    -- Email address of the student, must be unique
    -- This field stores the student's email address and must be unique across all students.
   
    PhoneNumber VARCHAR(15),                            
    -- Contact phone number for the student (optional)
    -- This field is optional and stores the student's contact number.
   
    DateOfBirth DATE,                                  
    -- Date of birth of the student (optional)
    -- This field stores the date of birth of the student for age verification and record-keeping.
   
    Address VARCHAR(255),                              
    -- Residential address of the student (optional)
    -- This field stores the student's residential address.
   
    -- Check constraint for validating email format (basic validation)
    CONSTRAINT chk_EmailFormat CHECK (Email LIKE '%_@__%.__%'),
    -- This ensures that the email address contains at least one character before the '@',
    -- at least two characters after '@', and at least one '.' after the '@'.
   
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
        ON DELETE SET NULL                          
        -- If a department is deleted, set the Student's DepartmentID to NULL
        ON UPDATE CASCADE                            
        -- If a DepartmentID is updated, update it in Students
);

-- insert 10 records
INSERT INTO Students (StudentID, StudentName, DepartmentID, EnrollmentDate, Email, PhoneNumber, DateOfBirth, 
Address) VALUES
(1, 'Aditi Sharma', 1, '2023-08-01', 'aditi.sharma@example.com', '9876543210', '2005-06-15', '123, 
Marine Drive, Mumbai'),
(2, 'Rahul Desai', 2, '2023-08-01', 'rahul.desai@example.com', '9876543211', '2004-05-20', '456, 
Juhu Beach, Mumbai'),
(3, 'Sneha Patil', 1, '2023-08-01', 'sneha.patil@example.com', '9876543212', '2005-07-30', 
'789, Bandra, Mumbai'),
(4, 'Vikram Joshi', 3, '2023-08-01', 'vikram.joshi@example.com', '9876543213', '2004-02-10', 
'321, Andheri, Mumbai'),
(5, 'Priya Iyer', 2, '2023-08-01', 'priya.iyer@example.com', '9876543214', '2005-04-25',
 '654, Powai, Mumbai'),
(6, 'Rohit Mehta', 3, '2023-08-01', 'rohit.mehta@example.com', '9876543215', '2004-11-11', '987, Thane, Mumbai'),
(7, 'Neha Gupta', 1, '2023-08-01', 'neha.gupta@example.com', '9876543216', '2005-12-01', '159, Dadar, Mumbai'),
(8, 'Karan Singh', 2, '2023-08-01', 'karan.singh@example.com', '9876543217', '2004-09-15', '753, Malad, Mumbai'),
(9, 'Anjali Verma', 3, '2023-08-01', 'anjali.verma@example.com', '9876543218', '2005-03-05', '852, Borivali, 
Mumbai'),
(10, 'Siddharth Rao', 1, '2023-08-01', 'siddharth.rao@example.com', '9876543219', '2004-01-20', '963, Ghatkopar, 
Mumbai');

select * from students;


-- Table-4
-- Table: Marks
CREATE TABLE Marks (
    MarkID INT PRIMARY KEY,                              
    -- Unique identifier for each mark record (Primary Key)
   
    StudentID INT,                                      
    -- Student who received the marks
    -- This field links to the Students table to indicate which student received the marks.
   
    FacultyID INT,                                      
    -- Faculty who graded the marks
    -- This field links to the Faculty table to indicate which faculty member graded the marks.
   
    Subject VARCHAR(100) NOT NULL,                      
    -- Subject for which the marks are awarded
    -- This field stores the name of the subject for which the marks are awarded; cannot be NULL.
   
    MarksObtained INT CHECK (MarksObtained >= 0 AND MarksObtained <= 100),
    -- Ensuring marks are within 0-100
    -- This field records the marks obtained by the student; must be between 0 and 100.
   
    ExamDate DATE NOT NULL,                            
    -- Date of the exam
    -- This field records the date on which the exam was conducted; cannot be NULL.
   
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
        ON DELETE CASCADE                              
        -- If a student is deleted, their marks will also be deleted
        ON UPDATE CASCADE,                              
        -- If a StudentID is updated, update it in Marks
       
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
        ON DELETE SET NULL                            
        -- If a faculty member is deleted, set the FacultyID in Marks to NULL
        ON UPDATE CASCADE                              
        -- If a FacultyID is updated, update it in Marks
);

-- insert 10 records
INSERT INTO Marks (MarkID, StudentID, FacultyID, Subject, MarksObtained, ExamDate) VALUES
 (1, 1, 1, 'Mathematics', 85, '2023-05-15'),   -- Student 1
 (2, 2, 2, 'Physics', 78, '2023-05-16'),        -- Student 2
 (3, 3, 3, 'Chemistry', 92, '2023-05-17'),      -- Student 3
 (4, 4, 4, 'Biology', 88, '2023-05-18'),        -- Student 4
 (5, 5, 5, 'Computer Science', 95, '2023-05-19'), -- Student 5
 (6, 6, 6, 'English', 76, '2023-05-20'),        -- Student 6
 (7, 7, 7, 'History', 84, '2023-05-21'),        -- Student 7
 (8, 8, 8, 'Geography', 90, '2023-05-22'),      -- Student 8
 (9, 9, 9, 'Economics', 70, '2023-05-23'),      -- Student 9
 (10, 10, 10, 'Political Science', 82, '2023-05-24'); -- Student 10

select * from marks;

-- Table-5
-- Table: Salary
CREATE TABLE Salary (
    SalaryID INT PRIMARY KEY,                          
    -- Unique identifier for each salary record (Primary Key)
   
    FacultyID INT,                                      
    -- Faculty member whose salary is recorded
    -- This field links to the Faculty table to indicate which faculty member the salary belongs to.
   
    SalaryAmount DECIMAL(10, 2) CHECK (SalaryAmount >= 0),
    -- Ensuring salary is non-negative
    -- This field records the amount of salary paid to the faculty member; must be non-negative.
   
    PaymentDate DATE NOT NULL,                          
    -- Date of salary payment
    -- This field records the date on which the salary was paid; cannot be NULL.
   
    PaymentMethod VARCHAR(50) NOT NULL,                
    -- Method of payment (e.g., bank transfer, cash)
    -- This field indicates the method used for salary payment; cannot be NULL.
   
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
        ON DELETE CASCADE                              
        -- If a faculty member is deleted, their salary record will also be deleted
        ON UPDATE CASCADE                              
        -- If a FacultyID is updated, update it in Salary
);

-- insert 10 records
-- Inserting records into the Salary table
INSERT INTO Salary (SalaryID, FacultyID, SalaryAmount, PaymentDate, PaymentMethod) VALUES
(1, 1, 50000.00, '2023-06-30', 'Bank Transfer'),    
-- Faculty 201
(2, 2, 55000.00, '2023-06-30', 'Cash'),              
-- Faculty 202
(3, 3, 60000.00, '2023-06-30', 'Bank Transfer'),    
-- Faculty 203
(4, 4, 52000.00, '2023-06-30', 'Cheque'),            
-- Faculty 204
(5, 5, 51000.00, '2023-07-30', 'Bank Transfer'),    
-- Faculty 201
(6, 2, 53000.00, '2023-07-30', 'Cash'),              
-- Faculty 202
(7, 3, 59000.00, '2023-07-30', 'Bank Transfer'),    
-- Faculty 203
(8, 4, 54000.00, '2023-07-30', 'Cheque'),            
-- Faculty 204
(9, 1, 52000.00, '2023-08-30', 'Bank Transfer'),    
-- Faculty 201
(10, 2, 55000.00, '2023-08-30', 'Cash');              
-- Faculty 202

select * from salary;

-- Perform Delete and Update Operations
-- Delete a department (e.g., DepartmentID = 1)
DELETE FROM Departments WHERE DepartmentID = 2;

-- Check the Faculty and Students tables to see the effects
SELECT * FROM Faculty;  -- DepartmentID for faculty in department 1 should be NULL
SELECT * FROM Students;  -- DepartmentID for students in department 1 should be NULL


-- Delete a faculty member (e.g., FacultyID = 1)
DELETE FROM Faculty WHERE FacultyID = 1;

-- Check the Salary table to see if the salary record for FacultyID = 1 is deleted
SELECT * FROM Salary;  -- Salary record for FacultyID 1 should be gone

-- Check the Marks table to see the effects
SELECT * FROM Marks;  -- FacultyID for marks graded by FacultyID 1 should be NULL

-- Update a department ID (e.g., change DepartmentID from 2 to 20)
UPDATE Departments SET DepartmentID = 20 WHERE DepartmentID = 2;

-- Check the Faculty and Students tables to see the effects
SELECT * FROM Faculty;  -- DepartmentID for faculty who were in department 2 should now be 20
SELECT * FROM Students;  -- DepartmentID for students who were in department 2 should now be 20

-- Update a faculty ID (e.g., change FacultyID from 3 to 30)
UPDATE Faculty SET FacultyID = 30 WHERE FacultyID = 3;

-- Check the Marks and Salary tables to see the effects
SELECT * FROM Marks;  -- FacultyID for marks graded by FacultyID 3 should now be 30
SELECT * FROM Salary;  -- FacultyID in Salary table for FacultyID 3 should now be 30


/*
In MySQL, you can add and drop constraints on existing tables using the ALTER TABLE statement.

Adding Constraints

1. Adding a Foreign Key Constraint: 
You can add a foreign key constraint to an existing table to enforce referential integrity.

2. Adding a Unique Constraint: 
You can add a unique constraint to ensure that all values in a column are different.

3. Adding a Check Constraint: 
You can add a check constraint to enforce a condition on the values in a column.


Dropping Constraints

1. Dropping a Foreign Key Constraint: 
You can drop a foreign key constraint if you no longer need it.

2. Dropping a Unique Constraint: 
You can drop a unique constraint if you want to allow duplicate values in a column.

3. Dropping a Check Constraint: 
You can drop a check constraint if you want to remove the condition on a column.

*/


-- 1. Adding a Foreign Key Constraint to the Marks table
ALTER TABLE Marks
ADD CONSTRAINT fk_student
FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- 2. Adding a Unique Constraint to the Faculty table on Email
ALTER TABLE Faculty
ADD CONSTRAINT uq_faculty_email UNIQUE (Email);

-- 3. Adding a Check Constraint to the Salary table to ensure SalaryAmount is positive
ALTER TABLE Salary
ADD CONSTRAINT chk_salary_amount CHECK (SalaryAmount > 0);

-- 4. Dropping a Foreign Key Constraint from the Marks table
ALTER TABLE Marks
DROP FOREIGN KEY fk_student;

-- 5. Dropping a Unique Constraint from the Faculty table
ALTER TABLE Faculty
DROP INDEX uq_faculty_email;

-- 6. Dropping a Check Constraint from the Salary table
ALTER TABLE Salary
DROP CHECK chk_salary_amount;

-- 7. Adding a new Check Constraint to the Students table to ensure age is valid
ALTER TABLE Students
ADD CONSTRAINT chk_age CHECK (YEAR(CURDATE()) - YEAR(DateOfBirth) >= 0);

-- 8. Dropping the Check Constraint from the Students table
ALTER TABLE Students
DROP CHECK chk_age;


 