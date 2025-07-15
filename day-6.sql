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

use airline123;

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


-- Logical operators: AND, OR, NOT

-- Find flights from Delhi to Mumbai that are on time and have available seats.
SELECT * FROM Flights 
WHERE Departure_Airport = 'Delhi (DEL)' 
AND Arrival_Airport = 'Mumbai (BOM)' 
AND Status = 'On Time' 
AND Seats_Available > 0;


-- Find flights that either depart from Delhi or arrive in Delhi.
SELECT * FROM Flights 
WHERE Departure_Airport = 'Delhi (DEL)' 
OR Arrival_Airport = 'Delhi (DEL)';

-- Find flights that are not delayed.
SELECT * FROM Flights 
WHERE NOT Status = 'Delayed';

-- Find all unique arrival airports for flights that are on time and have more than 50 seats available.
SELECT DISTINCT Arrival_Airport FROM Flights 
WHERE Status = 'On Time' 
AND Seats_Available > 50;

-- Find all unique departure airports for flights that are either delayed or cancelled.
SELECT DISTINCT Departure_Airport FROM Flights 
WHERE Status IN ('Delayed', 'Cancelled');

-- Find flights that either depart from Bangalore or arrive in Kolkata, but are not on time.
SELECT * FROM Flights 
WHERE (Departure_Airport = 'Bangalore (BLR)' OR Arrival_Airport = 'Kolkata (CCU)') 
AND NOT Status = 'On Time';

-- Find flights that are on time and have a flight duration of more than 120 minutes.
SELECT * FROM Flights 
WHERE Status = 'On Time' 
AND Flight_Duration > 120;

-- Find flights that are not departing from Delhi and are either arriving in Mumbai or Chennai.
SELECT * FROM Flights 
WHERE NOT Departure_Airport = 'Delhi (DEL)' 
AND (Arrival_Airport = 'Mumbai (BOM)' OR Arrival_Airport = 'Chennai (MAA)');

-- Find flights that are either delayed or cancelled, and have less than 30 seats available.
SELECT * FROM Flights 
WHERE (Status = 'Delayed' OR Status = 'Cancelled') 
AND Seats_Available < 30;

-- Find flights from Delhi to any destination that are either on time or have more than 50 seats available.
SELECT * FROM Flights 
WHERE Departure_Airport = 'Delhi (DEL)' 
AND (Status = 'On Time' OR Seats_Available > 50);


-- String operators: LIKE, REGEXP, NOT LIKE

-- Find flights with flight numbers starting with 'AI'.
SELECT * FROM Flights 
WHERE Flight_Number LIKE 'AI%';

-- Find flights that have 'Delhi' in either the departure or arrival airport.
SELECT * FROM Flights 
WHERE Departure_Airport REGEXP 'Delhi' 
OR Arrival_Airport REGEXP 'Delhi';

-- Find flights that do not go to Chennai.
SELECT * FROM Flights 
WHERE Arrival_Airport NOT LIKE 'Chennai (MAA)';

-- Find flights that do not have '737' in the aircraft type.
SELECT * FROM Flights 
WHERE Aircraft_Type NOT LIKE '%737%';

-- Find flights that have 'Bangalore' in either the departure or arrival airport.
SELECT * FROM Flights 
WHERE Departure_Airport REGEXP 'Bangalore' 
OR Arrival_Airport REGEXP 'Bangalore';


-- Set operators: UNION, UNION All, INTERSECT, EXCEPT or DIFFERENCE

--  Find all unique arrival airports from flights departing from Delhi and flights arriving in Delhi.
SELECT Arrival_Airport FROM Flights 
WHERE Departure_Airport = 'Delhi (DEL)'
UNION
SELECT Departure_Airport FROM Flights 
WHERE Arrival_Airport = 'Delhi (DEL)';

SELECT * FROM Flights 
WHERE Departure_Airport = 'Delhi (DEL)'
UNION
SELECT * FROM Flights 
WHERE Arrival_Airport = 'Delhi (DEL)';

/*
 Find flights that are both departing from Delhi and arriving in Mumbai 
 (Note: INTERSECT is not supported in all SQL databases, so this is a conceptual example).
*/
SELECT * FROM Flights 
WHERE Departure_Airport = 'Delhi (DEL)' 
INTERSECT 
SELECT * FROM Flights 
WHERE Arrival_Airport = 'Mumbai (BOM)';


-- Control flow operators: IF, CASE

-- Create a query that categorizes flights based on their status.
SELECT Flight_ID, Flight_Number, 
CASE 
    WHEN Status = 'On Time' THEN 'Flight is on schedule'
    WHEN Status = 'Delayed' THEN 'Flight is delayed'
    WHEN Status = 'Cancelled' THEN 'Flight is cancelled'
END AS Flight_Status_Description
FROM Flights;

-- Create a query that provides a summary of flight statuses with counts.
SELECT Status, COUNT(*) AS Flight_Count 
FROM Flights 
GROUP BY Status;

-- Create a query that categorizes flights based on their duration.
SELECT Flight_ID, Flight_Number, 
CASE 
    WHEN Flight_Duration < 120 THEN 'Short Haul'
    WHEN Flight_Duration BETWEEN 120 AND 180 THEN 'Medium Haul'
    ELSE 'Long Haul'
END AS Flight_Duration_Category
FROM Flights;


-- Bitwise operators

/*
Get Binary Number -

-------512, 256, 128, 64, 32, 16, 8, 4, 2,1

Binary of 5 is - 0101
Binary of 3 is - 0011

Common Bitwise Operators in MySQL
AND (&): Compares each bit of two numbers and returns a new number with bits set to 1 only where both bits are 1.
OR (|): Compares each bit of two numbers and returns a new number with bits set to 1 where at least one of the bits
is 1.
XOR (^): Compares each bit of two numbers and returns a new number with bits set to 1 where the bits are different.
NOT (~): Inverts the bits of a number.
Left Shift (<<): Shifts the bits of a number to the left by a specified number of positions.
Right Shift (>>): Shifts the bits of a number to the right by a specified number of positions.

Bitwise operators can be useful in various scenarios, such as:

1. Flags and Permissions: Using bitwise operations to manage user permissions or feature flags.
2. Data Compression: Storing multiple boolean values in a single integer.
3. Efficient Calculations: Performing low-level data manipulation or optimizations.

Let's say we have a table called users that stores user permissions as a bitmask.
Each permission corresponds to a specific bit in an integer:

1 (0001) - Read permission
2 (0010) - Write permission
4 (0100) - Execute permission
8 (1000) - Delete permission
*/

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    permissions INT NOT NULL
);

