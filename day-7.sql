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
