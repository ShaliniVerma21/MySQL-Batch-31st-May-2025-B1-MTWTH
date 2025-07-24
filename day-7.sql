USE airline123; -- Set the context to the airline database
-- Functions 

/*

Functions in MySQL are predefined operations that can be used to perform calculations, manipulate data, 
and retrieve specific information. These functions make it easier to work with strings, numbers, dates, and more. 
Functions--- 1. Built-in functions (sum(),avg(),count()...)    
             2. User defined functions.

They are categorized as follows based on their functionality: 

1. String Functions
These functions are used to manipulate and process string data.

LENGTH(str): Returns the length of a string.

CONCAT(str1, str2, ...): Concatenates two or more strings.

UPPER(str): Converts a string to uppercase.

LOWER(str): Converts a string to lowercase.

SUBSTRING(str, start, length): Returns a substring from a string.


2. Numeric Functions
These functions perform operations on numeric data.

ROUND(number, decimals): Rounds a number to a specified number of decimal places.

FLOOR(number): Returns the largest integer less than or equal to a number.

CEIL(number): Returns the smallest integer greater than or equal to a number.

ABS(number): Returns the absolute value of a number.


3. Date and Time Functions
These functions are used to manipulate and format date and time values.

NOW(): Returns the current date and time.

CURDATE(): Returns the current date.

DATE_FORMAT(date, format): Formats a date according to a specified format.

DATEDIFF(date1, date2): Returns the difference in days between two dates.


4. Aggregate Functions
These functions perform calculations on a set of values and return a single value.

COUNT(expression): Returns the number of rows that match a specified condition.

SUM(column): Returns the sum of a numeric column.

AVG(column): Returns the average value of a numeric column.

MAX(column): Returns the maximum value of a column.

MIN(column): Returns the minimum value of a column.


5. Control Flow Functions
These functions allow for conditional logic in SQL queries.

IF(condition, true_value, false_value): Returns one value if the condition is true and another value 
if it is false.

CASE: Provides a way to perform conditional logic in a more complex manner.


6. Conversion Functions
These functions convert data from one type to another.

CAST(expression AS type): Converts an expression to a specified data type.

CONVERT(expression, type): Similar to CAST, but with different syntax.


7. JSON Functions
These functions are used to work with JSON data types.

JSON_EXTRACT(json_doc, path): Extracts data from a JSON document.

JSON_ARRAYAGG(value): Aggregates values into a JSON array.


8. User -Defined Functions (UDFs)
MySQL allows users to create their own functions for specific tasks.

*/


-- String Functions

-- 1. Convert Flight Numbers to Uppercase
SELECT UPPER(Flight_Number) AS Uppercase_Flight_Number FROM Flights;

-- 2. Convert Departure Airport Names to Lowercase
SELECT LOWER(Departure_Airport) AS Lowercase_Departure_Airport FROM Flights;

-- 3. Concatenate Flight Number and Departure Airport
SELECT CONCAT(Flight_Number, ' - ', Departure_Airport) AS Flight_Info FROM Flights;

-- 4. Get Length of Flight Numbers
SELECT Flight_Number, LENGTH(Flight_Number) AS Flight_Number_Length FROM Flights;

-- 5. Get Length of Departure Airport Names
SELECT Departure_Airport, LENGTH(Departure_Airport) AS Airport_Name_Length FROM Flights;

-- 6. Extract Substring from Flight Number
SELECT Flight_Number, SUBSTRING(Flight_Number, 2, 3) AS Flight_Substring FROM Flights; 
-- Extracts characters from position 3

-- 7. Find Flights with Flight Numbers Starting with 'AI'
SELECT * FROM Flights WHERE Flight_Number LIKE 'AI%';

-- 8. Find Flights with Departure Airports Containing 'Delhi'
SELECT * FROM Flights WHERE Departure_Airport LIKE '%Delhi%';

