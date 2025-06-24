-- Single line Comment

/* 
Multi 
Line 
Comment
*/

-- database related queries --
 
create database Travelagent21;

use Travelagent21;

drop database travelagent21;



-- ----------------------------------- Topics of the Day-------------------------

-- Data Types, Constraints, Clauses & Cammands

/*
Reference - 

1. Daily Sessions, Google Classroom
2. discuss your doubts/ideas/daily work with Batchmates -------> Ask with your mentor
3. Github, w3 school
4. Chatgpt, blackbox.ai
5. canva, 15 minuts revision in morning & 15 minuts revision at night before sleep.
*/

-- Data types

/*

The data type of a column in a MySQL database tells us what kind of values that column can hold, 
such as:
-- Integer (whole numbers)
-- Character (text)
-- Date and Time (dates and times)
-- Binary (raw data)
-- Enum (a list of allowed values)
-- Set (a list of allowed values)
-- Time (time of day)
-- Timestamp (date and time)
-- Year (year)
-- Float (decimal values)
-- Double (decimal values)
-- Decimal (decimal values)

Every column in a database table must have a name and a data type.
When creating a table, an SQL developer needs to choose the right data type for each column. 
This helps MySQL know what kind of data to expect and how to work with it.

Datatypes defines the type & size of data to be stored in an attribute. as- id int (1,2,3,...)
In MySQL, there are three main categories of data types:

String: For text values (e.g., names, descriptions).
Numeric: For numbers (e.g., ages, prices).
Date and Time: For dates and times (e.g., birthdays, timestamps).

Note- Choosing the correct data type is important for ensuring data accuracy and efficient storage.

*/

-- Constraints 
/*
In MySQL, constraints are rules applied to columns in a database table to enforce data integrity and 
ensure the accuracy and reliability of the data stored in the database. Constraints help maintain the 
quality of the data by restricting the types of data that can be entered into a table and by defining 
relationships between tables.


Types of Constraints in MySQL

1. NOT NULL

Ensures that a column cannot have a NULL value.

Example:

CREATE TABLE Students (
    ID INT NOT NULL,
    Name VARCHAR(50) NOT NULL
);

2.UNIQUE

Ensures that all values in a column are unique.
Example:

CREATE TABLE Employees (
    Email VARCHAR(100) UNIQUE
);

3. PRIMARY KEY

Uniquely identifies each record in a table.
Combines NOT NULL and UNIQUE constraints.

Example:

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ProductName VARCHAR(50)
);

4. FOREIGN KEY

Ensures referential integrity between two tables.
A column in one table refers to the primary key of another table.

Example:

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

5. CHECK

Ensures that all values in a column satisfy a specific condition.

Example:

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Price DECIMAL(10, 2) CHECK (Price > 0)
);

6. DEFAULT

Assigns a default value to a column if no value is specified.

Example:

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Status VARCHAR(20) DEFAULT 'Active'
);

7. AUTO_INCREMENT

Automatically generates a unique value for a column whenever a new record is inserted.

Example:

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(50)
);


8. INDEX

Improves the performance of queries by creating an index on specified columns.
While not a direct constraint, it enforces rules like uniqueness when combined with UNIQUE.

Example:

CREATE UNIQUE INDEX idx_email ON Employees(Email);

Benefits of Using Constraints

Data Integrity: Ensures valid and consistent data.
Error Prevention: Avoids accidental insertion of invalid or duplicate data.
Relational Consistency: Maintains proper relationships between tables.
Constraints are essential tools for maintaining a well-structured and reliable database system.
*/


 /*
 In MySQL, commands are instructions that you use to interact with the database. 
 They allow you to perform various operations such as creating databases and tables, 
 inserting and updating data, querying data, and managing user permissions. 
 MySQL commands can be categorized into several types based on their functionality:

DDL(Data Definition Language): Defines database structures (CREATE, ALTER, DROP, TRUNCATE).
DML(Data Manipulation Language): Manipulates data (INSERT, UPDATE, DELETE).
DQL(Data Query Language): Queries data (SELECT).
DCL(Data Control Language): Controls access (GRANT, REVOKE).
TCL(Transaction Control Language): Manages transactions (COMMIT, ROLLBACK, SAVEPOINT).

*/


/*
Clauses are components of a SQL statement that specify the actions to be performed on 
the data in a database. Each clause serves a specific purpose and helps to define the 
structure and behavior of the SQL query. Clauses can be combined to create complex 
queries that retrieve, manipulate, or manage data.

the main clauses in MySQL include:
SELECT: Retrieves data from a database table.
FROM: Specifies the table(s) to retrieve data from.
WHERE: Filters data based on conditions.
GROUP BY: Groups data based on one or more columns.
HAVING: Filters grouped data based on conditions.
ORDER BY: Sorts data in ascending or descending order.
LIMIT: Limits the number of rows returned.

*/

