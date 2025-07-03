/*

What Are Operators in MySQL?

Operators in MySQL are special symbols or keywords used to perform operations on one or more operands 
(values, expressions, or fields) in a MySQL query. They are essential for forming conditions, manipulating data, 
'and retrieving desired results from the database. Operators help in computations, comparisons, logical evaluations,
string concatenations, and much more.


1. Arithmetic Operators

+: Addition
-: Subtraction
*: Multiplication
/: Division
%: Modulus (remainder after division)
DIV: Integer division (returns integer part of division)
MOD: Modulus (same as % in MySQL)


2. Comparison Operators

=: Equal to
<> or !=: Not equal to
>: Greater than
<: Less than
>=: Greater than or equal to
<=: Less than or equal to
LIKE: Pattern matching using wildcards (% and _)
NOT LIKE: Pattern not matching
REGEXP: Regular expression matching
NOT REGEXP: Regular expression not matching


3. Logical Operators

AND: Logical AND (true if both conditions are true)
OR: Logical OR (true if at least one condition is true)
NOT: Logical NOT (negates the condition)
XOR: Logical exclusive OR (true if only one condition is true)


4. Assignment Operators

=: Assign a value to a variable or column
:=: Assign a value to a user-defined variable
+=: Addition assignment (not standard in MySQL but used in some cases)
-=: Subtraction assignment
*=: Multiplication assignment
/=: Division assignment
%=: Modulus assignment
DIV=: Integer division assignment
MOD=: Modulus assignment


5. Bitwise Operators

&: Bitwise AND
|: Bitwise OR
^: Bitwise XOR
~: Bitwise NOT (inverts the bits)
<<: Left shift
>>: Right shift


6. String Operators

CONCAT(): Concatenate strings (e.g., CONCAT('Hello', ' World'))
||: String concatenation (alternative to CONCAT in some MySQL versions)


7. Other Operators

IN: Membership test (checks if a value exists in a list or subquery)
NOT IN: Membership test (checks if a value does not exist in a list or subquery)
BETWEEN: Range test (checks if a value is within a range)
NOT BETWEEN: Range test (checks if a value is outside a range)
IS NULL: Null test (checks if a value is NULL)
IS NOT NULL: Null test (checks if a value is not NULL)
EXISTS: Subquery test (true if subquery returns any rows)
NOT EXISTS: Subquery test (true if subquery returns no rows)

Why Are Operators Important in MySQL?
Simplify Query Logic: Operators make it easy to specify conditions and manipulate data directly in SQL statements.
Dynamic Data Retrieval: Help fetch specific records based on comparisons and logical conditions.
Data Manipulation: Arithmetic and string operators allow dynamic computation and formatting of data.
Efficient Filtering: Operators like LIKE and BETWEEN enable precise filtering for large datasets.

These operators cover a wide range of functionality, from basic arithmetic to advanced logical and 
string manipulations, enabling efficient data handling and querying in MySQL.

*/

-- Create the airline database if it does not already exist

CREATE DATABASE IF NOT EXISTS airline123;

USE airline123; -- Set the context to the airline database

Drop database airline123;  -- to remove database completely

-- ------------------------------------Table Queries --------------------------------------

-- Data Definition Language (DDL) {Create,Alter,Drop,Truncate,Rename,Comment}
-- Data Manipulation Language (DML) {Insert, Update, Delete}
-- Data Query Language (DQL) {select query}

-- Table-1 Create Flights table
CREATE TABLE Flights (
  Flight_ID INT PRIMARY KEY, -- Unique identifier for each flight (Primary Key)
  Flight_Number VARCHAR(10) NOT NULL, -- Flight number (e.g., AA123) (Not Null)
  Departure_Airport VARCHAR(100) NOT NULL, -- Name of the departure airport (Not Null)
  Arrival_Airport VARCHAR(100) NOT NULL, -- Name of the arrival airport (Not Null)
  Departure_Time DATETIME NOT NULL, -- Scheduled departure time (Not Null)
  Arrival_Time DATETIME NOT NULL, -- Scheduled arrival time (Not Null)
  Flight_Duration INT NOT NULL, -- Duration of the flight in minutes (Not Null)
  Seats_Available INT NOT NULL CHECK (Seats_Available >= 0), 
  -- Number of available seats (Not Null, must be non-negative)
  Aircraft_Type VARCHAR(50) NOT NULL, -- Type of aircraft used for the flight (Not Null)
  Status ENUM('On Time', 'Delayed', 'Cancelled') NOT NULL DEFAULT 'On Time' 
  -- Current status of the flight (Not Null, default is 'On Time')
);

-- Insert Records into Flights Table