-- 9. Replace 'Delhi' with 'New Delhi' in Departure Airports
SELECT Flight_Number, REPLACE(Departure_Airport, 'Delhi', 'New Delhi') AS Updated_Departure_Airport FROM Flights;

-- 10. Find Flights with Flight Numbers Ending in '01'
SELECT * FROM Flights WHERE Flight_Number LIKE '%01';

-- 11. Count the Number of Flights with 'Boeing' in Aircraft Type
SELECT COUNT(*) AS Boeing_Flight_Count FROM Flights WHERE Aircraft_Type LIKE '%Boeing%';

-- 12. Find Flights with Arrival Airports Starting with 'M'
SELECT * FROM Flights WHERE Arrival_Airport LIKE 'M%';

-- 13. Get the First Character of Each Flight Number
SELECT Flight_Number, LEFT(Flight_Number, 1) AS First_Character FROM Flights;

-- 14. Get the Last Character of Each Arrival Airport Name
SELECT Arrival_Airport, RIGHT(Arrival_Airport, 2) AS Last_Character FROM Flights;

-- 15. Find Flights with Aircraft Types that are Exactly 10 Characters Long
SELECT * FROM Flights WHERE LENGTH(Aircraft_Type) = 10;

-- 16. Find Flights with Flight Numbers that are Not in Uppercase
SELECT * FROM Flights WHERE BINARY Flight_Number != UPPER(Flight_Number);

-- 17. Find Flights with Departure Airports that are Not in Lowercase
SELECT * FROM Flights WHERE BINARY Departure_Airport != LOWER(Departure_Airport);

-- 18. Concatenate Flight Number, Departure, and Arrival Airports
SELECT CONCAT(Flight_Number, ' from ', Departure_Airport, ' to ', Arrival_Airport) 
AS Full_Flight_Info FROM Flights;

-- 19. Find Flights with Aircraft Types that Contain 'A320'
SELECT * FROM Flights WHERE Aircraft_Type LIKE '%A320%';

-- 20. Get the Position of 'AI' in Flight Numbers
SELECT Flight_Number, LOCATE('AI', Flight_Number) AS Position_of_AI FROM Flights;

-- Numeric Functions

-- 1. Calculate the Average Flight Duration
SELECT AVG(Flight_Duration) AS Average_Flight_Duration FROM Flights;

-- 2. Calculate the Total Number of Seats Available
SELECT SUM(Seats_Available) AS Total_Seats_Available FROM Flights;

-- 3. Find the Longest Flight Duration
SELECT MAX(Flight_Duration) AS Longest_Flight_Duration FROM Flights;

-- 4. Find the Shortest Flight Duration
SELECT MIN(Flight_Duration) AS Shortest_Flight_Duration FROM Flights;

-- 5. Count the Total Number of Flights
SELECT COUNT(*) AS Total_Flights FROM Flights;

-- 6. Calculate the Average Number of Available Seats per Flight
SELECT AVG(Seats_Available) AS Average_Seats_Per_Flight FROM Flights;

-- 7. Find the Total Flight Duration for All Flights
SELECT SUM(Flight_Duration) AS Total_Flight_Duration FROM Flights;

-- 8. Count the Number of Flights with More Than 50 Seats Available
SELECT COUNT(*) AS Flights_With_Over_50_Seats FROM Flights WHERE Seats_Available > 50;

-- 9. Calculate the Average Flight Duration for Flights Departing from Delhi
SELECT AVG(Flight_Duration) AS Average_Flight_Duration_Delhi FROM Flights 
WHERE Departure_Airport = 'Delhi (DEL)';

-- 10. Find the Total Number of Flights to Mumbai
SELECT COUNT(*) AS Total_Flights_To_Mumbai FROM Flights WHERE Arrival_Airport = 'Mumbai (BOM)';

-- 11. Calculate the Percentage of Flights that are On Time
SELECT (COUNT(*) / (SELECT COUNT(*) FROM Flights)) * 100 AS Percentage_On_Time 
FROM Flights WHERE Status = 'On Time';