/*
Clauses Vs Cammands --

Commands: 
These are the main instructions you use to interact with the database 
(e.g., SELECT, INSERT, UPDATE, DELETE, CREATE, etc.). They perform specific actions on the database.

Clauses: 
These are parts of SQL statements that provide additional details or conditions to the commands 
(e.g., WHERE, ORDER BY, GROUP BY, etc.). They help refine the command's operation.

Select * from students where name = 'Kavya';

In essence, commands are the actions you want to perform, while clauses are the conditions 
or modifications that help define how those actions should be executed. Understanding both is crucial 
for effective database management and querying.
 
*/

 
 -- Types of Clauses
 /*
 
 1. WHERE Clause
The WHERE clause is used to filter records in a table based on specific conditions. 
It is typically used with SELECT, UPDATE, and DELETE statements.

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE condition;  

2. DISTINCT Clause
The DISTINCT clause is used to return unique values from a column by removing duplicates 
in the result set.

Syntax:

SELECT DISTINCT column1  
FROM table_name;  

3. FROM Clause
The FROM clause specifies the table or tables from which the data is retrieved. 
It is a mandatory part of the SELECT statement and can also be used with joins for 
combining data from multiple tables.

Syntax:

SELECT column1, column2  
FROM table_name; 

4. ORDER BY Clause
The ORDER BY clause is used to sort the result set in ascending (ASC) or descending (DESC) order 
based on one or more columns.

Syntax:

SELECT column1, column2  
FROM table_name  
ORDER BY column_name [ASC|DESC];  

5. GROUP BY Clause
The GROUP BY clause groups rows with the same values into summary rows, 
often used with aggregate functions (e.g., COUNT, SUM, AVG).

Syntax:

SELECT column1, aggregate_function(column2)  
FROM table_name  
GROUP BY column1;

6. HAVING Clause
The HAVING clause is used to filter grouped data after the GROUP BY clause. 
It works similarly to the WHERE clause but is applied to aggregated results.

Syntax:

SELECT column1, aggregate_function(column2)  
FROM table_name  
GROUP BY column1  
HAVING condition;  

7. LIMIT (or FETCH or TOP) Clause
The LIMIT clause is used to restrict the number of rows returned by a query. 
Different databases may use variations like FETCH or TOP.

Syntax (MySQL):

SELECT column1, column2  
FROM table_name  
LIMIT number_of_rows;  

8. JOIN Clause
The JOIN clause is used to combine rows from two or more tables based on a related column.

Syntax:

SELECT columns  
FROM table1  
JOIN table2  
ON table1.common_column = table2.common_column;  

9. UNION Clause
The UNION clause is used to combine the results of two or more SELECT statements. 
Duplicate rows are removed by default.

Syntax:

SELECT column1, column2  
FROM table1  
UNION  
SELECT column1, column2  
FROM table2;  

10.INTO Clause
The INTO clause is used to insert query results into a new table or export data.

Syntax:

SELECT columns  
INTO new_table_name  
FROM table_name  
WHERE condition;  

11.CASE Clause
The CASE clause allows conditional logic in SQL queries, similar to an if-else statement.

Syntax:

SELECT column1,  
       CASE  
           WHEN condition1 THEN result1  
           WHEN condition2 THEN result2  
           ELSE result3  
       END AS alias_name  
FROM table_name; 

12. IN Clause
The IN clause is used to filter records based on a list of values.

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE column_name IN (value1, value2, ...);  

13. BETWEEN Clause
The BETWEEN clause filters data within a specified range, inclusive of the boundaries.

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE column_name BETWEEN value1 AND value2;  

14. LIKE Clause
The LIKE clause is used to search for a specified pattern in a column. Wildcards include % (any number of 
characters) and _ (a single character).

example-  Develearn
1. (Start with)  Dev%
2. (End with)  %earn
3. (contain with) %le%

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE column_name LIKE pattern;  

15. EXISTS Clause
The EXISTS clause checks for the existence of rows in a subquery.

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE EXISTS (subquery); 

16. AS Clause
The AS clause is used to provide an alias (temporary name) for columns or tables, 
improving query readability.

Syntax:

SELECT column_name AS alias_name  
FROM table_name;    
 
 */


/*
SELECT Query : 

The SELECT statement is used to retrieve data from a database table. 
It allows you to specify the columns you want to fetch and apply conditions to filter the results.

Syntax-

SELECT column1, column2, ...  
FROM table_name  
WHERE condition;  
*/

-- ------------------------------------Table Queries --------------------------------------

-- Data Definition Language (DDL) {Create,Alter,Drop,Truncate,Rename}
-- Data Manipulation Language (DML) {Insert, Update, Delete}
-- Data Query Language (DQL) {select query}
-- Comment

create database travelagent21;

use travelagent21;

-- Table-1
-- Create the countries table
CREATE TABLE countries (
  -- Unique identifier for each country
  id INT PRIMARY KEY AUTO_INCREMENT, 
  -- Name of the country
  name VARCHAR(50) NOT NULL UNIQUE,
  -- Description of the country
  description TEXT,
  -- Capital city of the country
  capital_city VARCHAR(50) NOT NULL,
  -- Currency of the country
  currency VARCHAR(20) NOT NULL
);