INSERT INTO Flights (Flight_ID, Flight_Number, Departure_Airport, Arrival_Airport, Departure_Time, Arrival_Time, 
Flight_Duration, Seats_Available, Aircraft_Type, Status)
VALUES 
(1, 'AI101', 'Delhi (DEL)', 'Mumbai (BOM)', '2023-10-01 06:00:00', '2023-10-01 08:00:00', 120, 50, 
'Boeing 737', 'On Time'),
(2, 'AI102', 'Mumbai (BOM)', 'Delhi (DEL)', '2023-10-01 09:00:00', '2023-10-01 11:00:00', 120, 60, 
'Airbus A320', 'On Time'),
(3, 'AI103', 'Delhi (DEL)', 'Bangalore (BLR)', '2023-10-01 07:00:00', '2023-10-01 09:30:00', 150, 70, 
'Boeing 737', 'On Time'),
(4, 'AI104', 'Bangalore (BLR)', 'Delhi (DEL)', '2023-10-01 10:00:00', '2023-10-01 12:30:00', 150, 80, 
'Airbus A320', 'On Time'),
(5, 'AI105', 'Delhi (DEL)', 'Chennai (MAA)', '2023-10-01 08:00:00', '2023-10-01 10:30:00', 150, 40, 
'Boeing 737', 'On Time'),
(6, 'AI106', 'Chennai (MAA)', 'Delhi (DEL)', '2023-10-01 11:00:00', '2023-10-01 13:30:00', 150, 50, 
'Airbus A320', 'On Time'),
(7, 'AI107', 'Delhi (DEL)', 'Kolkata (CCU)', '2023-10-01 09:00:00', '2023-10-01 11:30:00', 150, 30, 
'Boeing 737', 'On Time'),
(8, 'AI108', 'Kolkata (CCU)', 'Delhi (DEL)', '2023-10-01 12:00:00', '2023-10-01 14:30:00', 150, 20, 
'Airbus A320', 'On Time'),
(9, 'AI109', 'Delhi (DEL)', 'Hyderabad (HYD)', '2023-10-01 10:00:00', '2023-10-01 12:30:00', 150, 60, 
'Boeing 737', 'On Time'),
(10, 'AI110', 'Hyderabad (HYD)', 'Delhi (DEL)', '2023-10-01 13:00:00', '2023-10-01 15:30:00', 150, 50, 
'Airbus A320', 'On Time'),
(11, 'AI111', 'Delhi (DEL)', 'Pune (PNQ)', '2023-10-01 14:00:00', '2023-10-01 16:00:00', 120, 40, 
'Boeing 737', 'On Time'),
(12, 'AI112', 'Pune (PNQ)', 'Delhi (DEL)', '2023-10-01 17:00:00', '2023-10-01 19:00:00', 120, 30, 
'Airbus A320', 'On Time'),
(13, 'AI113', 'Delhi (DEL)', 'Ahmedabad (AMD)', '2023-10-01 15:00:00', '2023-10-01 17:00:00', 120, 50, 
'Boeing 737', 'On Time'),
(14, 'AI114', 'Ahmedabad (AMD)', 'Delhi (DEL)', '2023-10-01 18:00:00', '2023-10-01 20:00:00', 120, 40, 
'Airbus A320', 'On Time'),
(15, 'AI115', 'Delhi (DEL)', 'Jaipur (JAI)', '2023-10-01 16:00:00', '2023-10-01 17:30:00', 90,  60, 
'Boeing 737', 'On Time');

select * from flights;

 -- Select, Alter, delete & update Queries
 
 /*
 1. SELECT Query
The SELECT statement is used to retrieve data from a database table. 
It allows you to specify the columns you want to fetch and apply conditions to filter the results.

Syntax-

SELECT column1, column2, ...  
FROM table_name  
WHERE condition;  

2. ALTER Query
The ALTER statement is used to modify the structure of an existing table, 
such as adding, deleting, or modifying columns.
The ALTER query changes the table structure, not the data.

Syntax-

ALTER TABLE table_name  
ADD column_name datatype;  
-- or  
ALTER TABLE table_name  
DROP COLUMN column_name;  
-- or  
ALTER TABLE table_name  
MODIFY column_name new_datatype;  

3. DELETE Query
The DELETE statement is used to remove rows from a table based on a specified condition.

Syntax- 

DELETE FROM table_name  
WHERE condition;  

4. UPDATE Query
The UPDATE statement is used to modify existing records in a table.

Syntax:

UPDATE table_name  
SET column1 = value1, column2 = value2, ...  
WHERE condition;  


 */
 
 -- 1. Select Queries
 
 -- Select all records from Flights table
SELECT * FROM Flights;

-- Select flights that are delayed
SELECT * FROM Flights WHERE Status = 'Delayed';

-- Select distinct aircraft types used in flights
SELECT DISTINCT Aircraft_Type FROM Flights;
 
-- Select all flights ordered by Departure_Time
SELECT * FROM Flights ORDER BY Departure_Time;

-- Count the number of flights per status
SELECT Status, COUNT(*) AS NumberOfFlights 
FROM Flights 
GROUP BY Status;

-- Select statuses with more than 5 flights
SELECT Status, COUNT(*) AS NumberOfFlights 
FROM Flights 
GROUP BY Status 
HAVING COUNT(*) > 5; 

-- Select Flights from a Specific Departure Airport
SELECT * FROM Flights WHERE Departure_Airport = 'Delhi (DEL)';

