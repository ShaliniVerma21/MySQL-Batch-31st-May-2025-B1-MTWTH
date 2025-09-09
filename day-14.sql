use zoom;

-- DCL
/*
Data Control Language (DCL)
Definition:
DCL is used to control access to data in a database. It includes commands that grant or revoke permissions
to users or roles.

Key Commands
GRANT: Gives a user or role permission to perform specific actions on 
database objects (like tables, views, etc.).
REVOKE: Removes previously granted permissions from a user or role.
*/

-- Step 1: Create a sample Emp table
CREATE TABLE Emp (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Step 2: Insert Sample Data into the Emp Table
INSERT INTO Emp (name, position, salary) VALUES
('John Doe', 'Manager', 75000.00),
('Jane Smith', 'Developer', 60000.00),
('Bob Johnson', 'Designer', 50000.00);

-- Step 3: Create a New User
-- Create a new user (this command may require admin privileges)
CREATE USER 'employee_user'@'localhost' IDENTIFIED BY 'password123';

-- Step 4: Grant Permissions to the User
-- Grant SELECT and INSERT permissions on the Emp table to the user
GRANT SELECT, INSERT ON Emp TO 'employee_user'@'localhost';

-- Step 5: Verify Granted Permissions
SELECT *
FROM information_schema.USER_PRIVILEGES
WHERE GRANTEE = "'employee_user'@'localhost'";

-- Step 6: Revoke Permissions from the User
-- Revoke INSERT permission from the user
REVOKE INSERT ON Emp FROM 'employee_user'@'localhost';

-- Step 7: Verify Revoked Permissions
SELECT *
FROM information_schema.USER_PRIVILEGES
WHERE GRANTEE = "'employee_user'@'localhost'";

-- Step 8: Drop the User (Optional)
-- Drop the user
DROP USER 'employee_user'@'localhost';


-- Example 2: Granting Permissions to a Role

-- Step 1: Create a Role
CREATE ROLE 'manager_role';

-- Step 2: Grant Permissions to the Role
-- Grant SELECT, INSERT, and UPDATE permissions on the Employees table to the role
GRANT SELECT, INSERT, UPDATE ON Emp TO 'manager_role';

-- Step 3: Create a User and Assign the Role
-- Create a new user
CREATE USER 'manager_user'@'localhost' IDENTIFIED BY 'password456';

-- Grant the role to the user
GRANT 'manager_role' TO 'manager_user'@'localhost';

-- Step 4: Verify Permissions for the User
SHOW GRANTS FOR 'manager_user'@'localhost';

-- Step 5: Revoke the Role from the User
-- Revoke the role from the user
REVOKE 'manager_role' FROM 'manager_user'@'localhost';


-- Example 3: Granting Permissions on Multiple Tables

-- Step 1: Create Another Table
-- Create a new table for Departments
CREATE TABLE Departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Step 2: Grant Permissions on Multiple Tables
-- Grant SELECT permission on both tables to the user
GRANT SELECT ON Emp TO 'manager_user'@'localhost';
GRANT SELECT ON Departments TO 'manager_user'@'localhost';

-- Step 3: Verify Permissions
SHOW GRANTS FOR 'manager_user'@'localhost';

-- Example 4: Revoking All Permissions

-- Step 1: Revoke All Permissions from a User
REVOKE ALL PRIVILEGES ON *.* FROM 'manager_user'@'localhost';

-- Step 2: Verify Revoked Permissions
SHOW GRANTS FOR 'manager_user'@'localhost';

-- Example 5: Granting Permissions with Conditions

-- Grant SELECT permission with a condition (hypothetical syntax)
-- GRANT SELECT ON Employees TO 'sales_user'@'localhost' WHERE department = 'Sales';(Not Supported in Mysql)
CREATE VIEW SalesEmployees AS
SELECT * FROM Emp WHERE salary = 20000;

GRANT SELECT ON SalesEmployees TO 'manager_user'@'localhost';

-- Dropping a Role
DROP ROLE 'manager_role';






-- TCL
/*
Transaction Control Language (TCL)
Definition:
TCL is used to manage transactions in a database. A transaction is a sequence of operations performed
as a single logical unit of work. TCL commands help ensure data integrity and consistency.

Key Commands
COMMIT: Saves all the changes made during the current transaction.
ROLLBACK: Undoes all changes made during the current transaction.
SAVEPOINT: Sets a point within a transaction to which you can later roll back.
SET TRANSACTION: Configures the properties of the transaction.

ACID Property:

ACID is a set of properties that guarantee that database transactions are processed reliably.
The acronym stands for Atomicity, Consistency, Isolation, and Durability.
The ACID properties are essential for maintaining the integrity and reliability of a database,
especially in applications where data consistency is critical, such as banking, e-commerce, and 
healthcare systems.

1. Atomicity-(All or Nothing)
 Ensures that all operations in a transaction are completed or none at all.
 
2. Consistency- (Data remains Correct)
Ensures that a transaction brings the database from one valid state to another valid state.

3. Isolation- (Transactions are indenpendent)
Ensures that transactions do not interfere with each other and are executed in isolation.

4. Durability- (Changed permanently)
Ensures that once a transaction is committed, it remains so, even in the event of a failure.
*/

-- Example: Using TCL in a Database

-- Step 1: Create a Sample Database and Table

-- Create a new database
CREATE DATABASE BankDB;

-- Use the newly created database
USE BankDB;

-- Create a sample Accounts table
CREATE TABLE Accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    account_holder VARCHAR(100) NOT NULL,
    balance DECIMAL(20, 2) NOT NULL
);