-- Insert records into the countries table
INSERT INTO countries (name, description, capital_city, currency) VALUES
('United States', 'A country in North America known for its diverse culture and economy.', 'Washington, D.C.',
 'USD'),
('Canada', 'A country in North America known for its natural beauty and multicultural society.', 'Ottawa', 'CAD'),
('United Kingdom', 'A country in Europe consisting of England, Scotland, Wales, and Northern Ireland.', 'London',
 'GBP'),
('Australia', 'A country and continent surrounded by the Indian and Pacific oceans.', 'Canberra', 'AUD'),
('Germany', 'A country in Central Europe known for its history, culture, and engineering.', 'Berlin', 'EUR'),
('France', 'A country in Western Europe known for its art, fashion, and cuisine.', 'Paris', 'EUR'),
('Japan', 'An island country in East Asia known for its technology and traditional culture.', 'Tokyo', 'JPY'),
('India', 'A country in South Asia known for its rich history and diverse culture.', 'New Delhi', 'INR'),
('Brazil', 'The largest country in South America known for its Amazon rainforest and carnival festival.', 
'Brasília', 'BRL'),
('South Africa', 'A country at the southern tip of Africa known for its varied topography and cultural diversity.',
 'Pretoria', 'ZAR');

-- Select queries

-- 1. Select All Columns from the Countries Table
SELECT * FROM countries;

-- 2. Select Specific Columns
SELECT name, capital_city FROM countries;

-- 3. Select a Country by Name
SELECT * FROM countries WHERE name = 'India';

-- 4. Select Countries with a Specific Currency
SELECT * FROM countries WHERE currency = 'EUR';

-- 5. Count the Number of Countries
SELECT COUNT(*) AS total_countries FROM countries;

-- 6. Select Countries with a Description Containing a Specific Word
SELECT * FROM countries WHERE description LIKE '%culture%';

-- 7. Select Countries Ordered by Name
SELECT * FROM countries ORDER BY name;

-- 8. Select Countries with a Capital City Starting with 'B'
SELECT * FROM countries WHERE capital_city LIKE 'B%';

-- 9. Select Countries with More than 50 Characters in Description
SELECT * FROM countries WHERE CHAR_LENGTH(description) > 50;

-- 10. Select the First 5 Countries
SELECT * FROM countries LIMIT 5;

-- 11. Select Countries with a Currency Name Longer than 3 Characters
SELECT * FROM countries WHERE CHAR_LENGTH(currency) > 3;

-- 12. Select Countries with a Description that Does Not Contain 'country'
SELECT * FROM countries WHERE description NOT LIKE '%country%';

-- 13. Select the Country with the Longest Name
SELECT * FROM countries ORDER BY CHAR_LENGTH(name) DESC LIMIT 1;

-- 14. Select Countries with a Description Containing 'known'
SELECT * FROM countries WHERE description LIKE '%known%';

-- 15. Select Countries with a Capital City that is Not 'Ottawa'
SELECT * FROM countries WHERE capital_city != 'Ottawa';

-- 16. Select the Total Number of Unique Currencies
SELECT COUNT(DISTINCT currency) AS unique_currencies FROM countries;

-- 17. Select Countries with Names that Have More than 6 Characters
SELECT * FROM countries WHERE CHAR_LENGTH(name) > 6;

-- 18. Select Countries Ordered by Currency
SELECT * FROM countries ORDER BY currency;

-- 19. Select Countries with a Description that is Not NULL
SELECT * FROM countries WHERE description IS NOT NULL;

-- 20. Select Countries with a Capital City Containing 'a'
SELECT * FROM countries WHERE capital_city LIKE '%a%';






-- Create the cities table
CREATE TABLE cities (
  -- Unique identifier for each city
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Name of the city
  name VARCHAR(50) NOT NULL,
  -- Description of the city
  description TEXT,
  -- Country ID of the city
  country_id INT NOT NULL,
  -- Foreign key constraint to link cities to countries
  FOREIGN KEY (country_id) REFERENCES countries(id)
);

-- Insert records into the cities table for Indian cities
INSERT INTO cities (name, description, country_id) VALUES
('Mumbai', 'The financial capital of India, known for its bustling city life and Bollywood film industry.', 8),  -- India
('Delhi', 'The capital city of India, known for its historical landmarks and vibrant culture.', 8),  -- India
('Bengaluru', 'Known as the Silicon Valley of India, famous for its IT industry and pleasant climate.', 8),  -- India
('Chennai', 'A major cultural and economic center in South India, known for its classical music and dance.', 8),  -- India
('Kolkata', 'Known for its rich cultural heritage and historical significance, formerly known as Calcutta.', 8),  -- India
('Hyderabad', 'Famous for its historical sites and as a major center for the technology industry.', 8),  -- India
('Ahmedabad', 'Known for its rich history and as a major economic hub in Gujarat.', 8),  -- India
('Pune', 'Known for its educational institutions and as a growing IT hub.', 8),  -- India
('Jaipur', 'The capital city of Rajasthan, known for its historic palaces and vibrant culture.', 8),  -- India
('Varanasi', 'One of the oldest cities in the world, known for its spiritual significance and ghats along the Ganges.', 8);  -- India