-- Let's insert some users with different permissions:
INSERT INTO users (username, email, password_hash, permissions) VALUES
('Alice', 'alice@example.com', 'hashed_password_1', 3),  -- Read (1) + Write (2) = 3 (0011)
('Bob', 'bob@example.com', 'hashed_password_2', 5),    -- Read (1) + Execute (4) = 5 (0101)
('Charlie', 'charlie@example.com', 'hashed_password_3', 8), -- Delete (8) = 8 (1000)
('David', 'david@example.com', 'hashed_password_4', 15),  -- All permissions (1111)
('Eve', 'eve@example.com', 'hashed_password_5', 1),      -- Read (1)
('Frank', 'frank@example.com', 'hashed_password_6', 6),   -- Write (2) + Execute (4) = 6 (0110)
('Grace', 'grace@example.com', 'hashed_password_7', 10),  -- Write (2) + Delete (8) = 10 (1010)
('Hannah', 'hannah@example.com', 'hashed_password_8', 12), -- Execute (4) + Delete (8) = 12 (1100)
('Isaac', 'isaac@example.com', 'hashed_password_9', 0),   -- No permissions
('Jack', 'jack@example.com', 'hashed_password_10', 7);    -- Read (1) + Write (2) + Execute (4) = 7 (0111)

SELECT * FROM users;

SELECT * FROM users WHERE (permissions & 1) = 1;  
-- Users with Read permission

SELECT * FROM users WHERE (permissions & 3) = 3;  
-- Users with Read and Write permissions

SELECT * FROM users WHERE (permissions & 2) = 2;  
-- Users with Write permission

SELECT * FROM users WHERE (permissions & 4) = 4;  
-- Users with Execute permission

SELECT * FROM users WHERE (permissions & 8) = 8;  
-- Users with Delete permission
select * from users;
-- Add Permission
UPDATE users SET permissions = permissions & 4 WHERE username = 'Alice';
UPDATE users SET permissions = permissions | 4 WHERE username = 'Alice';
/*
The error message you're encountering indicates that MySQL's "safe update mode" is enabled.
This mode prevents you from executing UPDATE or DELETE statements that do not include
a WHERE clause that uses a key column (like a primary key). This is a safety feature
to prevent accidental updates or deletions of all rows in a table.
*/
--  Disable Safe Update Mode Temporarily
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe updates


-- Remove Permission
UPDATE users SET permissions = permissions & ~1 WHERE username = 'Bob';

-- Toggle Permission
UPDATE users SET permissions = permissions ^ 8 WHERE username = 'Charlie';

-- Count Users with a Specific Permission
SELECT COUNT(*) AS user_count FROM users WHERE (permissions & 1) = 1;

-- List Users with No Permissions
SELECT * FROM users WHERE permissions = 0;

-- List Users with All Permissions
SELECT * FROM users WHERE permissions = 15;  -- 15 = 1111 in binary

-- Get Permissions as Binary String
SELECT username, BIN(permissions) AS permissions_binary FROM users;

-- Find Users with At Least One Permission
SELECT * FROM users WHERE permissions > 0;

-- Find Users with No Read Permission
SELECT * FROM users WHERE (permissions & 1) = 0;  -- Users without Read permission


--  Find Users with Either Write or Execute Permission
SELECT * FROM users WHERE (permissions & (2 | 4)) > 0;  -- Users with Write or Execute permission

-- Update Multiple Users' Permissions
UPDATE users SET permissions = permissions | 8 WHERE username IN ('Alice', 'Bob');

--  Remove All Permissions from a User
UPDATE users SET permissions = 0 WHERE username = 'Charlie';

-- Check for Users with No Execute Permission
SELECT * FROM users WHERE (permissions & 4) = 0;
 -- Users without Execute permission

-- Get Users with Specific Combination of Permissions
SELECT * FROM users WHERE (permissions & 3) = 3 AND (permissions & 4) = 0;





 -- Clauses {Where, Distinct, From, Order By, Group By, Having}
 
 -- 1. WHERE Clause Queries

 /*
The WHERE clause is used to filter records in a table based on specific conditions. 
It is typically used with SELECT, UPDATE, and DELETE statements.

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE condition;  
 */
 
 -- Select flights that are delayed
 SELECT * FROM Flights WHERE Status = 'Delayed';
 
 -- Select flights departing from Delhi
 SELECT * FROM Flights WHERE Departure_Airport = 'Delhi (DEL)';
 
 -- Select flights arriving in Mumbai
 SELECT * FROM Flights WHERE Arrival_Airport = 'Mumbai (BOM)';
 
 -- Select flights with a duration greater than 120 minutes
 SELECT * FROM Flights WHERE Flight_Duration > 120;
 
 -- Select flights with available seats less than 30
 SELECT * FROM Flights WHERE Seats_Available < 30;
 
 -- Select flights that departed after a specific date
 SELECT * FROM Flights WHERE Departure_Time > '2023-10-01 00:00:00';
 
 -- Select flights with a specific flight number
 SELECT * FROM Flights WHERE Flight_Number = 'AI101';
 
 -- Select flights that are either cancelled or delayed
SELECT * FROM Flights WHERE Status IN ('Cancelled', 'Delayed');

-- Select flights with a flight duration between 90 and 150 minutes
SELECT * FROM Flights WHERE Flight_Duration BETWEEN 90 AND 150;

-- Select flights with more than 50 available seats
SELECT * FROM Flights WHERE Seats_Available > 50;