-- Select Flights with More Than 50 Seats Available
SELECT * FROM Flights WHERE Seats_Available > 50;

-- Select Flights Ordered by Arrival Time
SELECT * FROM Flights ORDER BY Arrival_Time;

-- Select Flights with a Duration Greater Than 120 Minutes
SELECT * FROM Flights WHERE Flight_Duration > 120;

-- Select Distinct Aircraft Types
SELECT DISTINCT Aircraft_Type FROM Flights;

-- Select Flights with Arrival Time After a Specific Date
SELECT * FROM Flights WHERE Arrival_Time > '2023-10-01 12:00:00';

-- Select Flights with a Specific Flight Number
SELECT * FROM Flights WHERE Flight_Number = 'AI101';


-- 2. Update Queries

-- Update the number of available seats for a specific flight
UPDATE Flights 
SET Seats_Available = 49
WHERE Flight_ID = 2;

Select * from Flights;

-- Update the Status of a Flight
UPDATE Flights SET Status = 'Cancelled' WHERE Flight_ID = 1;

-- Update the Arrival Airport for a Specific Flight
UPDATE Flights SET Arrival_Airport = 'Chennai (MAA)' WHERE Flight_ID = 3;

-- Update the Flight Duration for a Specific Flight
UPDATE Flights SET Flight_Duration = 130 WHERE Flight_ID = 4;

-- Update the Aircraft Type for a Specific Flight
UPDATE Flights SET Aircraft_Type = 'Boeing 777' WHERE Flight_ID = 5;

-- Update the Departure Time for a Specific Flight
UPDATE Flights SET Departure_Time = '2023-10-01 07:00:00' WHERE Flight_ID = 6;

-- Update Multiple Fields for a Specific Flight
UPDATE Flights SET Seats_Available = 60, Status = 'On Time' WHERE Flight_ID = 7;

-- Update Status for All Delayed Flights
UPDATE Flights SET Status = 'On Time' WHERE Status = 'Delayed';

-- Update the Flight Number for a Specific Flight
UPDATE Flights SET Flight_Number = 'AI201' WHERE Flight_ID = 8;

-- Update the Departure Airport for Multiple Flights
UPDATE Flights SET Departure_Airport = 'Delhi (DEL)' WHERE Arrival_Airport = 'Mumbai (BOM)';


-- 3. Delete Queries

-- Delete a specific flight
DELETE FROM Flights 
WHERE Flight_ID = 2;

-- Delete All Delayed Flights
DELETE FROM Flights WHERE Status = 'Delayed';

-- Delete Flights with No Available Seats
DELETE FROM Flights WHERE Seats_Available = 0;

-- Delete a Flight by Flight Number
DELETE FROM Flights WHERE Flight_Number = 'AI101';

-- Delete Flights Departing Before a Specific Date
DELETE FROM Flights WHERE Departure_Time < '2023-10-01 00:00:00';

-- Delete All Flights to a Specific Destination
DELETE FROM Flights WHERE Arrival_Airport = 'Jaipur (JAI)';

-- Delete Flights with a Duration Less Than a Specific Value
DELETE FROM Flights WHERE Flight_Duration < 90;

-- Delete Flights with a Specific Status
DELETE FROM Flights WHERE Status = 'Cancelled';

-- Delete Flights with a Specific Aircraft Type
DELETE FROM Flights WHERE Aircraft_Type = 'Airbus A320';

-- Delete All Flights with Less Than 30 Seats Available
DELETE FROM Flights WHERE Seats_Available < 30;


-- 4. Alter Queries

-- Add a new column for flight's terminal
ALTER TABLE Flights 
ADD COLUMN Terminal VARCHAR(10);

-- Drop the Terminal column from Flights table
ALTER TABLE Flights 
DROP COLUMN Terminal;

-- Add a New Column for Flight's Airline
ALTER TABLE Flights ADD COLUMN Airline VARCHAR(50);

-- Change the Data Type of Flight_Number
ALTER TABLE Flights MODIFY Flight_Number VARCHAR(15);

-- Rename the Arrival_Airport Column
ALTER TABLE Flights RENAME COLUMN Arrival_Airport TO Destination_Airport;

-- Add a Default Value for Seats_Available
ALTER TABLE Flights ALTER COLUMN Seats_Available SET DEFAULT 100;

-- Rename the Flights Table
ALTER TABLE Flights RENAME TO Flight_Schedules;

 
 -- 5. Add & drop Constraints Queries 
 
 -- Add a CHECK constraint to ensure Flight_Duration is positive
ALTER TABLE Flights 
ADD CONSTRAINT chk_flight_duration CHECK (Flight_Duration > 0);

-- Drop the CHECK constraint on Flight_Duration
ALTER TABLE Flights 
DROP CONSTRAINT chk_flight_duration;

-- Add a CHECK Constraint for Flight Duration
ALTER TABLE Flights ADD CONSTRAINT chk_flight_duration CHECK (Flight_Duration > 0);