-- 12. Find the Average Flight Duration for Delayed Flights
SELECT AVG(Flight_Duration) AS Average_Delayed_Flight_Duration FROM Flights WHERE Status = 'Delayed';

-- 13. Count the Number of Flights for Each Aircraft Type
SELECT Aircraft_Type, COUNT(*) AS Flight_Count 
FROM Flights 
GROUP BY Aircraft_Type;

-- 14. Calculate the Total Number of Seats Available for Flights to Chennai
SELECT SUM(Seats_Available) AS Total_Seats_To_Chennai FROM Flights WHERE Arrival_Airport = 'Chennai (MAA)';

-- 15. Find the Average Flight Duration for Flights Arriving in Kolkata
SELECT AVG(Flight_Duration) AS Average_Flight_Duration_Kolkata FROM Flights 
WHERE Arrival_Airport = 'Kolkata (CCU)';

-- 16. Find the Maximum Number of Available Seats on a Single Flight
SELECT MAX(Seats_Available) AS Max_Seats_On_A_Flight FROM Flights;

-- 17. Calculate the Total Number of Flights Departing from Each Airport
SELECT Departure_Airport, COUNT(*) AS Total_Flights 
FROM Flights 
GROUP BY Departure_Airport;

-- 18. Find the Average Number of Seats Available for Flights that are Cancelled
SELECT AVG(Seats_Available) AS Average_Seats_Cancelled FROM Flights WHERE Status = 'Cancelled';

-- 19. Calculate the Total Flight Duration for Flights with Status 'On Time'
SELECT SUM(Flight_Duration) AS Total_On_Time_Flight_Duration FROM Flights WHERE Status = 'On Time';

-- 20. Count the Number of Flights with a Duration Greater Than 180 Minutes
SELECT COUNT(*) AS Flights_Over_3_Hours FROM Flights WHERE Flight_Duration > 180;

-- Date and Time Functions

-- Extracts the date from the departure time
SELECT DATE(Departure_Time) AS Departure_Date FROM Flights; 

-- Extracts the time from the departure time
SELECT TIME(Departure_Time) AS Departure_Time FROM Flights; 

-- Calculates the flight duration in minutes
SELECT TIMESTAMPDIFF(MINUTE, Departure_Time, Arrival_Time) AS Flight_Duration_Minutes FROM Flights; 
SELECT TIMESTAMPDIFF(HOUR, Departure_Time, Arrival_Time) AS Flight_Duration_hours FROM Flights; 
SELECT TIMESTAMPDIFF(SECOND, Departure_Time, Arrival_Time) AS Flight_Duration_second FROM Flights; 

-- Calculates the flight duration in date
SELECT TIMESTAMPDIFF(MONTH, Departure_Time, Arrival_Time) AS Flight_Duration_month FROM Flights; 
SELECT TIMESTAMPDIFF(DAY, Departure_Time, Arrival_Time) AS Flight_Duration_day FROM Flights; 
SELECT TIMESTAMPDIFF(YEAR, Departure_Time, Arrival_Time) AS Flight_Duration_year FROM Flights; 

-- Aggregate Functions

-- 1. Count the Total Number of Flight
SELECT COUNT(*) AS Total_Flights FROM Flights;

-- 2. Count the Number of Unique Departure Airports
SELECT COUNT(DISTINCT Departure_Airport) AS Unique_Departure_Airports FROM Flights;

-- 3. Concatenate Distinct Flight Numbers
SELECT GROUP_CONCAT(DISTINCT Flight_Number) AS Flight_Numbers FROM Flights;

-- 4. Count the Number of Flights by Status
SELECT Status, COUNT(*) AS Flight_Count 
FROM Flights 
GROUP BY Status;

-- 5. Calculate the Average Number of Seats Available Across All Flights
SELECT AVG(Seats_Available) AS Average_Seats_Available FROM Flights;