-- 2. DISTINCT Clause Queries
/*
The DISTINCT clause is used to return unique values from a column by removing duplicates 
in the result set.

Syntax:

SELECT DISTINCT column1  
FROM table_name;  

*/

select * from flights;

-- Select distinct aircraft types used in flights
SELECT DISTINCT Aircraft_Type FROM Flights;

-- Select distinct departure airports
SELECT DISTINCT Departure_Airport FROM Flights;

-- Select distinct arrival airports
SELECT DISTINCT Arrival_Airport FROM Flights;

-- Select distinct flight statuses
SELECT DISTINCT Status FROM Flights;

-- Select distinct flight numbers
SELECT DISTINCT Flight_Number FROM Flights;

-- Select distinct combinations of departure and arrival airports
SELECT DISTINCT Departure_Airport, Arrival_Airport FROM Flights;

-- Select distinct flight durations
SELECT DISTINCT Flight_Duration FROM Flights;

-- Select distinct departure times
SELECT DISTINCT Departure_Time FROM Flights;

-- Select distinct arrival times
SELECT DISTINCT Arrival_Time FROM Flights;

-- Select distinct seat availability counts
SELECT DISTINCT Seats_Available FROM Flights;


-- 3. FROM Clause Queries
/*
The FROM clause specifies the table or tables from which the data is retrieved. 
It is a mandatory part of the SELECT statement and can also be used with joins for 
combining data from multiple tables.

Syntax:

SELECT column1, column2  
FROM table_name; 
*/

-- Select all records from Flights table
SELECT * FROM Flights;

-- Select flight numbers and statuses from Flights table
SELECT Flight_Number, Status FROM Flights;

-- Select departure and arrival airports from Flights table
SELECT Departure_Airport, Arrival_Airport FROM Flights;

-- Select flight ID and duration from Flights table
SELECT Flight_ID, Flight_Duration FROM Flights;

-- Select all columns from Flights table where status is 'On Time'
SELECT * FROM Flights WHERE Status = 'On Time';

-- Select all flights with a specific aircraft type
SELECT * FROM Flights WHERE Aircraft_Type = 'Boeing 737';

-- Select all flights departing after a specific time
SELECT * FROM Flights WHERE Departure_Time > '2023-10-01 12:00:00';

-- Select all flights arriving in a specific city
SELECT * FROM Flights WHERE Arrival_Airport = 'Chennai (MAA)';

-- Select all flights with available seats greater than 40
SELECT * FROM Flights WHERE Seats_Available > 40;

-- Select all flights with a specific flight duration
SELECT * FROM Flights WHERE Flight_Duration = 120;


-- 4. ORDER BY Clause Queries
/*
The ORDER BY clause is used to sort the result set in ascending (ASC) or descending (DESC) order 
based on one or more columns.

Syntax:

SELECT column1, column2  
FROM table_name  
ORDER BY column_name [ASC|DESC];  
*/

-- Select all flights ordered by Departure_Time
SELECT * FROM Flights ORDER BY Departure_Time;

-- Select all flights ordered by Flight_Duration in descending order
SELECT * FROM Flights ORDER BY Flight_Duration DESC;

-- Select all flights ordered by Seats_Available
SELECT * FROM Flights ORDER BY Seats_Available;

-- Select all flights ordered by Status and then by Departure_Time
SELECT * FROM Flights ORDER BY Status, Departure_Time;

SELECT * FROM Flights ORDER BY Arrival_Airport, Departure_Time;

-- Select all flights ordered by Arrival_Airport
SELECT * FROM Flights ORDER BY Arrival_Airport;

-- Select all flights ordered by Flight_Number in descending order
SELECT * FROM Flights ORDER BY Flight_Number DESC;

-- Select all flights ordered by Departure_Airport and then by Flight_Duration
SELECT * FROM Flights ORDER BY Departure_Airport, Flight_Duration;

-- Select all flights ordered by Arrival_Time in descending order
SELECT * FROM Flights ORDER BY Arrival_Time DESC;

-- Select all flights ordered by Flight_ID
SELECT * FROM Flights ORDER BY Flight_ID;

-- Select all flights ordered by Arrival_Time
SELECT * FROM Flights ORDER BY Arrival_Time;


-- 5. GROUP BY Clause Queries
/*
The GROUP BY clause groups rows with the same values into summary rows, 
often used with aggregate functions (e.g., COUNT, SUM, AVG).

Syntax:

SELECT column1, aggregate_function(column2)  
FROM table_name  
GROUP BY column1;
*/

select * from flights;

-- Count flights grouped by status
SELECT Status, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Status;

-- Group flights by Departure_Airport and count them
SELECT Departure_Airport, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Departure_Airport;

-- Group flights by Arrival_Airport and count them
SELECT Arrival_Airport, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Arrival_Airport;

-- Group flights by Aircraft_Type and calculate average duration
SELECT Aircraft_Type, AVG(Flight_Duration) AS AverageDuration FROM Flights GROUP BY Aircraft_Type;

-- Group flights by Flight_Number and count them
SELECT Flight_Number, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Flight_Number;

-- Group flights by Departure_Airport and calculate total available seats
SELECT Departure_Airport, SUM(Seats_Available) AS TotalSeats FROM Flights GROUP BY Departure_Airport;

-- Group flights by Status and calculate maximum duration
SELECT Status, MAX(Flight_Duration) AS MaxDuration FROM Flights GROUP BY Status;

-- Group flights by Arrival_Airport and calculate minimum duration
SELECT Arrival_Airport, MIN(Flight_Duration) AS MinDuration FROM Flights GROUP BY Arrival_Airport;

-- Group flights by Departure_Airport and calculate average available seats
SELECT Departure_Airport, AVG(Seats_Available) AS AverageSeats FROM Flights GROUP BY Departure_Airport;

-- Group flights by Aircraft_Type and count distinct statuses
SELECT Aircraft_Type, COUNT(DISTINCT Status) AS DistinctStatusCount FROM Flights GROUP BY Aircraft_Type;