-- Drop the CHECK Constraint on Flight Duration
ALTER TABLE Flights DROP CONSTRAINT chk_flight_duration;

-- Add a UNIQUE Constraint on Flight_Number
ALTER TABLE Flights ADD CONSTRAINT unique_flight_number UNIQUE (Flight_Number);

-- Add a CHECK Constraint for Seats Available
ALTER TABLE Flights ADD CONSTRAINT chk_seats_available CHECK (Seats_Available >= 0);

-- Drop the CHECK Constraint on Seats Available
ALTER TABLE Flights DROP CONSTRAINT chk_seats_available;

-- Add a FOREIGN KEY Constraint (if applicable)
ALTER TABLE Flights ADD CONSTRAINT fk_airport FOREIGN KEY (Departure_Airport) REFERENCES Airports(Airport_Name);

-- Drop the FOREIGN KEY Constraint
ALTER TABLE Flights DROP CONSTRAINT fk_airport;

-- Add a NOT NULL Constraint to Flight_Number
ALTER TABLE Flights MODIFY Flight_Number VARCHAR(10) NOT NULL;

-- Drop the NOT NULL Constraint from Flight_Number
ALTER TABLE Flights MODIFY Flight_Number VARCHAR(10);

-- Add a DEFAULT Constraint for Status
ALTER TABLE Flights ALTER COLUMN Status SET DEFAULT 'On Time';

-- Drop the DEFAULT Constraint for Status
ALTER TABLE Flights ALTER COLUMN Status DROP DEFAULT;

-- Add a UNIQUE Constraint on Aircraft_Type
ALTER TABLE Flights ADD CONSTRAINT unique_aircraft_type UNIQUE (Aircraft_Type);

-- Drop the UNIQUE Constraint on Aircraft_Type
ALTER TABLE Flights DROP CONSTRAINT unique_aircraft_type;


/*
Using Information Schema Views:

Most relational database management systems (RDBMS) provide system views that contain 
metadata about the database objects, including constraints. You can query these views 
to find constraint names.
*/

-- to get complete information about constraints and its name.

SELECT CONSTRAINT_NAME, TABLE_NAME, CONSTRAINT_TYPE
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Flights';

/*
Naming Conventions:

If you are creating constraints, it's a good practice to use a consistent naming convention. 
This can help you easily identify constraints later. A common convention is to use the format:

For CHECK constraints: chk_<table>_<column>
For UNIQUE constraints: unique_<table>_<column>
For FOREIGN KEY constraints: fk_<table>_<referenced_table>

Example of Adding Constraints with Naming Conventions

ALTER TABLE Flights 
ADD CONSTRAINT chk_flight_duration CHECK (Flight_Duration > 0);
*/



SELECT 
    CONSTRAINT_NAME, 
    TABLE_NAME, 
    CONSTRAINT_TYPE 
FROM 
    information_schema.TABLE_CONSTRAINTS 
WHERE 
    TABLE_SCHEMA = 'airline123' AND 
    TABLE_NAME = 'Flights';


SELECT 
    COLUMN_NAME 
FROM 
    information_schema.COLUMNS 
WHERE 
    TABLE_SCHEMA = 'airline123' AND 
    TABLE_NAME = 'Flights';


-- Fetch data types and properties of each column in the Flights table
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE 
FROM 
    information_schema.COLUMNS 
WHERE 
    TABLE_SCHEMA = 'airline123' AND 
    TABLE_NAME = 'Flights';

-- List all indexes on the Flights table to understand performance optimization
SELECT 
    INDEX_NAME, 
    COLUMN_NAME, 
    NON_UNIQUE 
FROM 
    information_schema.STATISTICS 
WHERE 
    TABLE_SCHEMA = 'airline123' AND 
    TABLE_NAME = 'Flights';

-- List all tables in the airline123 schema to explore the database structure
SELECT 
    TABLE_NAME 
FROM 
    information_schema.TABLES 
WHERE 
    TABLE_SCHEMA = 'airline123';


-- Fetch default values for each column in the Flights table
SELECT 
    COLUMN_NAME, 
    COLUMN_DEFAULT 
FROM 
    information_schema.COLUMNS 
WHERE 
    TABLE_SCHEMA = 'airline123' AND 
    TABLE_NAME = 'Flights';


-- Count the number of rows in the Flights table
SELECT 
    COUNT(*) AS Row_Count 
FROM 
    airline123.Flights;

-- Retrieve the creation time of the Flights table
SELECT 
    CREATE_TIME 
FROM 
    information_schema.TABLES 
WHERE 
    TABLE_SCHEMA = 'airline123' AND 
    TABLE_NAME = 'Flights';


-- Fetch the last update time of the Flights table
SELECT 
    UPDATE_TIME 
FROM 
    information_schema.TABLES 
WHERE 
    TABLE_SCHEMA = 'airline123' AND 
    TABLE_NAME = 'Flights';


-- Retrieve the order of columns in the Flights table
SELECT 
    COLUMN_NAME, 
    ORDINAL_POSITION 
