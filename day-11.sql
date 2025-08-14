use zoom;


-- pattern & Regular Expressions
/*
Regular expressions (regex) in MySQL are used to search for patterns in strings. 
MySQL provides the REGEXP operator, which allows you to perform pattern matching using regular 
expressions. This can be particularly useful for validating input, searching for specific formats, 
or filtering data based on patterns.
*/

CREATE TABLE IF NOT EXISTS employees (
    employee_id DECIMAL(6,0) NOT NULL PRIMARY KEY,  
    -- Unique identifier for each employee
    first_name VARCHAR(20) NOT NULL,                 
    -- Employee's first name
    last_name VARCHAR(25) NOT NULL,                  
    -- Employee's last name
    email VARCHAR(50) NOT NULL,                      
    -- Employee's email address
    phone_number VARCHAR(20) DEFAULT NULL,           
    -- Employee's phone number (optional)
    password varchar(20) default null,
    hire_date DATE NOT NULL,                          
    -- Date when the employee was hired
    job_id VARCHAR(10) NOT NULL,                     
    -- Identifier for the employee's job
    salary DECIMAL(8,2) DEFAULT NULL,                
    -- Employee's salary (optional)
    commission_pct DECIMAL(2,2) DEFAULT NULL,       
    -- Commission percentage (optional)
    manager_id DECIMAL(6,0) DEFAULT NULL,            
    -- ID of the employee's manager (optional)
    department_id DECIMAL(4,0) DEFAULT NULL,         
    -- ID of the department (optional)
    
    -- Constraints for various fields
    CONSTRAINT chk_email CHECK (email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$'),  
    -- Valid email format: 
    -- ^                : Start of the string
    -- [a-zA-Z0-9._%+-]+: One or more alphanumeric characters, dots, underscores, percent signs, pluses, or hyphens
    -- @                : Must contain an "@" symbol
    -- [a-zA-Z0-9.-]+   : One or more alphanumeric characters, dots, or hyphens (domain name)
    -- \\.[a-zA-Z]{2,}  : A dot followed by at least two alphabetic characters (top-level domain)
    -- $                : End of the string

    CONSTRAINT chk_phone_number CHECK 
    (phone_number REGEXP '^(\\+\\d{1,3}\\s?)?\\(?\\d{1,4}\\)?[-\\s]?\\d{1,4}[-\\s]?\\d{1,4}$'),  
    -- Valid phone number format:
    -- ^                     : Start of the string
    -- (\\+\\d{1,3}\\s?)?    : Optional country code starting with "+" followed by 1 to 3 digits and 
    -- an optional space
    -- \\(?\\d{1,4}\\)?      : Optional area code in parentheses, consisting of 1 to 4 digits
    -- [-\\s]?               : Optional separator (dash or space)
    -- \\d{1,4}             : 1 to 4 digits (first part of the phone number)
    -- [-\\s]?               : Optional separator (dash or space)
    -- \\d{1,4}             : 1 to 4 digits (second part of the phone number)
    -- $                     : End of the string

    CONSTRAINT chk_password CHECK (password 
    REGEXP '^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,}$'),  
    -- Valid password format (if a password field is added):
    -- ^                     : Start of the string
    -- (?=.*[a-z])          : At least one lowercase letter
    -- (?=.*[A-Z])          : At least one uppercase letter
    -- (?=.*[0-9])          : At least one digit
    -- (?=.*[!@#$%^&*])     : At least one special character from the set !@#$%^&*
    -- [A-Za-z0-9!@#$%^&*]{8,} : At least 8 characters that can be letters, digits, or special characters
    -- $                     : End of the string

    CONSTRAINT chk_first_name CHECK (first_name REGEXP '^[A-Z][a-zA-Z]{1,19}$'),  
    -- First name must start with uppercase and be 2-20 characters long:
    -- ^                     : Start of the string
    -- [A-Z]                : First character must be an uppercase letter
    -- [a-zA-Z]{1,19}       : Followed by 1 to 19 letters (uppercase or lowercase)
    -- $                     : End of the string

    CONSTRAINT chk_last_name CHECK (last_name REGEXP '^[A-Z][a-z ]{1,24}$'),    
    -- Last name must start with uppercase and be 2-25 characters long:
    -- ^                     : Start of the string
    -- [A-Z]                : First character must be an uppercase letter
    -- [a-z]{1,24}          : Followed by 1 to 24 lowercase letters
    -- $                     : End of the string

    CONSTRAINT chk_job_id CHECK (job_id REGEXP '^[A-Z]{2,5}-\\d{1,4}$'),          
    -- Job ID format: 2-5 uppercase letters followed by a hyphen and 1-4 digits:
    -- ^                     : Start of the string
    -- [A-Z]{2,5}           : 2 to 5 uppercase letters
    -- -                    : A hyphen
    -- \\d{1,4}             : 1 to 4 digits
    -- $                     : End of the string

    CONSTRAINT chk_salary CHECK (salary REGEXP '^(\\d{1,8}(\\.\\d{2})?)$'),      
    -- Salary must be a number with up to 8 digits and optional 2 decimal places:
    -- ^                     : Start of the string
    -- \\d{1,8}             : 1 to 8 digits
    -- (\\.\\d{2})?         : Optional decimal part with 2 digits
    -- $                     : End of the string

    CONSTRAINT chk_commission CHECK (commission_pct REGEXP '^(0|0\\.\\d{1,2}|[1-9]\\d*(\\.\\d{1,2})?)$'),  
    -- Commission must be between 0 and 100 with up to 2 decimal places:
    -- ^                     : Start of the string
    -- (0|0\\.\\d{1,2}|[1-9]\\d*(\\.\\d{1,2})?) : 0, or 0 followed by 1 to 2 decimal places, or 1 to 9 
    -- followed by any number of digits and optional 1 to 2 decimal places
    -- $                     : End of the string

    CONSTRAINT chk_department_id CHECK (department_id REGEXP '^[1-9][0-9]{0,3}$') 
    -- Department ID must be a number between 1 and 9999:
    -- ^                     : Start of the string
    -- [1-9]                : First digit must be between 1 and 9
    -- [0-9]{0,3}           : Followed by 0 to 3 digits
    -- $                     : End of the string
);

-- Insert 5 records into the employees table
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, password, 
hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', 'P@ssw0rd', '2020-01-01',
    'SALE-1234', 50000.00, 0.10, 2, 10),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', 'P@ssw0rd', '2020-02-01', 
    'DEV-5678', 60000.00, 0.15, 1, 20),
    (3, 'Bob', 'Johnson', 'bob.johnson@example.com', '555-123-4567', 'P@ssw0rd', '2020-03-01', 
    'MARK-9012', 70000.00, 0.20, 3, 30),
    (4, 'Alice', 'Williams', 'alice.williams@example.com', '789-012-3456', 'P@ssw0rd', '2020-04-01', 
    'FIN-3456', 80000.00, 0.25, 4, 40),
    (5, 'Mike', 'Davis', 'mike.davis@example.com', '321-987-6543', 'P@ssw0rd', '2020-05-01', 
    'HR-5678', 90000.00, 0.30, 5, 50);
    
    select * from employees;

-- Views, CTE

/*

1. Views
Definition: A view is a virtual table in a database that is based on the result of a SELECT query.
It does not store data itself but provides a way to present data from one or more tables in a
structured format. Views can simplify complex queries, enhance security by restricting access to
specific data, and provide a consistent interface to data.

Key Features of Views
1. Simplification: Views can simplify complex queries by encapsulating them.
2. Security: They can restrict access to specific rows or columns of data.
3. Reusability: Once created, views can be reused in other queries.

*/


-- Example 1: Employee Management System

-- Step 1: Create the Employee table
CREATE TABLE Employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    active BOOLEAN NOT NULL,
    status VARCHAR(20) NOT NULL
);

-- Step 2: Insert sample data into Employees
INSERT INTO Employee (name, position, active, status) VALUES
('John Doe', 'Manager', TRUE, 'active'),
('Jane Smith', 'Developer', TRUE, 'active'),
('Bob Johnson', 'Designer', FALSE, 'inactive');

select * from employee;

-- Step 3: Create a view for active employees
CREATE VIEW EmployeeView AS
SELECT id, name, position
FROM Employee
WHERE active = 1;

-- Step 4: Use the view
SELECT * FROM EmployeeView;

-- Step 5: Update the view
CREATE OR REPLACE VIEW ActiveEmployees AS
SELECT id, name, position
FROM Employee
WHERE status = 'active';

-- Step 6: Use the updated view
SELECT * FROM ActiveEmployees;

-- Step 7: Delete the view
DROP VIEW IF EXISTS EmployeeView;

-- Optionally, delete the updated view
DROP VIEW IF EXISTS ActiveEmployees;


-- Example 2: Product Management System
-- Step 1: Create the Products Table
CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- Step 2: Insert Sample Data into Products
INSERT INTO Products (name, price, stock, category) VALUES
('Laptop', 999.99, 10, 'Electronics'),
('Smartphone', 499.99, 20, 'Electronics'),
('Desk', 199.99, 15, 'Furniture'),
('Chair', 89.99, 30, 'Furniture'),
('Headphones', 149.99, 25, 'Electronics');

-- Step 3: Create a View for Available Products
CREATE VIEW AvailableProducts AS
SELECT id, name, price, stock
FROM Products
WHERE stock > 0;

-- Step 4: Use the View
SELECT * FROM AvailableProducts;

-- Step 5: Update the View to Include Category
CREATE OR REPLACE VIEW AvailableProductsWithCategory AS
SELECT id, name, price, stock, category
FROM Products
WHERE stock > 0;

-- Step 6: Use the Updated View
SELECT * FROM AvailableProductsWithCategory;

-- Step 7: Delete the Views
DROP VIEW IF EXISTS AvailableProducts;
DROP VIEW IF EXISTS AvailableProductsWithCategory;


-- Example 3: Order Management System
-- Step 1: Create the Orders Table
CREATE TABLE Orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

-- Step 2: Insert Sample Data into Orders
INSERT INTO Orders (customer_name, product_id, quantity, order_date) VALUES
('Alice', 1, 1, '2023-10-01'),
('Bob', 2, 2, '2023-10-02'),
('Charlie', 3, 1, '2023-10-03'),
('David', 1, 3, '2023-10-04');

-- Step 3: Create a View for Order Summary
CREATE VIEW OrderSummary AS
SELECT o.id, o.customer_name, p.name AS product_name, o.quantity, o.order_date
FROM Orders o
JOIN Products p ON o.product_id = p.id;

-- Step 4: Use the View
SELECT * FROM OrderSummary;

-- Step 5: Update the View to Include Total Price
CREATE OR REPLACE VIEW OrderSummaryWithTotal AS
SELECT o.id, o.customer_name, p.name AS product_name, o.quantity, o.order_date,
       (o.quantity * p.price) AS total_price
FROM Orders o
JOIN Products p ON o.product_id = p.id;

-- Step 6: Use the Updated View
SELECT * FROM OrderSummaryWithTotal;

-- Step 7: Delete the Views
DROP VIEW IF EXISTS OrderSummary;
DROP VIEW IF EXISTS OrderSummaryWithTotal;


/*
2. Common Table Expressions (CTE)
Definition:
A CTE is a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement.
It is defined using the WITH clause.

Key Features of CTEs
1. Readability: CTEs can make complex queries easier to read and maintain.
2. Recursion: CTEs can be recursive, allowing for hierarchical data traversal.
3. Modularity: They can be defined once and referenced multiple times within the same query.
*/

-- Example 1: Employee Management System with CTE
-- Step 3: Use a CTE to Get Active Employees
WITH ActiveEmployees AS (
    SELECT id, name, position
    FROM Employee
    WHERE active = 1
)
SELECT * FROM ActiveEmployees;

-- Step 4: Use a CTE to Count Active Employees by Position
WITH ActiveEmployeeCounts AS (
    SELECT position, COUNT(*) AS count
    FROM Employee
    WHERE active = 1
    GROUP BY position
)
SELECT * FROM ActiveEmployeeCounts;

-- Step 5: Use a CTE to Get Inactive Employees
WITH InactiveEmployees AS (
    SELECT id, name, position
    FROM Employee
    WHERE active = 0
)
SELECT * FROM InactiveEmployees;

-- Step 6: Use a CTE to Get Employees with Status Counts
WITH EmployeeStatusCounts AS (
    SELECT status, COUNT(*) AS count
    FROM Employee
    GROUP BY status
)
SELECT * FROM EmployeeStatusCounts;

-- Step 7: Use a CTE to Delete Inactive Employees
WITH InactiveEmployees AS (
    SELECT id
    FROM Employee
    WHERE active = 0
)
DELETE FROM Employee
WHERE id IN (SELECT id FROM InactiveEmployees);

set SQl_Safe_Updates=0;

-- Example 2: Product Management System with CTE
-- Step 3: Use a CTE to Get Available Products
WITH AvailableProducts AS (
    SELECT id, name, price, stock
    FROM Products
    WHERE stock > 0
)
SELECT * FROM AvailableProducts;

-- Step 4: Use a CTE to Calculate Total Inventory Value
WITH InventoryValue AS (
    SELECT SUM(price * stock) AS total_value
    FROM Products
)
SELECT * FROM InventoryValue;

-- Step 5: Use a CTE to Get Products Below a Certain Stock Level
WITH LowStockProducts AS (
    SELECT id, name, stock
    FROM Products
    WHERE stock < 5
)
SELECT * FROM LowStockProducts;

-- Step 6: Use a CTE to Get Products by Category
WITH ProductsByCategory AS (
    SELECT category, COUNT(*) AS count
    FROM Products
    GROUP BY category
)
SELECT * FROM ProductsByCategory;

-- Step 7: Use a CTE to Delete Products with Zero Stock
WITH OutOfStockProducts AS (
    SELECT id
    FROM Products
    WHERE stock = 0
)
DELETE FROM Products
WHERE id IN (SELECT id FROM OutOfStockProducts);

-- Example 3: Order Management System with CTE
-- Step 3: Use a CTE to Get Order Summary
WITH OrderSummary AS (
    SELECT o.id, o.customer_name, p.name AS product_name, o.quantity, o.order_date
    FROM Orders o
    JOIN Products p ON o.product_id = p.id
)
SELECT * FROM OrderSummary;

-- Step 4: Use a CTE to Calculate Total Sales by Product
WITH TotalSales AS (
    SELECT p.name AS product_name, SUM(o.quantity) AS total_quantity
    FROM Orders o
    JOIN Products p ON o.product_id = p.id
    GROUP BY p.name
)
SELECT * FROM TotalSales;

-- Step 5: Use a CTE to Get Orders by Customer
WITH OrdersByCustomer AS (
    SELECT customer_name, COUNT(*) AS order_count
    FROM Orders
    GROUP BY customer_name
)
SELECT * FROM OrdersByCustomer;

-- Step 6: Use a CTE to Get Orders with Total Amounts
WITH OrderAmounts AS (
    SELECT o.id, o.customer_name, SUM(p.price * o.quantity) AS total_amount
    FROM Orders o
    JOIN Products p ON o.product_id = p.id
    GROUP BY o.id, o.customer_name
)
SELECT * FROM OrderAmounts;

-- Step 7: Use a CTE to Delete Orders Older Than a Certain Date
WITH OldOrders AS (
    SELECT id
    FROM Orders
    WHERE order_date < '2023-01-01'
)
DELETE FROM Orders
WHERE id IN (SELECT id FROM OldOrders);