-- 6. HAVING Clause Queries
/*
The HAVING clause is used to filter grouped data after the GROUP BY clause. 
It works similarly to the WHERE clause but is applied to aggregated results.

Syntax:

SELECT column1, aggregate_function(column2)  
FROM table_name  
GROUP BY column1  
HAVING condition;  
*/
-- Select statuses with more than 5 flights
SELECT Status, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Status HAVING COUNT(*) > 5;

-- Select departure airports with more than 3 flights
SELECT Departure_Airport, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Departure_Airport HAVING COUNT(*) > 3;

-- Select aircraft types with an average flight duration greater than 120 minutes
SELECT Aircraft_Type, AVG(Flight_Duration) AS AverageDuration FROM Flights GROUP BY Aircraft_Type HAVING 
AVG(Flight_Duration) > 120;

-- Select arrival airports with less than 2 flights
SELECT Arrival_Airport, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Arrival_Airport HAVING COUNT(*) < 2;

-- Select statuses with a total of available seats greater than 200
SELECT Status, SUM(Seats_Available) AS TotalSeats FROM Flights GROUP BY Status HAVING SUM(Seats_Available) > 200;

-- Select flight numbers with more than 1 occurrence
SELECT Flight_Number, COUNT(*) AS Occurrences FROM Flights GROUP BY Flight_Number HAVING COUNT(*) > 1;

-- Select departure airports with an average available seat count less than 50
SELECT Departure_Airport, AVG(Seats_Available) AS AverageSeats FROM Flights GROUP BY Departure_Airport 
HAVING AVG(Seats_Available) < 50;

-- Select aircraft types with a maximum flight duration of less than 150 minutes
SELECT Aircraft_Type, MAX(Flight_Duration) AS MaxDuration FROM Flights GROUP BY Aircraft_Type HAVING 
MAX(Flight_Duration) < 150;

-- Select statuses with a count of flights equal to 1
SELECT Status, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Status HAVING COUNT(*) = 1;

-- Select arrival airports with an average flight duration greater than 100 minutes
SELECT Arrival_Airport, AVG(Flight_Duration) AS AverageDuration FROM Flights GROUP BY Arrival_Airport 
HAVING AVG(Flight_Duration) > 100;


-- 7. LIMIT (or FETCH or TOP) Clause

/*

In MySQL, the LIMIT clause is used to restrict the number of rows returned by a query. 
Unlike some other SQL databases (e.g., SQL Server or PostgreSQL) that use TOP or FETCH, 
MySQL exclusively supports LIMIT. 

Syntax for LIMIT

SELECT column1, column2, ...
FROM table_name
LIMIT [offset,] row_count;

Key Components

1. row_count: Specifies the number of rows to return.
2. offset (optional): Specifies the starting point from which rows are returned. If omitted, 
the default is 0 (start from the first row).
3. LIMIT: Used to specify the maximum number of records to return.
4. Using LIMIT with a comma: An alternative way to specify both the offset and the limit in a single clause.
5. ROW_COUNT(): While not directly applicable, you can use SQL_CALC_FOUND_ROWS and FOUND_ROWS() to get the 
total count of rows.

*/

-- Select the first 5 flights
SELECT * FROM Flights LIMIT 5;

SELECT * FROM Flights LIMIT 5 offset 2;

-- Select the first 10 flights ordered by Departure_Time
SELECT * FROM Flights ORDER BY Departure_Time LIMIT 10;

-- Select the last 3 flights based on Flight_ID
SELECT * FROM Flights ORDER BY Flight_ID DESC LIMIT 3;

-- Select the first 7 flights that are delayed
SELECT * FROM Flights WHERE Status = 'Delayed' LIMIT 7;

-- Select the first 5 flights departing from Delhi
SELECT * FROM Flights WHERE Departure_Airport = 'Delhi (DEL)' LIMIT 5;

-- Select the first 10 flights with available seats greater than 50
SELECT * FROM Flights WHERE Seats_Available > 50 LIMIT 10;

-- Select the first 5 flights arriving in Mumbai
SELECT * FROM Flights WHERE Arrival_Airport = 'Mumbai (BOM)' LIMIT 5;

-- Select the first 10 flights with a flight duration greater than 120 minutes
SELECT * FROM Flights WHERE Flight_Duration > 120 LIMIT 10;

-- Select the first 5 flights ordered by Flight_Number
SELECT * FROM Flights ORDER BY Flight_Number LIMIT 5;

-- Select the first 3 flights that departed after a specific date
SELECT * FROM Flights WHERE Departure_Time > '2023-10-01 00:00:00' LIMIT 3;

-- Select 5 flights starting from the 10th record (OFFSET)
SELECT * FROM Flights LIMIT 5 OFFSET 10;

-- Select 10 flights starting from the 20th record
SELECT * FROM Flights LIMIT 10 OFFSET 20;

-- Select 3 flights starting from the 5th record
SELECT * FROM Flights LIMIT 3 OFFSET 5;

-- Select 7 flights starting from the 15th record
SELECT * FROM Flights LIMIT 7 OFFSET 15;

-- Select 4 flights starting from the 0th record (first record)
SELECT * FROM Flights LIMIT 4 OFFSET 0;

-- Select 5 flights starting from the 10th record
SELECT * FROM Flights LIMIT 10, 5;  -- This means skip 10 records and then return the next 5

-- Select 10 flights starting from the 20th record
SELECT * FROM Flights LIMIT 20, 10;  -- Skip 20 records and return the next 10

-- Select 3 flights starting from the 5th record
SELECT * FROM Flights LIMIT 5, 3;  -- Skip 5 records and return the next 3

-- Select 7 flights starting from the 15th record
SELECT * FROM Flights LIMIT 15, 7;  -- Skip 15 records and return the next 7

-- Select 4 flights starting from the 0th record (first record)
SELECT * FROM Flights LIMIT 0, 4;  -- Skip 0 records and return the first 4

-- Get the total number of flights and limit the results
SELECT SQL_CALC_FOUND_ROWS * FROM Flights LIMIT 5; 

SELECT FOUND_ROWS();  -- This will return the total number of rows without the LIMIT


-- 8. JOIN Clause