FROM 
    information_schema.COLUMNS 
WHERE 
    TABLE_SCHEMA = 'airline123' AND 
    TABLE_NAME = 'Flights' 
ORDER BY 
    ORDINAL_POSITION;


 -- Operators
 /*
 In MySQL, operators are special symbols or keywords that are used to perform operations on one or more 
 operands(values or variables). Operators are fundamental to constructing SQL queries, as they allow 
 you to manipulate data, compare values, and perform calculations. MySQL supports several types of 
 operators, which can be categorized as follows:
 
*/

-- Arithmetic operators: +, -, *, /, %

-- Calculate the total flight duration for Flight AI101, adding 30 minutes for a layover
SELECT Flight_Number, Flight_Duration + 30 AS Total_Duration 
FROM Flights 
WHERE Flight_Number = 'AI101';

-- Calculate the remaining seats after booking 10 seats for Flight AI102
SELECT Flight_Number, Seats_Available - 10 AS Remaining_Seats 
FROM Flights 
WHERE Flight_Number = 'AI102';

select * from flights;

-- Calculate the total available seats for all flights by summing the Seats_Available column
SELECT SUM(Seats_Available) AS Total_Available_Seats 
FROM Flights;

-- Calculate the average flight duration across all flights
SELECT AVG(Flight_Duration) AS Average_Flight_Duration 
FROM Flights;

-- Calculate the flight duration in hours for each flight
SELECT Flight_Number, Flight_Duration / 60 AS Duration_Hours 
FROM Flights;

-- Calculate the percentage of available seats for each flight based on a total of 100 seats
SELECT Flight_Number, 
       (Seats_Available / 100.0) * 100 AS Percentage_Available 
FROM Flights;

-- Calculate the remaining flight duration after 30 minutes for each flight
SELECT Flight_Number, 
       Flight_Duration - 30 AS Remaining_Duration 
FROM Flights 
WHERE Flight_Duration > 30;  -- Ensure we don't get negative durations

-- Calculate the total number of seats for flights that have more than 50 available seats
SELECT SUM(Seats_Available) AS Total_Seats 
FROM Flights 
WHERE Seats_Available > 50;

-- Calculate the total duration of flights that are delayed
SELECT SUM(Flight_Duration) AS Total_Duration_Delayed 
FROM Flights 
WHERE Status = 'Delayed';

-- Calculate the total flight time for flights departing from Delhi
SELECT SUM(Flight_Duration) AS Total_Flight_Time 
FROM Flights 
WHERE Departure_Airport = 'Delhi (DEL)';

-- Assuming a hypothetical cost of $2 per minute, calculate total cost for each flight
SELECT Flight_Number, 
       Flight_Duration * 2 AS Total_Cost 
FROM Flights;

-- Calculate the total available seats for flights with a duration greater than 120 minutes
SELECT SUM(Seats_Available) AS Total_Seats_Over_120 
FROM Flights 
WHERE Flight_Duration > 120;

-- Calculate remaining seats after booking 5 seats for each flight
SELECT Flight_Number, 
       Seats_Available - 5 AS Remaining_After_Booking 
FROM Flights;

-- Calculate total revenue from flights assuming a ticket price of $100 per seat
SELECT Flight_Number, 
       Seats_Available * 100 AS Total_Revenue 
FROM Flights;

-- Calculate the total flight duration for flights arriving in Mumbai
SELECT SUM(Flight_Duration) AS Total_Duration_Mumbai 
FROM Flights 
WHERE Arrival_Airport = 'Mumbai (BOM)';

-- Calculate the total number of available seats for flights that are on time
SELECT SUM(Seats_Available) AS Total_Seats_On_Time 
FROM Flights 
WHERE Status = 'On Time';

-- Calculate the total flight duration for flights that have more than 100 available seats
SELECT SUM(Flight_Duration) AS Total_Duration_Over_100 
FROM Flights 
WHERE Seats_Available > 100;

-- Calculate the percentage of flights that are delayed compared to total flights
SELECT (COUNT(CASE WHEN Status = 'Delayed' THEN 1 END) * 100) / COUNT(*) AS Percentage_Delayed 
FROM Flights;

-- Calculate the total number of seats for flights with a duration of less than 30 minutes
SELECT SUM(Seats_Available) AS Total_Seats_Under_30 
FROM Flights 
WHERE Flight_Duration < 30;



-- Comparison operators: =, <, >, <=, >=, != or <> (not equal to)

-- Select all details for the flight with Flight_Number 'AI101'
SELECT * 
FROM Flights 
WHERE Flight_Number = 'AI101';  -- Using '=' operator

-- Select all flights with a duration less than 120 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration < 120;  -- Using '<' operator

-- Select all flights with a duration greater than 150 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration > 150;  -- Using '>' operator

-- Select all flights with a duration less than or equal to 90 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration <= 90;  -- Using '<=' operator

-- Select all flights with a duration greater than or equal to 180 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration >= 180;  -- Using '>=' operator