-- Step 2: Insert Sample Data into the Accounts Table
INSERT INTO Accounts (account_holder, balance) VALUES
('Yash', 900000.00),
('Asmita',4000000),
('Prashant',6000000),
('sahil', 7000000),
('Hitesh',8000000),
('Nilesh',9000000),
('Mithilesh', 100000000),
('Aditya', 15000000.00),
('Atharva', 100000000),
('Om', 15000000.00),
('Shruti', 100000000),
('Vivek', 15000000.00);


select * from Accounts;

-- Example 1: Using COMMIT and ROLLBACK
-- Step 3: Start a Transaction

-- Start a transaction
START TRANSACTION;

SET SQL_SAFE_UPDATES=0;
SET SQL_SAFE_UPDATES=1;

-- Perform some operations
UPDATE Accounts SET balance = balance + 2000 WHERE account_holder = 'Atharva';
UPDATE Accounts SET balance = balance - 2000 WHERE account_holder = 'Om';

-- Step 4: Commit the Transaction
-- Commit the transaction
COMMIT;

-- Step 5: Rollback the Transaction (Example of Failure)

-- Start a new transaction
START TRANSACTION;
SET SQL_SAFE_UPDATES=0;
SET SQL_SAFE_UPDATES=1;
-- Perform some operations
UPDATE Accounts SET balance = balance - 2000 WHERE account_holder = 'Aditya';
UPDATE Accounts SET balance = balance + 2000 WHERE account_holder = 'Prashant';

-- Simulate an error (e.g., trying to update a non-existent account)
UPDATE Accounts SET balance = balance + 200 WHERE account_holder = 'Suresh';
select * from Accounts;
-- Rollback the transaction
ROLLBACK;

-- Example 2: Using SAVEPOINT

-- Step 6: Set a Savepoint
-- Start a new transaction
START TRANSACTION;
SET SQL_SAFE_UPDATES=0;
SET SQL_SAFE_UPDATES=1;
-- Perform some operations
UPDATE Accounts SET balance = balance - 3000 WHERE account_holder = 'Asmita';
select * from Accounts;
-- Set a savepoint
SAVEPOINT before_OM_update;

-- Perform another operation
UPDATE Accounts SET balance = balance + 3000 WHERE account_holder = 'Om';

-- If something goes wrong, you can roll back to the savepoint
ROLLBACK TO SAVEPOINT before_OM_update;

-- Commit the transaction
COMMIT;

-- Example 3: Using SET TRANSACTION

-- Step 7: Set Transaction Properties
-- Set the transaction isolation level
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Start a new transaction
START TRANSACTION;

-- Perform some operations
UPDATE Accounts SET balance = balance - 100 WHERE account_holder = 'Aditya';

-- Commit the transaction
COMMIT;
select * from Accounts;