-- 6. Find the Maximum Flight Duration
SELECT MAX(Flight_Duration) AS Longest_Flight_Duration FROM Flights;

-- 7. Find the Minimum Flight Duration
SELECT MIN(Flight_Duration) AS Shortest_Flight_Duration FROM Flights;

-- 8. Calculate the Total Number of Available Seats Across All Flights
SELECT SUM(Seats_Available) AS Total_Seats_Available FROM Flights;

-- 9. Count the Number of Flights for Each Arrival Airport
SELECT Arrival_Airport, COUNT(*) AS Total_Flights 
FROM Flights 
GROUP BY Arrival_Airport;

-- 10. Calculate the Average Flight Duration for All Flights
SELECT AVG(Flight_Duration) AS Average_Flight_Duration FROM Flights;

-- 11. Count the Number of Flights Departing from Each Airport
SELECT Departure_Airport, COUNT(*) AS Total_Flights 
FROM Flights 
GROUP BY Departure_Airport;

-- 12. Find the Total Flight Duration for All Flights
SELECT SUM(Flight_Duration) AS Total_Flight_Duration FROM Flights;

-- 13. Count the Number of Flights with More Than 100 Seats Available
SELECT COUNT(*) AS Flights_With_Over_100_Seats FROM Flights WHERE Seats_Available > 100;

-- 14. Calculate the Average Flight Duration for Flights Departing from Delhi
SELECT AVG(Flight_Duration) AS Average_Flight_Duration_Delhi FROM Flights 
WHERE Departure_Airport = 'Delhi (DEL)';

-- 15. Count the Number of Unique Aircraft Types
SELECT COUNT(DISTINCT Aircraft_Type) AS Unique_Aircraft_Types FROM Flights;

-- 16. Find the Total Number of Flights for Each Aircraft Type
SELECT Aircraft_Type, COUNT(*) AS Total_Flights 
FROM Flights 
GROUP BY Aircraft_Type;

-- 17. Calculate the Average Number of Seats Available for Flights that are Cancelled
SELECT AVG(Seats_Available) AS Average_Seats_Cancelled FROM Flights WHERE Status = 'Cancelled';

-- 18. Find the Total Number of Flights for Each Day
SELECT DATE(Departure_Time) AS Flight_Date, COUNT(*) AS Total_Flights 
FROM Flights 
GROUP BY Flight_Date;

-- 19. Calculate the Total Flight Duration for Flights with Status 'On Time'
SELECT SUM(Flight_Duration) AS Total_On_Time_Flight_Duration FROM Flights WHERE Status = 'On Time';

-- 20. Count the Number of Flights with a Duration Greater Than 180 Minutes
SELECT COUNT(*) AS Flights_Over_3_Hours FROM Flights WHERE Flight_Duration > 180;


-- Control Flow Functions

-- Classifies flights as long haul or short haul based on duration
SELECT IF(Flight_Duration > 120, 'Long Haul', 'Short Haul') AS Flight_Type FROM Flights; 

-- Classifies flights as long haul or short haul based on duration using a case statement
SELECT 
CASE 
WHEN Flight_Duration > 120 THEN 'Long Haul' 
WHEN Flight_Duration <= 120 THEN 'Short Haul' 
END 
AS Flight_Type FROM Flights; 

-- other queries

CREATE TABLE Flights_Backup (
  Flight_ID int PRIMARY KEY,
  Flight_Number varchar(10) NOT NULL,
  Departure_Airport varchar(100) NOT NULL,
  Arrival_Airport varchar(100) NOT NULL,
  Departure_Time datetime NOT NULL,
  Arrival_Time datetime NOT NULL,
  Flight_Duration int NOT NULL,
  Seats_Available int NOT NULL,
  Aircraft_type varchar(20),
  status varchar(20)
);
drop table Flights_backup;
-- copy table data
INSERT INTO Flights_Backup SELECT * FROM Flights;

select * from Flights_Backup;



 

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

 