-- Select all flights that are not arriving at Delhi (DEL)
SELECT * 
FROM Flights 
WHERE Arrival_Airport != 'Delhi (DEL)';  -- Using '!=' operator

-- Select all flights where the status is not equal to 'Cancelled'
SELECT * 
FROM Flights 
WHERE Status <> 'Cancelled';  -- Using '<>' operator

-- Select all flights departing from Mumbai (BOM)
SELECT * 
FROM Flights 
WHERE Departure_Airport = 'Mumbai (BOM)';  -- Using '=' operator

-- Select all flights that have more than 50 available seats
SELECT * 
FROM Flights 
WHERE Seats_Available > 50;  -- Using '>' operator

-- Select all flights that have fewer than 30 available seats
SELECT * 
FROM Flights 
WHERE Seats_Available < 30;  -- Using '<' operator

-- Select all flights that have exactly 60 available seats
SELECT * 
FROM Flights 
WHERE Seats_Available = 60;  -- Using '=' operator

-- Select all flights that do not have a duration of 150 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration != 150;  -- Using '!=' operator

-- Select all flights with a duration greater than 120 and less than 180 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration > 120 AND Flight_Duration < 180;  -- Using '>' and '<' operators

-- Select all flights that are currently 'On Time'
SELECT * 
FROM Flights 
WHERE Status = 'On Time';  -- Using '=' operator

-- Select all flights that arrive after October 1, 2023
SELECT * 
FROM Flights 
WHERE Arrival_Time > '2023-10-01 00:00:00';  -- Using '>' operator

-- Select all flights that depart before October 1, 2023
SELECT * 
FROM Flights 
WHERE Departure_Time < '2023-10-01 00:00:00';  -- Using '<' operator

-- Select all flights that have seats available greater than or equal to 40
SELECT * 
FROM Flights 
WHERE Seats_Available >= 40;  -- Using '>=' operator

-- Select all flights that have seats available less than or equal to 20
SELECT * 
FROM Flights 
WHERE Seats_Available <= 20;  -- Using '<=' operator

-- Select all flights with a duration between 60 and 120 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration >= 60 AND Flight_Duration <= 120;  -- Using '>=' and '<=' operators

-- Select all flights where the status is not equal to 'Delayed'
SELECT * 
FROM Flights 
WHERE Status <> 'Delayed';  -- Using '<>' operator




-- ---------------------------------- Task ------------------------------------------
-- add a column then write a query to enter all details at 1 time.
ALTER TABLE Flights ADD Flight_Status varchar(20);

select * from Flights;

-- insert same value in a table column
UPDATE Flights
SET Flight_Status = 'Scheduled'
WHERE Flight_ID IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15);

-- insert multiple value in a table column
UPDATE Flights SET Flight_Status = 
  CASE
    WHEN Flight_ID IN (1, 2, 3) THEN 'Scheduled' 
    WHEN Flight_ID IN (4, 5) THEN 'Departed'
    WHEN Flight_ID IN (6,11,13) THEN 'Arrived'
    WHEN Flight_ID IN (7,12) THEN 'Delayed'
    WHEN Flight_ID IN (8,14,15) THEN 'Cancelled'
    WHEN Flight_ID IN (9) THEN 'Diverted' 
    WHEN Flight_ID IN (10) THEN 'Held' 
    ELSE 'Unknown' 
  END
  WHERE Flight_ID IN  (1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15);



 

-- Table-2 Create Passengers table
CREATE TABLE Passengers (
  Passenger_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each passenger (Primary Key, Auto Increment)
  First_Name VARCHAR(50) NOT NULL, -- Passenger's first name (Not Null)
  Last_Name VARCHAR(50) NOT NULL, -- Passenger's last name (Not Null)
  Email VARCHAR(100) UNIQUE NOT NULL, -- Passenger's email address (Not Null, must be unique)
  Phone_Number VARCHAR(15), -- Passenger's phone number (Optional)
  Date_of_Birth DATE NOT NULL, -- Passenger's date of birth (Not Null)
  Frequent_Flyer_Number VARCHAR(20) UNIQUE, -- Frequent flyer number (Optional, must be unique)
  Nationality VARCHAR(50) NOT NULL -- Nationality of the passenger (Not Null)
);