/*
The JOIN clause is used to combine rows from two or more tables based on a related column.

Syntax:

SELECT columns  
FROM table1  
JOIN table2  
ON table1.common_column = table2.common_column;  

Note - to join 2 or more table their 1 attributes must be common.

INNER JOIN: Returns records that have matching values in both tables.

LEFT JOIN: Returns all records from the left table (Flights) and the matched records from the right 
table (Bookings or Airlines). If there is no match, NULL values are returned for columns from the right table.

RIGHT JOIN: Returns all records from the right table (Bookings) and the matched records from the left table 
(Flights). If there is no match, NULL values are returned for columns from the left table.
*/
-- Join Flights with Bookings to get flight details along with booking information
SELECT f.Flight_ID, f.Flight_Number, b.Booking_ID, b.Booking_Date, b.Number_of_Seats
FROM Flights f
INNER JOIN Bookings b ON f.Flight_ID = b.Flight_ID;

-- Join Flights with Passengers to get flight details along with passenger information
SELECT t1.Flight_ID, t1.Flight_Number, t3.Passenger_ID, t3.First_Name, t3.Last_Name
FROM Flights t1
INNER JOIN Bookings t2 ON t1.Flight_ID = t2.Flight_ID
INNER JOIN Passengers t3 ON t2.Passenger_ID = t3.Passenger_ID;

-- Left join Flights with Bookings to get all flights and their booking status (if any)
SELECT f.Flight_ID, f.Flight_Number, b.Booking_ID, b.Booking_Status
FROM Flights f
LEFT JOIN Bookings b ON f.Flight_ID = b.Flight_ID;

-- Left join Flights with Airlines to get flight details along with airline information
SELECT f.Flight_ID, f.Flight_Number, a.Airline_Name, a.IATA_Code
FROM Flights f
LEFT JOIN Airlines a ON f.Airline_ID = a.Airline_ID;  -- Assuming Airline_ID is added to Flights table

-- Right join Bookings with Flights to get all bookings and their corresponding flight details (if any)
SELECT b.Booking_ID, b.Booking_Date, f.Flight_Number, f.Departure_Airport
FROM Bookings b
RIGHT JOIN Flights f ON b.Flight_ID = f.Flight_ID;


-- 9. UNION Clause

/*
The UNION clause is used to combine the results of two or more SELECT statements. Duplicate rows are 
removed by default.

Syntax:

SELECT column1, column2  
FROM table1  
UNION  
SELECT column1, column2  
FROM table2;  
*/

-- 1. Select Flights from Two Different Departure Airports
SELECT Flight_ID, Flight_Number, Departure_Airport, Arrival_Airport 
FROM Flights 
WHERE Departure_Airport = 'Delhi (DEL)'
UNION
SELECT Flight_ID, Flight_Number, Departure_Airport, Arrival_Airport 
FROM Flights 
WHERE Departure_Airport = 'Mumbai (BOM)';

-- 2. Select All Delayed and Cancelled Flights
SELECT Flight_ID, Flight_Number, Status 
FROM Flights 
WHERE Status = 'Delayed'
UNION
SELECT Flight_ID, Flight_Number, Status 
FROM Flights 
WHERE Status = 'Cancelled';

-- 3. Select Flights with More Than 50 Available Seats
SELECT Flight_ID, Flight_Number, Seats_Available 
FROM Flights 
WHERE Seats_Available > 50
UNION
SELECT Flight_ID, Flight_Number, Seats_Available 
FROM Flights 
WHERE Flight_Duration < 120;  -- Assuming you want to compare with a different condition

-- 4. Select Flights to Chennai and Bangalore
SELECT Flight_ID, Flight_Number, Arrival_Airport 
FROM Flights 
WHERE Arrival_Airport = 'Chennai (MAA)'
UNION
SELECT Flight_ID, Flight_Number, Arrival_Airport 
FROM Flights 
WHERE Arrival_Airport = 'Bangalore (BLR)';

-- 5. Select Flights with Specific Flight Numbers
SELECT Flight_ID, Flight_Number, Departure_Airport 
FROM Flights 
WHERE Flight_Number = 'AI101'
UNION
SELECT Flight_ID, Flight_Number, Departure_Airport 
FROM Flights 
WHERE Flight_Number = 'AI102';

-- 6. Select Flights with a Duration Greater Than 150 Minutes
SELECT Flight_ID, Flight_Number, Flight_Duration 
FROM Flights 
WHERE Flight_Duration > 150
UNION
SELECT Flight_ID, Flight_Number, Flight_Duration 
FROM Flights 
WHERE Status = 'On Time';

-- 7. Select Flights with Arrival in Specific Cities
SELECT Flight_ID, Flight_Number, Arrival_Airport 
FROM Flights 
WHERE Arrival_Airport = 'Hyderabad (HYD)'
UNION
SELECT Flight_ID, Flight_Number, Arrival_Airport 
FROM Flights 
WHERE Arrival_Airport = 'Pune (PNQ)';

-- 8. Select Flights with Specific Statuses
SELECT Flight_ID, Flight_Number, Status 
FROM Flights 
WHERE Status = 'On Time'
UNION
SELECT Flight_ID, Flight_Number, Status 
FROM Flights 
WHERE Status = 'Delayed';

-- 9. Select Flights with Departure After a Specific Time
SELECT Flight_ID, Flight_Number, Departure_Time 
FROM Flights 
WHERE Departure_Time > '2023-10-01 12:00:00'
UNION
SELECT Flight_ID, Flight_Number, Departure_Time 
FROM Flights 
WHERE Departure_Time > '2023-10-01 14:00:00';

-- 10. Select Flights with Different Aircraft Types
SELECT Flight_ID, Flight_Number, Aircraft_Type 
FROM Flights 
WHERE Aircraft_Type = 'Boeing 737'
UNION
SELECT Flight_ID, Flight_Number, Aircraft_Type 
FROM Flights 
WHERE Aircraft_Type = 'Airbus A320';


-- 10. INTO Clause (Mysql does not support into clause directly in this way)
/*
The INTO clause is used to insert query results into a new table or export data.

Syntax:

SELECT columns  
INTO new_table_name  
FROM table_name  
WHERE condition;  
*/

