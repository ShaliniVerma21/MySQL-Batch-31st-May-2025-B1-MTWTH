
create database zoom;
use zoom;

-- Userdefined Functions
/*
User -defined functions (UDFs) in MySQL allow you to create your own functions
that can be used in SQL statements, just like built-in functions. UDFs can encapsulate
complex logic, perform calculations, or manipulate data, making your SQL queries
cleaner and more efficient.

To create a user-defined function in MySQL, you use the CREATE FUNCTION statement.

Syntax :

DELIMITER //
CREATE FUNCTION function_name (parameters)
RETURNS return_data_type
DETERMINISTIC
BEGIN
    -- Function logic goes here
    RETURN value;
END
//DELIMITER ;

DELIMITER //:
Changes the statement delimiter to // so that MySQL can recognize the 
end of the function definition.
*/

-- This function adds two integers and returns the sum.
DELIMITER //
CREATE FUNCTION add_numbers(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN a + b;
END //

DELIMITER ;

-- Use the Function
SELECT add_numbers(5, 10) AS sum;  -- Returns 15

-- This function subtract two integers and returns the result.
DELIMITER //
CREATE FUNCTION subtract_numbers(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN a - b;
END //

DELIMITER ;

-- Use the Function
SELECT subtract_numbers(5, 10) AS subtract;  -- Returns 15


-- This function concatenates a first name and a last name into a full name.
DELIMITER //

CREATE FUNCTION full_name(first_name VARCHAR(50), last_name VARCHAR(50))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    RETURN CONCAT(first_name, ' ', last_name);
END //

DELIMITER ;

-- Use the Function
SELECT full_name('John', 'Doe') AS name;  -- Returns 'John Doe'


-- This function calculates the age of a person based on their birthdate.
DELIMITER //

CREATE FUNCTION calculate_age(birthdate DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN YEAR(CURDATE()) - YEAR(birthdate) - (DATE_FORMAT(CURDATE(), '%m%d') 
    < DATE_FORMAT(birthdate, '%m%d'));
END //

DELIMITER ;

-- Use the Function
SELECT calculate_age('2001-09-04') AS age;  -- Returns the age based on the current date


-- This function checks if a number is even or odd.
DELIMITER //

CREATE FUNCTION is_even_or_odd(num INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    IF num % 2 = 0 THEN
        RETURN 'Even';
    ELSE
        RETURN 'Odd';
    END IF;
END //

DELIMITER ;

-- Use the Function
SELECT is_even_or_odd(7) AS result;  -- Returns 'Odd'
SELECT is_even_or_odd(8) AS result;  -- Returns 'Even'


-- This function calculates the discounted price based on the original price and discount percentage.
DELIMITER //

CREATE FUNCTION discounted_price(original_price DECIMAL(10, 2), discount_percentage DECIMAL(5, 2))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    RETURN original_price * (1 - discount_percentage / 100);
END //

DELIMITER ;

-- Use the Function
SELECT discounted_price(100, 20) AS final_price;  -- Returns 80.00


-- This function calculates the factorial of a number.
DELIMITER //
CREATE FUNCTION factorial(n INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE result INT DEFAULT 1;
    WHILE n > 1 DO
        SET result = result * n;
        SET n = n - 1;
    END WHILE;
    RETURN result;
END //
DELIMITER ;

-- Use the Function
SELECT factorial(5) AS factorial_of_5;  -- Returns 120


-- This function checks if a string is a palindrome.
DELIMITER //

CREATE FUNCTION is_palindrome(str VARCHAR(255))
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    RETURN str = REVERSE(str);
END //

DELIMITER ;

-- Use the Function
SELECT is_palindrome('madam') AS result;  -- Returns 1 (true)
SELECT is_palindrome('hello') AS result;  -- Returns 0 (false)


-- This function extracts a substring from a string based on the start position and length.
DELIMITER //

CREATE FUNCTION SubstringFunction(str VARCHAR(255), start INT, length INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    RETURN SUBSTRING(str, start, length);
END //

DELIMITER ;

-- Use the Function
SELECT SubstringFunction('Hello World', 1, 5) AS substring;  -- Returns 'Hello'


-- This function returns the square of a number.
DELIMITER //

CREATE FUNCTION SquareNumber(num DECIMAL(10,2))
RETURNS DECIMAL(10,2)
BEGIN
    RETURN num * num;
END //

DELIMITER ;

-- Use the Function
SELECT SquareNumber(4) AS square;  -- Returns 16.00


-- This function checks if a password is strong based on certain criteria.
DELIMITER //

CREATE FUNCTION IsStrongPassword(password VARCHAR(255)) RETURNS BOOLEAN
BEGIN
    DECLARE strong BOOLEAN;
    SET strong = password REGEXP '^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$';
    RETURN strong;
END //

DELIMITER ;

-- Use the Function
SELECT IsStrongPassword('MyP@ssw0rd') AS result;  -- Returns 1 (true)
SELECT IsStrongPassword('mypassword') AS result;  -- Returns 0 (false)


-- This function validates an IP address format.
DELIMITER //

CREATE FUNCTION IsValidIP(ip VARCHAR(255))
RETURNS BOOLEAN
BEGIN
    DECLARE valid BOOLEAN;
    SET valid = ip REGEXP '^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$';
    RETURN valid;
END //

DELIMITER ;

-- Use the Function
SELECT IsValidIP('192.168.1.1') AS result;  -- Returns 1 (true)
SELECT IsValidIP('256.1.1.1') AS result;  -- Returns 0 (false)


-- This function validates a credit card number format.
DELIMITER //

CREATE FUNCTION IsValidCreditCard(card_number VARCHAR(255))
RETURNS BOOLEAN
BEGIN
    DECLARE valid BOOLEAN;
    SET valid = card_number 
    REGEXP '^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9]{2})[0-9]{12}|3[47][0-9]{13})$';
    RETURN valid;
END //

DELIMITER ;

-- Use the Function
SELECT IsValidCreditCard('4111111111111111') AS result;  -- Returns 1 (true)
SELECT IsValidCreditCard('411111111111111') AS result;  -- Returns 0 (false)


-- This function validates a zip code format.
DELIMITER //

CREATE FUNCTION IsValidZip(zip_code VARCHAR(255))
RETURNS BOOLEAN
BEGIN
    DECLARE valid BOOLEAN;
    SET valid = zip_code REGEXP '^[0-9]{5}(?:-[0-9]{4})?$';
    RETURN valid;
END //

DELIMITER ;

-- Use the Function
SELECT IsValidZip('12345') AS result;  -- Returns 1 (true)
SELECT IsValidZip('1234') AS result;  -- Returns 0 (false)




-- 1. Function to Calculate Annual Salary
DELIMITER //
CREATE FUNCTION CalculateAnnualSalary(salary DECIMAL(8,2))
RETURNS DECIMAL(10,2)
BEGIN
    RETURN salary * 12;  -- Assuming salary is monthly
END //
DELIMITER ;

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    CalculateAnnualSalary(salary) AS annual_salary
FROM employees;


-- 2. Function to Calculate Total Commission
DELIMITER //
CREATE FUNCTION CalculateTotalCommission(salary DECIMAL(8,2), commission_pct DECIMAL(2,2))
RETURNS DECIMAL(10,2)
BEGIN
    RETURN salary * commission_pct;  -- Total commission based on salary and commission percentage
END //
DELIMITER ;

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    commission_pct,
    CalculateTotalCommission(salary, commission_pct) AS total_commission
FROM employees;

-- 3. Function to Validate Email Format
DELIMITER //
CREATE FUNCTION IsValidEmail(email VARCHAR(50))
RETURNS BOOLEAN
BEGIN
    RETURN email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$';
END //
DELIMITER ;

SELECT
    employee_id,
    first_name,
    last_name,
    email,
    IsValidEmail(email) AS email_valid
FROM employees;

-- delete a function
DROP FUNCTION IF EXISTS IsValidEmail;