-- Insert Records into Passengers Table
INSERT INTO Passengers (First_Name, Last_Name, Email, Phone_Number, Date_of_Birth, Frequent_Flyer_Number, Nationality)
VALUES 
('Rahul', 'Sharma', 'rahul.sharma@example.com', '9876543210', '1990-01-15', 'FF001', 'India'),
('Priya', 'Verma', 'priya.verma@example.com', '8765432109', '1992-02-20', 'FF002', 'India'),
('Amit', 'Kumar', 'amit.kumar@example.com', '7654321098', '1988-03-25', 'FF003', 'India'),
('Sneha', 'Reddy', 'sneha.reddy@example.com', '6543210987', '1995-04-30', 'FF004', 'India'),
('Vikram', 'Singh', 'vikram.singh@example.com', '5432109876', '1985-05-05', 'FF005', 'India'),
('Neha', 'Gupta', 'neha.gupta@example.com', '4321098765', '1993-06-10', 'FF006', 'India'),
('Ravi', 'Patel', 'ravi.patel@example.com', '3210987654', '1987-07-15', 'FF007', 'India'),
('Anjali', 'Mehta', 'anjali.mehta@example.com', '2109876543', '1991-08-20', 'FF008', 'India'),
('Karan', 'Bansal', 'karan.bansal@example.com', '1098765432', '1989-09-25', 'FF009', 'India'),
('Pooja', 'Joshi', 'pooja.joshi@example.com', '0987654321', '1994-10-30', 'FF010', 'India'),
('Suresh', 'Nair', 'suresh.nair@example.com', '9876543210', '1986-11-05', 'FF011', 'India'),
('Tina', 'Chopra', 'tina.chopra@example.com', '8765432109', '1992-12-10', 'FF012', 'India'),
('Mohit', 'Agarwal', 'mohit.agarwal@example.com', '7654321098', '1988-01-15', 'FF013', 'India'),
('Ritika', 'Sethi', 'ritika.sethi@example.com', '6543210987', '1995-02-20', 'FF014', 'India'),
('Deepak', 'Kohli', 'deepak.kohli@example.com', '5432109876', '1985-03-25', 'FF015', 'India');


-- Table-3 Create Bookings table
CREATE TABLE Bookings (
  Booking_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each booking (Primary Key, Auto Increment)
  Flight_ID INT NOT NULL, -- Foreign key referencing Flights table (Not Null)
  Passenger_ID INT NOT NULL, -- Foreign key referencing Passengers table (Not Null)
  Booking_Date DATETIME NOT NULL, -- Date and time of booking (Not Null)
  Number_of_Seats INT NOT NULL CHECK (Number_of_Seats > 0), -- Number of seats booked (Not Null, must be greater than zero)
  Total_Price DECIMAL(10, 2) NOT NULL, -- Total price for the booking (Not Null)
  Booking_Status ENUM('Confirmed', 'Cancelled', 'Pending') NOT NULL DEFAULT 'Pending', -- Status of the booking (Not Null, default is 'Pending')
  FOREIGN KEY (Flight_ID) REFERENCES Flights(Flight_ID) ON DELETE CASCADE, -- Foreign key constraint linking to Flights table with cascading delete
  FOREIGN KEY (Passenger_ID) REFERENCES Passengers(Passenger_ID) ON DELETE CASCADE -- Foreign key constraint linking to Passengers table with cascading delete
);

truncate Bookings;
-- Insert Records into Bookings Table

INSERT INTO Bookings (Flight_ID, Passenger_ID, Booking_Date, Number_of_Seats, Total_Price, Booking_Status)
VALUES 
(1, 1, '2023-09-01 10:00:00', 1, 1500.00, 'Confirmed'),
(2, 2, '2023-09-02 11:00:00', 2, 3000.00, 'Confirmed'),
(3, 3, '2023-09-03 12:00:00', 1, 1500.00, 'Confirmed'),
(4, 4, '2023-09-04 13:00:00', 1, 1500.00, 'Confirmed'),
(5, 5, '2023-09-05 14:00:00', 1, 1500.00, 'Confirmed'),
(6, 6, '2023-09-06 15:00:00', 1, 1500.00, 'Confirmed'),
(7, 7, '2023-09-07 16:00:00', 1, 1500.00, 'Confirmed'),
(8, 8, '2023-09-08 17:00:00', 1, 1500.00, 'Confirmed'),
(9, 9, '2023-09-09 18:00:00', 1, 1500.00, 'Confirmed'),
(10, 10, '2023-09-10 19:00:00', 1, 1500.00, 'Confirmed'),
(11, 11, '2023-09-11 20:00:00', 1, 1500.00, 'Confirmed'),
(12, 12, '2023-09-12 21:00:00', 1, 1500.00, 'Confirmed'),
(13, 13, '2023-09-13 22:00:00', 1, 1500.00, 'Confirmed'),
(14, 14, '2023-09-14 23:00:00', 1, 1500.00, 'Confirmed'),
(15, 15, '2023-09-15 09:00:00', 1, 1500.00, 'Confirmed');


-- Table-4 Create Airlines table
CREATE TABLE Airlines (
  Airline_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each airline (Primary Key, Auto Increment)
  Airline_Name VARCHAR(100) NOT NULL, -- Name of the airline (Not Null)
  IATA_Code VARCHAR(3) UNIQUE NOT NULL, -- IATA code for the airline (Not Null, must be unique)
  Country VARCHAR(50) NOT NULL, -- Country where the airline is based (Not Null)
  Established_Year INT CHECK (Established_Year > 1900), -- Year the airline was established (Must be greater than 1900)
  Headquarter_Location VARCHAR(100) NOT NULL -- Location of the airline's headquarters (Not Null)
);

-- Insert Records into Airlines Table