-- Create a new table to store flights with less than 50 available seats
SELECT Flight_Number, Departure_Airport 
INTO New_Flights_Table 
FROM Flights 
WHERE Seats_Available < 50;

-- Create a new table to store details of flights that are delayed
SELECT Flight_ID, Flight_Number, Arrival_Airport 
INTO Delayed_Flights 
FROM Flights 
WHERE Status = 'Delayed';

-- Create a new table for flights that use Boeing 737 aircraft
SELECT Flight_Number, Departure_Airport, Arrival_Airport 
INTO Boeing737_Flights 
FROM Flights 
WHERE Aircraft_Type = 'Boeing 737';

-- Create a new table for flights that have a duration greater than 150 minutes
SELECT Flight_Number, Flight_Duration 
INTO Long_Flights 
FROM Flights 
WHERE Flight_Duration > 150;

-- Create a new table for flights departing from Delhi (DEL)
SELECT Flight_Number, Arrival_Airport 
INTO Delhi_Departures 
FROM Flights 
WHERE Departure_Airport = 'Delhi (DEL)';

-- Create a new table for flights that have no available seats
SELECT Flight_Number, Departure_Airport, Arrival_Airport 
INTO Fully_Booked_Flights 
FROM Flights 
WHERE Seats_Available = 0;

-- Create a new table for flights arriving at either Mumbai (BOM) or Chennai (MAA)
SELECT Flight_Number, Arrival_Airport 
INTO Mumbai_Chennai_Arrivals 
FROM Flights 
WHERE Arrival_Airport IN ('Mumbai (BOM)', 'Chennai (MAA)');

-- Create a new table for flights that have a duration of less than 90 minutes
SELECT Flight_Number, Flight_Duration 
INTO Short_Flights 
FROM Flights 
WHERE Flight_Duration < 90;

-- Create a new table for flights that are currently cancelled
SELECT Flight_Number, Departure_Airport, Arrival_Airport 
INTO Cancelled_Flights 
FROM Flights 
WHERE Status = 'Cancelled';

-- -- Create a new table for flights that depart between 2 PM and 4 PM
SELECT Flight_Number, Departure_Time 
INTO Afternoon_Flights 
FROM Flights 
WHERE Departure_Time BETWEEN '2023-10-01 14:00:00' AND '2023-10-01 16:00:00';


-- 11. CASE Clause
/*
The CASE clause allows conditional logic in SQL queries, similar to an if-else statement.

Syntax:

SELECT column1,  
       CASE  
           WHEN condition1 THEN result1  
           WHEN condition2 THEN result2  
           ELSE result3  
       END AS alias_name  
FROM table_name; 
*/
select * from flights;

-- Select flight numbers and provide a descriptive status message
SELECT Flight_Number, 
       CASE 
           WHEN Status = 'On Time' THEN 'Flight is on schedule' 
           WHEN Status = 'Delayed' THEN 'Flight is delayed' 
           ELSE 'Flight is cancelled' 
       END AS Flight_Status 
FROM Flights;

-- Select flight numbers and categorize them based on duration
SELECT Flight_Number, 
       CASE 
           WHEN Flight_Duration <= 90 THEN 'Short Flight' 
           WHEN Flight_Duration BETWEEN 90 AND 140 THEN 'Medium Flight' 
           ELSE 'Long Flight' 
       END AS Flight_Category 
FROM Flights;

-- Select flight numbers and categorize seat availability
SELECT Flight_Number, 
       CASE 
           WHEN Seats_Available > 50 THEN 'Plenty of Seats Available' 
           WHEN Seats_Available BETWEEN 20 AND 50 THEN 'Limited Seats Available' 
           ELSE 'Almost Full' 
       END AS Seat_Status 
FROM Flights;

-- Select flight numbers and convert flight duration from minutes to hours
SELECT Flight_Number, 
       CASE 
           WHEN Flight_Duration < 60 THEN CONCAT(Flight_Duration, ' minutes') 
           ELSE CONCAT(Flight_Duration / 60, ' hours') 
       END AS Duration 
FROM Flights;

-- Select flight numbers and provide status based on departure time
SELECT Flight_Number, 
       CASE 
           WHEN Departure_Time < NOW() THEN 'Flight has departed' 
           WHEN Departure_Time = NOW() THEN 'Flight is departing now' 
           ELSE 'Flight is scheduled to depart' 
       END AS Departure_Status 
FROM Flights;

-- Select flight numbers and categorize based on aircraft type
SELECT Flight_Number, 
       CASE 
           WHEN Aircraft_Type LIKE 'Boeing%' THEN 'Boeing Aircraft' 
           WHEN Aircraft_Type LIKE 'Airbus%' THEN 'Airbus Aircraft' 
           ELSE 'Other Aircraft' 
       END AS Aircraft_Type_Category 
FROM Flights;

-- Select flight numbers and provide a status message based on flight duration
SELECT Flight_Number, 
       CASE 
           WHEN Flight_Duration < 120 THEN 'Short Trip' 
           WHEN Flight_Duration BETWEEN 120 AND 180 THEN 'Standard Trip' 
           ELSE 'Long Trip' 
       END AS Trip_Length 
FROM Flights;

-- Select flight numbers and provide custom messages based on flight status
SELECT Flight_Number, 
       CASE 
           WHEN Status = 'On Time' THEN 'All systems go!' 
           WHEN Status = 'Delayed' THEN 'Please wait for updates.' 
           WHEN Status = 'Cancelled' THEN 'We apologize for the inconvenience.' 
           ELSE 'Unknown status' 
       END AS Custom_Status_Message 
FROM Flights;

-- Select flight numbers and categorize based on arrival airport
SELECT Flight_Number, 
       CASE 
           WHEN Arrival_Airport = 'Delhi (DEL)' THEN 'Arriving in Capital' 
           WHEN Arrival_Airport = 'Mumbai (BOM)' THEN 'Arriving in Financial Hub' 
           ELSE 'Arriving Elsewhere' 
       END AS Arrival_Category 
FROM Flights;