-- Create the airports table
CREATE TABLE airports (
  -- Unique identifier for each airport
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Name of the airport
  name VARCHAR(50) NOT NULL,
  -- Description of the airport
  description TEXT,
  -- City ID of the airport
  city_id INT NOT NULL,
  -- Foreign key constraint to link airports to cities
  FOREIGN KEY (city_id) REFERENCES cities(id)
);

-- Insert records into the airports table for Indian airports
INSERT INTO airports (name, description, city_id) VALUES
('Chhatrapati Shivaji Maharaj International Airport', 'The main international airport serving Mumbai, 
known for its modern facilities.', 1),  -- Mumbai
('Indira Gandhi International Airport', 'The primary airport serving Delhi, 
one of the busiest airports in India.', 2),  -- Delhi
('Kempegowda International Airport', 'An international airport serving Bengaluru, 
known for its efficient services.', 3),  -- Bengaluru
('Chennai International Airport', 'The main airport serving Chennai, 
known for its domestic and international flights.', 4),  -- Chennai
('Netaji Subhas Chandra Bose International Airport', 'The main airport serving Kolkata, 
known for its historical significance.', 5),  -- Kolkata
('Rajiv Gandhi International Airport', 'An international airport serving Hyderabad, 
known for its modern infrastructure.', 6),  -- Hyderabad
('Sardar Vallabhbhai Patel International Airport', 'The main airport serving Ahmedabad, 
known for its growing passenger traffic.', 7),  -- Ahmedabad
('Pune International Airport', 'An airport serving Pune, 
known for its proximity to the IT hubs.', 8),  -- Pune
('Jaipur International Airport', 'The main airport serving Jaipur, 
known for its beautiful architecture.', 9),  -- Jaipur
('Lal Bahadur Shastri International Airport', 'An airport serving Varanasi, 
known for its cultural significance.', 10);  -- Varanasi


-- Create the airlines table
CREATE TABLE airlines (
  -- Unique identifier for each airline
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Name of the airline
  name VARCHAR(50) NOT NULL UNIQUE,
  -- Description of the airline
  description TEXT,
  -- Country ID of the airline
  country_id INT NOT NULL,
  -- Foreign key constraint to link airlines to countries
  FOREIGN KEY (country_id) REFERENCES countries(id)
);

-- Insert records into the airlines table for Indian airlines
INSERT INTO airlines (name, description, country_id) VALUES
('IndiGo', 'A low-cost airline based in India, known for its punctuality and extensive domestic network.', 8),  -- India
('Air India', 'The flag carrier airline of India, offering both domestic and international flights.', 8),  -- India
('SpiceJet', 'A low-cost airline that provides domestic and international services.', 8),  -- India
('GoAir', 'A low-cost airline that operates domestic flights and some international routes.', 8),  -- India
('Vistara', 'A full-service airline that is a joint venture between Tata Sons and Singapore Airlines.', 8),  -- India
('AirAsia India', 'A low-cost airline that is a subsidiary of AirAsia, offering domestic flights.', 8),  -- India
('Jet Airways', 'A major airline that operated domestic and international flights, now in the process of revival.', 8),  -- India
('Alliance Air', 'A regional airline that operates domestic flights, a subsidiary of Air India.', 8),  -- India
('Air India Express', 'A low-cost airline that operates international flights to the Middle East and Southeast Asia.', 8),  -- India
('Zoom Air', 'A regional airline that operates domestic flights in India.', 8);  -- India

-- Create the flights table
CREATE TABLE flights (
  -- Unique identifier for each flight
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Airline ID of the flight
  airline_id INT NOT NULL,
  -- Departure airport ID of the flight
  departure_airport_id INT NOT NULL,
  -- Arrival airport ID of the flight
  arrival_airport_id INT NOT NULL,
  -- Departure date of the flight
  departure_date DATE NOT NULL,
  -- Departure time of the flight
  departure_time TIME NOT NULL,
  -- Arrival date of the flight
  arrival_date DATE NOT NULL,
  -- Arrival time of the flight
  arrival_time TIME NOT NULL,
  -- Foreign key constraint to link flights to airlines
  FOREIGN KEY (airline_id) REFERENCES airlines(id),
  -- Foreign key constraint to link flights to departure airports
  FOREIGN KEY (departure_airport_id) REFERENCES airports(id),
  -- Foreign key constraint to link flights to arrival airports
  FOREIGN KEY (arrival_airport_id) REFERENCES airports(id)
);

-- Insert records into the flights table
INSERT INTO flights (airline_id, departure_airport_id, arrival_airport_id, departure_date, departure_time, arrival_date, arrival_time) VALUES
(1, 1, 2, '2023-10-01', '10:00:00', '2023-10-01', '12:00:00'),  -- IndiGo: Mumbai to Delhi
(2, 2, 3, '2023-10-02', '15:30:00', '2023-10-02', '17:30:00'),  -- Air India: Delhi to Bengaluru
(3, 3, 4, '2023-10-03', '08:15:00', '2023-10-03', '10:15:00'),  -- SpiceJet: Bengaluru to Chennai
(4, 4, 5, '2023-10-04', '14:45:00', '2023-10-04', '16:45:00'),  -- GoAir: Chennai to Kolkata
(5, 5, 1, '2023-10-05', '09:00:00', '2023-10-05', '11:00:00'),  -- Vistara: Kolkata to Mumbai
(1, 2, 4, '2023-10-06', '11:30:00', '2023-10-06', '13:30:00'),  -- IndiGo: Delhi to Chennai
(2, 3, 1, '2023-10-07', '16:00:00', '2023-10-07', '18:00:00'),  -- Air India: Bengaluru to Mumbai
(3, 5, 2, '2023-10-08', '07:45:00', '2023-10-08', '09:45:00'),  -- SpiceJet: Kolkata to Delhi
(4, 1, 3, '2023-10-09', '13:15:00', '2023-10-09', '15:15:00'),  -- GoAir: Mumbai to Bengaluru
(5, 2, 5, '2023-10-10', '18:30:00', '2023-10-10', '20:30:00');  -- Vistara: Delhi to Kolkata


-- Create the hotels table
CREATE TABLE hotels (
  -- Unique identifier for each hotel
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Name of the hotel
  name VARCHAR(50) NOT NULL,
  -- Description of the hotel
  description TEXT,
  -- City ID of the hotel
  city_id INT NOT NULL,
  -- Foreign key constraint to link hotels to cities
  FOREIGN KEY (city_id) REFERENCES cities(id)
);

-- Insert records into the hotels table for Indian hotels
INSERT INTO hotels (name, description, city_id) VALUES
('Taj Mahal Palace', 'A luxury hotel in Mumbai, known for its iconic architecture and rich history.', 1),  -- Mumbai
('The Oberoi', 'A luxury hotel in Delhi, offering world-class amenities and services.', 2),  -- Delhi
('The Leela Palace', 'A five-star hotel in Bengaluru, known for its opulence and hospitality.', 3),  -- Bengaluru
('ITC Grand Chola', 'A luxury hotel in Chennai, known for its grand architecture and fine dining.', 4),  -- Chennai
('The Westin Kolkata Rajarhat', 'A luxury hotel in Kolkata, offering modern amenities and comfort.', 5),  -- Kolkata
('Hyatt Hyderabad Gachibowli', 'A luxury hotel in Hyderabad, known for its contemporary design and services.', 6),  -- Hyderabad
('Radisson Blu', 'A premium hotel in Ahmedabad, offering comfortable accommodations and dining options.', 7),  -- Ahmedabad
('JW Marriott Pune', 'A luxury hotel in Pune, known for its elegant design and exceptional service.', 8),  -- Pune
('Rambagh Palace', 'A heritage hotel in Jaipur, known for its royal architecture and rich history.', 9),  -- Jaipur
('BrijRama Palace', 'A heritage hotel in Varanasi, located on the banks of the Ganges with historical significance.', 10);  -- Varanasi

-- Create the packages table
CREATE TABLE packages (
  -- Unique identifier for each package
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Name of the package
  name VARCHAR(50) NOT NULL,
  -- Description of the package
  description TEXT,
  -- Price of the package
  price DECIMAL(10, 2) NOT NULL,
  -- Duration of the package
  duration INT NOT NULL,
  -- Foreign key constraint to link packages to hotels
  hotel_id INT NOT NULL,
  -- Foreign key constraint to link packages to flights
  flight_id INT NOT NULL,
  -- Foreign key constraint to link packages to hotels
  FOREIGN KEY (hotel_id) REFERENCES hotels(id),
  -- Foreign key constraint to link packages to flights
  FOREIGN KEY (flight_id) REFERENCES flights(id)
);

-- Insert records into the packages table
INSERT INTO packages (name, description, price, duration, hotel_id, flight_id) VALUES
('Mumbai to Delhi Getaway', 'Enjoy a luxurious stay at Taj Mahal Palace with a round trip flight to Delhi.', 15000.00, 3, 1, 1),  -- Package 1
('Delhi Business Trip', 'Stay at The Oberoi with a flight to Bengaluru for your business meetings.', 20000.00, 2, 2, 2),  -- Package 2
('Bengaluru Relaxation Package', 'Relax at The Leela Palace with a flight to Chennai.', 18000.00, 4, 3, 3),  -- Package 3
('Chennai Cultural Experience', 'Experience the culture of Chennai with a stay at ITC Grand Chola and a flight to Kolkata.', 22000.00, 5, 4, 4),  -- Package 4
('Kolkata Heritage Tour', 'Stay at The Westin Kolkata Rajarhat and enjoy a flight back to Mumbai.', 16000.00, 3, 5, 5),  -- Package 5
('Delhi to Bengaluru Adventure', 'Explore Bengaluru with a stay at a luxury hotel and a flight from Delhi.', 19000.00, 4, 2, 2),  -- Package 6
('Chennai to Kolkata Package', 'Enjoy a cultural trip from Chennai to Kolkata with a stay at a premium hotel.', 17000.00, 3, 4, 4),  -- Package 7
('Mumbai to Jaipur Getaway', 'Experience the royal heritage of Jaipur with a flight from Mumbai.', 25000.00, 5, 9, 1);  -- Package 8

-- Create the customers table
CREATE TABLE customers (
  -- Unique identifier for each customer
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- First name of the customer
  first_name VARCHAR(50) NOT NULL,
  -- Last name of the customer
  last_name VARCHAR(50) NOT NULL,
  -- Email address of the customer
  email VARCHAR(100) NOT NULL UNIQUE,
  -- Phone number of the customer
  phone VARCHAR(20) NOT NULL,
  -- Address of the customer
  address VARCHAR(100) NOT NULL
);

-- Insert records into the customers table with Indian values
INSERT INTO customers (first_name, last_name, email, phone, address) VALUES
('Aarav', 'Sharma', 'aarav.sharma@example.com', '9876543210', '123 MG Road, Mumbai, Maharashtra'),  -- Customer 1
('Vivaan', 'Patel', 'vivaan.patel@example.com', '8765432109', '456 Sardar Patel Nagar, Ahmedabad, Gujarat'),  -- Customer 2
('Aditya', 'Verma', 'aditya.verma@example.com', '7654321098', '789 Brigade Road, Bengaluru, Karnataka'),  -- Customer 3
('Anaya', 'Iyer', 'anaya.iyer@example.com', '6543210987', '101 Anna Salai, Chennai, Tamil Nadu'),  -- Customer 4
('Diya', 'Reddy', 'diya.reddy@example.com', '5432109876', '202 Banjara Hills, Hyderabad, Telangana'),  -- Customer 5
('Kabir', 'Khan', 'kabir.khan@example.com', '4321098765', '303 Connaught Place, Delhi'),  -- Customer 6
('Meera', 'Nair', 'meera.nair@example.com', '3210987654', '404 Marine Drive, Mumbai, Maharashtra'),  -- Customer 7
('Rohan', 'Singh', 'rohan.singh@example.com', '2109876543', '505 Juhu Beach, Mumbai, Maharashtra'),  -- Customer 8
('Saanvi', 'Gupta', 'saanvi.gupta@example.com', '1098765432', '606 Hiranandani Gardens, Mumbai, Maharashtra'),  -- Customer 9
('Kavya', 'Chopra', 'kavya.chopra@example.com', '0987654321', '707 Vasant Kunj, Delhi');  -- Customer 10

-- Create the bookings table
CREATE TABLE bookings (
  -- Unique identifier for each booking
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Customer ID of the booking
  customer_id INT NOT NULL,
  -- Package ID of the booking
  package_id INT NOT NULL,
  -- Booking date of the booking
  booking_date DATE NOT NULL,
  -- Total cost of the booking
  total_cost DECIMAL(10, 2) NOT NULL,
  -- Status of the booking
  status VARCHAR(20) NOT NULL CHECK (status IN ('pending', 'confirmed', 'cancelled')),
  -- Foreign key constraint to link bookings to customers
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  -- Foreign key constraint to link bookings to packages
  FOREIGN KEY (package_id) REFERENCES packages(id)
);

-- Insert records into the bookings table
INSERT INTO bookings (customer_id, package_id, booking_date, total_cost, status) VALUES
(1, 1, '2023-10-01', 15000.00, 'confirmed'),  -- Aarav Sharma: Mumbai to Delhi Getaway
(2, 2, '2023-10-02', 20000.00, 'pending'),    -- Vivaan Patel: Delhi Business Trip
(3, 3, '2023-10-03', 18000.00, 'confirmed'),  -- Aditya Verma: Bengaluru Relaxation Package
(4, 4, '2023-10-04', 22000.00, 'cancelled'),  -- Anaya Iyer: Chennai Cultural Experience
(5, 5, '2023-10-05', 16000.00, 'confirmed'),  -- Diya Reddy: Kolkata Heritage Tour
(6, 6, '2023-10-06', 19000.00, 'pending'),     -- Kabir Khan: Delhi to Bengaluru Adventure
(7, 7, '2023-10-07', 17000.00, 'confirmed'),   -- Meera Nair: Chennai to Kolkata Package
(8, 8, '2023-10-08', 25000.00, 'cancelled'),   -- Rohan Singh: Mumbai to Jaipur Getaway
(9, 9, '2023-10-09', 18000.00, 'confirmed'),   -- Saanvi Gupta: Bengaluru Relaxation Package
(10, 10, '2023-10-10', 20000.00, 'pending');    -- Kavya Chopra: Delhi Business Trip

-- Create the payments table
CREATE TABLE payments (
  -- Unique identifier for each payment
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Booking ID of the payment
  booking_id INT NOT NULL,
  -- Payment method of the payment
  payment_method VARCHAR(20) NOT NULL CHECK (payment_method IN ('credit_card', 'paypal', 'bank_transfer')),
  -- Payment date of the payment
  payment_date DATE NOT NULL,
  -- Amount of the payment
  amount DECIMAL(10, 2) NOT NULL,
  -- Foreign key constraint to link payments to bookings
  FOREIGN KEY (booking_id) REFERENCES bookings(id)
);

-- Insert records into the payments table
INSERT INTO payments (booking_id, payment_method, payment_date, amount) VALUES
(1, 'credit_card', '2023-10-01', 15000.00),  -- Payment for Booking 1
(2, 'paypal', '2023-10-02', 20000.00),       -- Payment for Booking 2
(3, 'bank_transfer', '2023-10-03', 18000.00), -- Payment for Booking 3
(4, 'credit_card', '2023-10-04', 22000.00),  -- Payment for Booking 4 (cancelled, but recorded)
(5, 'paypal', '2023-10-05', 16000.00),       -- Payment for Booking 5
(6, 'bank_transfer', '2023-10-06', 19000.00), -- Payment for Booking 6
(7, 'credit_card', '2023-10-07', 17000.00),  -- Payment for Booking 7
(8, 'paypal', '2023-10-08', 25000.00),       -- Payment for Booking 8 (cancelled, but recorded)
(9, 'bank_transfer', '2023-10-09', 18000.00), -- Payment for Booking 9
(10, 'credit_card', '2023-10-10', 20000.00);  -- Payment for Booking 10

-- Create the reviews table
CREATE TABLE reviews (
  -- Unique identifier for each review
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Customer ID of the review
  customer_id INT NOT NULL,
  -- Package ID of the review
  package_id INT NOT NULL,
  -- Review date of the review
  review_date DATE NOT NULL,
  -- Rating of the review
  rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
  -- Review text of the review
  review_text TEXT,
  -- Foreign key constraint to link reviews to customers
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  -- Foreign key constraint to link reviews to packages
  FOREIGN KEY (package_id) REFERENCES packages(id)
);

-- Insert records into the reviews table
INSERT INTO reviews (customer_id, package_id, review_date, rating, review_text) VALUES
(1, 1, '2023-10-02', 5, 'Amazing experience! The hotel was luxurious and the service was top-notch.'),  -- Review 1
(2, 2, '2023-10-03', 4, 'Good trip overall, but the flight was delayed.'),                             -- Review 2
(3, 3, '2023-10-04', 5, 'Absolutely loved the relaxation package! Highly recommend.'),                 -- Review 3
(4, 4, '2023-10-05', 3, 'The cultural experience was nice, but the itinerary could be improved.'),      -- Review 4
(5, 5, '2023-10-06', 4, 'Great heritage tour! The guide was very knowledgeable.'),                     -- Review 5
(6, 6, '2023-10-07', 2, 'Not satisfied with the service during the trip. Expected better.'),            -- Review 6
(7, 7, '2023-10-08', 5, 'Fantastic package! Everything was well organized and enjoyable.'),            -- Review 7
(8, 8, '2023-10-09', 1, 'Very disappointed with the experience. Would not recommend.'),                -- Review 8
(9, 9, '2023-10-10', 4, 'Overall a good experience, but some activities were not as described.'),      -- Review 9
(10, 10, '2023-10-11', 5, 'Loved every moment of the trip! Will definitely book again.');            -- Review 10

-- Create the travel_agents table
CREATE TABLE travel_agents (
  -- Unique identifier for each travel agent
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Name of the travel agent
  name VARCHAR(50) NOT NULL,
  -- Description of the travel agent
  description TEXT,
  -- Contact information of the travel agent
  contact_info VARCHAR(100) NOT NULL,
  -- Foreign key constraint to link travel agents to packages
  package_id INT NOT NULL,
  -- Foreign key constraint to link travel agents to packages
  FOREIGN KEY (package_id) REFERENCES packages(id)
);

-- Insert records into the travel_agents table
INSERT INTO travel_agents (name, description, contact_info, package_id) VALUES
('Travel Guru', 'Expert in customized travel packages for families and groups.', 'contact@travelguru.com', 1),  -- Travel Agent 1
('Wanderlust Travels', 'Specializes in adventure and eco-tourism packages.', 'info@wanderlusttravels.com', 2),  -- Travel Agent 2
('Explore India', 'Offers cultural and heritage tours across India.', 'support@exploreindia.com', 3),  -- Travel Agent 3
('Luxury Escapes', 'Focuses on luxury travel experiences and high-end accommodations.', 'hello@luxuryescapes.com', 4),  -- Travel Agent 4
('Budget Travelers', 'Provides affordable travel options for budget-conscious travelers.', 'info@budgettravelers.com', 5);  -- Travel Agent 5

-- Create the destinations table
CREATE TABLE destinations (
  -- Unique identifier for each destination
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Name of the destination
  name VARCHAR(50) NOT NULL,
  -- Description of the destination
  description TEXT,
  -- Location of the destination
  location VARCHAR(100) NOT NULL,
  -- Foreign key constraint to link destinations to packages
  package_id INT NOT NULL,
  -- Foreign key constraint to link destinations to packages
  FOREIGN KEY (package_id) REFERENCES packages(id)
);

-- Insert records into the destinations table
INSERT INTO destinations (name, description, location, package_id) VALUES
('Mumbai', 'The city that never sleeps, known for its vibrant culture and Bollywood.', 'Maharashtra, India', 1),  -- Destination 1
('Delhi', 'The capital city, rich in history and modernity, with numerous monuments.', 'Delhi, India', 2),  -- Destination 2
('Bengaluru', 'Known as the Silicon Valley of India, famous for its parks and nightlife.', 'Karnataka, India', 3),  -- Destination 3
('Chennai', 'A major cultural hub, known for its classical music and dance forms.', 'Tamil Nadu, India', 4),  -- Destination 4
('Kolkata', 'The cultural capital of India, famous for its art, literature, and festivals.', 'West Bengal, India', 5);  -- Destination 5

-- Create the activities table
CREATE TABLE activities (
  -- Unique identifier for each activity
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Name of the activity
  name VARCHAR(50) NOT NULL,
  -- Description of the activity
  description TEXT,
  -- Location of the activity
  location VARCHAR(100) NOT NULL,
  -- Foreign key constraint to link activities to packages
  package_id INT NOT NULL,
  -- Foreign key constraint to link activities to packages
  FOREIGN KEY (package_id) REFERENCES packages(id)
);

-- Insert records into the activities table
INSERT INTO activities (name, description, location, package_id) VALUES
('City Tour', 'A guided tour of the city\'s major attractions and landmarks.', 'Mumbai', 1),  -- Activity 1
('Business Meetings', 'Scheduled meetings with local businesses and partners.', 'Delhi', 2),  -- Activity 2
('Spa Day', 'A relaxing day at a luxury spa with various treatments.', 'Bengaluru', 3),  -- Activity 3
('Cultural Dance Show', 'Experience traditional dance performances by local artists.', 'Chennai', 4),  -- Activity 4
('Heritage Walk', 'A guided walk through the historical sites of the city.', 'Kolkata', 5);  -- Activity 5

-- Create the transportation table
CREATE TABLE transportation (
  -- Unique identifier for each transportation
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Name of the transportation
  name VARCHAR(50) NOT NULL,
  -- Description of the transportation
  description TEXT,
  -- Location of the transportation
  location VARCHAR(100) NOT NULL,
  -- Foreign key constraint to link transportation to packages
  package_id INT NOT NULL,
  -- Foreign key constraint to link transportation to packages
  FOREIGN KEY (package_id) REFERENCES packages(id)
);

-- Insert records into the transportation table
INSERT INTO transportation (name, description, location, package_id) VALUES
('Private Car', 'A comfortable private car for airport transfers and local travel.', 'Mumbai', 1),  -- Transportation 1
('Luxury Coach', 'A luxury coach for group travel with amenities.', 'Delhi', 2),  -- Transportation 2
('Airport Shuttle', 'Convenient shuttle service from the airport to the hotel.', 'Bengaluru', 3),  -- Transportation 3
('Private Van', 'A spacious van for family travel and sightseeing.', 'Chennai', 4),  -- Transportation 4
('Rickshaw Ride', 'Experience the local culture with a rickshaw ride through the city.', 'Kolkata', 5);  -- Transportation 5

-- Create the accommodations table
CREATE TABLE accommodations (
  -- Unique identifier for each accommodation
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Name of the accommodation
  name VARCHAR(50) NOT NULL,
  -- Description of the accommodation
  description TEXT,
  -- Location of the accommodation
  location VARCHAR(100) NOT NULL,
  -- Foreign key constraint to link accommodations to packages
  package_id INT NOT NULL,
  -- Foreign key constraint to link accommodations to packages
  FOREIGN KEY (package_id) REFERENCES packages(id)
);

-- Insert records into the accommodations table
INSERT INTO accommodations (name, description, location, package_id) VALUES
('The Taj Mahal Palace', 'A luxury hotel offering stunning views of the Arabian Sea.', 'Mumbai', 1),  -- Accommodation 1
('The Oberoi', 'A five-star hotel known for its exceptional service and fine dining.', 'Delhi', 2),  -- Accommodation 2
('The Leela Palace', 'An opulent hotel with lavish rooms and world-class amenities.', 'Bengaluru', 3),  -- Accommodation 3
('ITC Grand Chola', 'A luxury hotel that reflects the grandeur of South Indian architecture.', 'Chennai', 4),  -- Accommodation 4
('The Westin Kolkata', 'A modern hotel with spacious rooms and a relaxing atmosphere.', 'Kolkata', 5);  -- Accommodation 5