INSERT INTO Airlines (Airline_Name, IATA_Code, Country, Established_Year, Headquarter_Location)
VALUES 
('Air India', 'AI', 'India', 1932, 'Mumbai'),
('IndiGo', '6E', 'India', 2006, 'Gurgaon'),
('SpiceJet', 'SG', 'India', 2005, 'Gurgaon'),
('Vistara', 'UK', 'India', 2013, 'Gurgaon'),
('GoAir', 'G8', 'India', 2005, 'Mumbai'),
('AirAsia India', 'I5', 'India', 2014, 'Bangalore'),
('Alliance Air', '9I', 'India', 1996, 'Delhi'),
('Jet Airways', '9W', 'India', 1993, 'Mumbai'),
('Air India Express', 'IX', 'India', 2005, 'Kochi'),
('Star Air', 'S5', 'India', 2019, 'Bangalore'),
('Akasa Air', 'QP', 'India', 2022, 'Mumbai'),
('TruJet', '2T', 'India', 2015, 'Hyderabad'),
('Zoom Air', 'Z5', 'India', 2017, 'Delhi'),
('Flybig', 'FB', 'India', 2020, 'Indore'),
('Deccan Charters', 'DC', 'India', 1997, 'Bangalore');


-- Table-5 Create Tickets table
CREATE TABLE Tickets (
  Ticket_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each ticket (Primary Key, Auto Increment)
  Booking_ID INT NOT NULL, -- Foreign key referencing Bookings table (Not Null)
  Ticket_Price DECIMAL(10, 2) NOT NULL, -- Price of the ticket (Not Null, with two decimal places)
  Ticket_Status ENUM('Confirmed', 'Cancelled', ' Pending') NOT NULL, -- Status of the ticket (Not Null, must be one of the specified values)
  Seat_Number VARCHAR(5) NOT NULL, -- Assigned seat number for the ticket (Not Null)
  Baggage_Allowance INT DEFAULT 0, -- Baggage allowance in kilograms (Default is 0)
  FOREIGN KEY (Booking_ID) REFERENCES Bookings(Booking_ID) ON DELETE CASCADE -- Foreign key constraint linking to Bookings table with cascading delete
);

-- Insert Records into Tickets Table
INSERT INTO Tickets (Booking_ID, Ticket_Price, Ticket_Status, Seat_Number, Baggage_Allowance)
VALUES 
(1, 1500.00, 'Confirmed', '1A', 15),
(2, 1500.00, 'Confirmed', '1B', 20),
(3, 1500.00, 'Confirmed', '1C', 15),
(4, 1500.00, 'Confirmed', '1D', 15),
(5, 1500.00, 'Confirmed', '1E', 15),
(6, 1500.00, 'Confirmed', '1F', 15),
(7, 1500.00, 'Confirmed', '1G', 15),
(8, 1500.00, 'Confirmed', '1H', 15),
(9, 1500.00, 'Confirmed', '1I', 15),
(10, 1500.00, 'Confirmed', '1J', 15),
(11, 1500.00, 'Confirmed', '1K', 15),
(12, 1500.00, 'Confirmed', '1L', 15),
(13, 1500.00, 'Confirmed', '1M', 15),
(14, 1500.00, 'Confirmed', '1N', 15),
(15, 1500.00, 'Confirmed', '1O', 15);


-- 1. Select All Records from Each Table

-- Select all records from Flights table
SELECT * FROM Flights;

-- Select all records from Passengers table
SELECT * FROM Passengers;

-- Select all records from Bookings table
SELECT * FROM Bookings;

-- Select all records from Airlines table
SELECT * FROM Airlines;

-- Select all records from Tickets table
SELECT * FROM Tickets;


-- 2. Truncate Each Table

-- Truncate the Tickets table
TRUNCATE TABLE Tickets;

-- Truncate the Bookings table
TRUNCATE TABLE Bookings;

-- Truncate the Passengers table
TRUNCATE TABLE Passengers;

-- Truncate the Flights table
TRUNCATE TABLE Flights;

-- Truncate the Airlines table
TRUNCATE TABLE Airlines;


-- 3. Drop Each Table

-- Drop the Tickets table
DROP TABLE IF EXISTS Tickets;

-- Drop the Bookings table
DROP TABLE IF EXISTS Bookings;

-- Drop the Passengers table
DROP TABLE IF EXISTS Passengers;

-- Drop the Flights table
DROP TABLE IF EXISTS Flights;

-- Drop the Airlines table
DROP TABLE IF EXISTS Airlines;


-- 4. Rename Each Table

-- Rename the Flights table to Flight_Details
ALTER TABLE Flights 
RENAME TO Flight_Details;

-- Rename the Passengers table to Customer
ALTER TABLE Passengers 
RENAME TO Customer;

-- Rename the Bookings table to Reservations
ALTER TABLE Bookings 
RENAME TO Reservations;

-- Rename the Airlines table to Airline_Companies
ALTER TABLE Airlines 
RENAME TO Airline_Companies;

-- Rename the Tickets table to Flight_Tickets
ALTER TABLE Tickets 
RENAME TO Flight_Tickets;

 