-- Select flight numbers and provide status based on current time and flight status
SELECT Flight_Number, 
       CASE 
           WHEN Status = 'On Time' AND Departure_Time > NOW() THEN 'On Schedule' 
           WHEN Status = 'Delayed' THEN 'Delayed' 
           WHEN Status = 'Cancelled' THEN 'Cancelled' 
           ELSE 'Flight has already departed' 
       END AS Final_Flight_Status 
FROM Flights;


-- 12. IN Clause
/*
The IN clause is used to filter records based on a list of values.

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE column_name IN (value1, value2, ...);  
*/
-- Select all flights arriving at Mumbai (BOM) or Delhi (DEL)
SELECT * 
FROM Flights 
WHERE Arrival_Airport IN ('Mumbai (BOM)', 'Delhi (DEL)');

-- Select all flights departing from Delhi (DEL), Chennai (MAA), or Bangalore (BLR)
SELECT * 
FROM Flights 
WHERE Departure_Airport IN ('Delhi (DEL)', 'Chennai (MAA)', 'Bangalore (BLR)');

-- Select flights with specific flight numbers AI101, AI102, and AI103
SELECT * 
FROM Flights 
WHERE Flight_Number IN ('AI101', 'AI102', 'AI103');

-- Select all flights that are either Delayed or Cancelled
SELECT * 
FROM Flights 
WHERE Status IN ('Delayed', 'Cancelled');

-- Select flights that use either Boeing 737 or Airbus A320 aircraft
SELECT * 
FROM Flights 
WHERE Aircraft_Type IN ('Boeing 737', 'Airbus A320');

-- Select flights that depart at specific times
SELECT * 
FROM Flights 
WHERE Departure_Time IN ('2023-10-01 06:00:00', '2023-10-01 09:00:00');

-- Select flights that have a duration of either 120 or 150 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration IN (120, 150);

-- Select flights that have either 30 or 50 available seats
SELECT * 
FROM Flights 
WHERE Seats_Available IN (30, 50);

-- Select flights arriving at major cities: Mumbai, Delhi, Kolkata, or Chennai
SELECT * 
FROM Flights 
WHERE Arrival_Airport IN ('Mumbai (BOM)', 'Delhi (DEL)', 'Kolkata (CCU)', 'Chennai (MAA)');

-- Select flights that arrive at specific times
SELECT * 
FROM Flights 
WHERE Arrival_Time IN ('2023-10-01 08:00:00', '2023-10-01 10:30:00');


-- 13. BETWEEN Clause
/*
The BETWEEN clause filters data within a specified range, inclusive of the boundaries.

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE column_name BETWEEN value1 AND value2;  
*/
 -- Select all flights with a duration between 120 and 150 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration BETWEEN 120 AND 150;

-- Select flights that depart between 8 AM and 12 PM on October 1, 2023
SELECT * 
FROM Flights 
WHERE Departure_Time BETWEEN '2023-10-01 08:00:00' AND '2023-10-01 12:00:00';

-- Select flights that arrive between 10 AM and 2 PM on October 1, 2023
SELECT * 
FROM Flights 
WHERE Arrival_Time BETWEEN '2023-10-01 10:00:00' AND '2023-10-01 14:00:00';

-- Select flights that have between 20 and 60 available seats
SELECT * 
FROM Flights 
WHERE Seats_Available BETWEEN 20 AND 60;

-- Select flights with Flight_IDs between 5 and 10
SELECT * 
FROM Flights 
WHERE Flight_ID BETWEEN 5 AND 10;

-- Select flights with a duration less than 90 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration < 90;  -- Using < instead of BETWEEN for clarity

-- Select flights that depart between 12 PM and 6 PM on October 1, 2023
SELECT * 
FROM Flights 
WHERE Departure_Time BETWEEN '2023-10-01 12:00:00' AND '2023-10-01 18:00:00';

-- Select flights that arrive between 6 PM and 10 PM on October 1, 2023
SELECT * 
FROM Flights 
WHERE Arrival_Time BETWEEN '2023-10-01 18:00:00' AND '2023-10-01 22:00:00';

-- Select flights with a duration greater than 180 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration > 180;  -- Using > instead of BETWEEN for clarity

-- Select flights that were scheduled to depart between 1 PM and 3 PM
SELECT * 
FROM Flights 
WHERE Departure_Time BETWEEN '2023-10-01 13:00:00' AND '2023-10-01 15:00:00';


-- 14. LIKE Clause
/*
The LIKE clause is used to search for a specified pattern in a column. Wildcards include % (any number of 
characters) and _ (a single character).

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE column_name LIKE pattern;  
*/
-- Select all flights where the flight number starts with 'AI'
SELECT * 
FROM Flights 
WHERE Flight_Number LIKE 'AI%';

-- Select all flights where the flight number ends with '101'
SELECT * 
FROM Flights 
WHERE Flight_Number LIKE '%101';

-- Select all flights where the flight number contains '10'
SELECT * 
FROM Flights 
WHERE Flight_Number LIKE '%10%';

-- Select all flights departing from airports that have 'Delhi' in their name
SELECT * 
FROM Flights 
WHERE Departure_Airport LIKE '%Delhi%';

-- Select all flights arriving at airports that have 'BOM' in their code
SELECT * 
FROM Flights 
WHERE Arrival_Airport LIKE '%BOM%';

-- Select all flights that use aircraft types starting with 'Airbus'
SELECT * 
FROM Flights 
WHERE Aircraft_Type LIKE 'Airbus%';

-- Select all flights where the status contains the word 'Delayed'
SELECT * 
FROM Flights 
WHERE Status LIKE '%Delayed%';

-- Select all flights where the flight number matches the pattern 'AI1__'
-- (where '_' represents a single character)
SELECT * 
FROM Flights 
WHERE Flight_Number LIKE 'AI1__';

-- Select all flights departing from airports that have 'MAA' in their code
SELECT * 
FROM Flights 
WHERE Departure_Airport LIKE '%MAA%';

-- Select all flights arriving at airports that start with the letter 'K'
SELECT * 
FROM Flights 
WHERE Arrival_Airport LIKE 'K%';



-- 15. EXISTS Clause
/*
The EXISTS clause checks for the existence of rows in a subquery.

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE EXISTS (subquery); 
*/
-- Select all flights where there exists at least one cancelled flight to the same arrival airport
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT *
    FROM Flights 
    WHERE Status = 'Cancelled' AND Arrival_Airport = 'Delhi (DEL)'
);

-- Select all flights where there exists at least one delayed flight from the same departure airport
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Status = 'Delayed' AND Departure_Airport = f.Departure_Airport
);

-- Select all flights where there exists at least one flight to the same destination with available seats
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Arrival_Airport = f.Arrival_Airport AND Seats_Available > 0
);

-- Select all flights where there exists at least one flight departing at the same time
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Departure_Time = f.Departure_Time
);

-- Select all flights where there exists at least one flight using the same aircraft type
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Aircraft_Type = f.Aircraft_Type
);

-- Select all flights where there exists at least one flight arriving at the same airport
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Arrival_Airport = f.Arrival_Airport
);

-- Select all flights where there exists at least one flight scheduled on the same day
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE DATE(Departure_Time) = DATE(f.Departure_Time)
);

-- Select all flights where there exists at least one flight with the same flight number
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Flight_Number = f.Flight_Number
);

-- Select all flights where there exists at least one flight with a similar duration (within 10 minutes)
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE ABS(Flight_Duration - f.Flight_Duration) <= 10
);

-- Select all flights where there exists at least one flight with the same status
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Status = f.Status
);


-- 16. As Clause
/*
The AS clause is used to provide an alias (temporary name) for columns or tables, 
improving query readability.

Syntax:

SELECT column_name AS alias_name  
FROM table_name;    
*/
-- Create a new table with flight details
CREATE TABLE Flight_Summary AS 
SELECT Flight_ID, Flight_Number, Departure_Airport, Arrival_Airport 
FROM Flights;

select * from Flight_Summary;

-- Select flight numbers and give them a custom alias
SELECT Flight_Number AS FlightCode 
FROM Flights;

-- Select flight duration in hours and give it a custom alias
SELECT Flight_Number, Flight_Duration / 60 AS Duration_Hours 
FROM Flights;

-- Select departure and arrival airports with custom aliases
SELECT Departure_Airport AS Departure, Arrival_Airport AS Arrival 
FROM Flights;

-- Select flight status and give it a custom alias
SELECT Flight_Number, Status AS Current_Status 
FROM Flights;

-- Create a new table with average flight duration per departure airport
CREATE TABLE Average_Flight_Duration AS 
SELECT Departure_Airport, AVG(Flight_Duration) AS Average_Duration 
FROM Flights 
GROUP BY Departure_Airport;

-- Select available seats and give it a custom alias
SELECT Flight_Number, Seats_Available AS Available_Seats 
FROM Flights;

-- Select flight ID and aircraft type with custom aliases
SELECT Flight_ID AS ID, Aircraft_Type AS Plane_Type 
FROM Flights;

-- Select flights with custom aliases for departure and arrival times
SELECT Flight_Number, Departure_Time AS Depart_Time, Arrival_Time AS Arrive_Time 
FROM Flights;

-- Create a new table summarizing flight status counts
CREATE TABLE Flight_Status_Summary AS 
SELECT Status AS Flight_Status, COUNT(*) AS Total_Flights 
FROM Flights 
GROUP BY Status;


-- Mysql Alias

/*

In MySQL, an alias is a temporary name assigned to a table or a column for the duration of a query
(within the scope of a query). Aliases are primarily used to enhance the readability and clarity of 
SQL statements, making it easier for users to understand the purpose of the data being retrieved or manipulated.

Key Points about MySQL Aliases:

1. Temporary Nature: 
Aliases exist only for the duration of the query. Once the query execution is complete, 
the alias ceases to exist.

2. Improved Readability: 
By using aliases, you can simplify complex column names or provide more meaningful names 
that better describe the data. This is particularly useful when dealing with long or complicated column names.

Syntax:

For column aliases, the syntax is:

SELECT column_name AS alias_name
FROM table_name;

For table aliases, the syntax is:

SELECT column_name
FROM table_name AS alias_name;

3. Usage in Queries: 
Aliases can be used in various SQL statements, including SELECT, UPDATE, and DELETE. 
They can also be used in conjunction with aggregate functions, joins, and subqueries.

4. No Impact on Database Structure: 
Using an alias does not change the actual table or column names in the database; 
it only affects how they arek referenced in the query.

*/

-- Table Alias
SELECT f.Flight_ID, f.Flight_Number, f.Departure_Airport, f.Arrival_Airport
FROM Flights f;

-- Column Alias
SELECT f.Flight_ID AS ID, f.Flight_Number AS Num, f.Departure_Airport AS Departure, 
f.Arrival_Airport AS Arrival FROM Flights f;

-- Derived Table Alias
SELECT *
FROM (
  SELECT f.Flight_ID, f.Flight_Number, f.Departure_Airport, f.Arrival_Airport
  FROM Flights f
) AS FlightInfo;

-- Filtering with Alias
SELECT f.Flight_ID, f.Flight_Number, f.Departure_Airport, f.Arrival_Airport
FROM Flights f
WHERE f.Departure_Airport = 'Delhi (DEL)';

-- Sorting with Alias
SELECT f.Flight_ID, f.Flight_Number, f.Departure_Airport, f.Arrival_Airport
FROM Flights f
ORDER BY f.Departure_Time;

-- Grouping with Alias
SELECT f.Departure_Airport, COUNT(f.Flight_ID) AS NumFlights
FROM Flights f
GROUP BY f.Departure_Airport;

-- Aggregate Functions with Alias
SELECT f.Departure_Airport, AVG(f.Flight_Duration) AS AvgDuration
FROM Flights f
GROUP BY f.Departure_Airport;

-- Having Clause with Alias
SELECT f.Departure_Airport, AVG(f.Flight_Duration) AS AvgDuration
FROM Flights f
GROUP BY f.Departure_Airport
HAVING AVG(f.Flight_Duration) = 4;

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
