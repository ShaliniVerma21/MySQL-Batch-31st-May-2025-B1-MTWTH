-- Create the MNC(Multi National Company) database
CREATE DATABASE MNC;

-- Switch to the MNC database
USE MNC;

-- Table-1
-- Create the Companies table
-- Create the Companies table with additional attributes and constraints
CREATE TABLE Companies (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    headquarters_location VARCHAR(100),
    established_date DATE,
    industry VARCHAR(50),
    revenue DECIMAL(15, 2) CHECK (revenue >= 0), -- Revenue must be non-negative 2323232323234.34
    employee_count INT DEFAULT 0 CHECK (employee_count >= 0), -- Employee count must be non-negative
    website VARCHAR(255) UNIQUE, -- Unique website URL for the company
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp for record creation
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Timestamp for record updates
    UNIQUE (company_name)
);

drop table Companies;

-- insert 10 records
INSERT INTO Companies (company_name, headquarters_location, established_date, industry, revenue, 
employee_count, website)
VALUES 
    ('Tata Consultancy Services', 'Mumbai, Maharashtra', '1968-04-01', 'Information Technology', 
    20000000000.00, 500000, 'https://www.tcs.com'),
    ('Reliance Industries Limited', 'Mumbai, Maharashtra', '1960-05-08', 'Conglomerate', 80000000000.00, 
    200000, 'https://www.ril.com'),
    ('Infosys', 'Bengaluru, Karnataka', '1981-07-02', 'Information Technology', 13000000000.00, 250000, 
    'https://www.infosys.com'),
    ('Wipro', 'Bengaluru, Karnataka', '1945-12-29', 'Information Technology', 8000000000.00, 200000, 
    'https://www.wipro.com'),
    ('HDFC Bank', 'Mumbai, Maharashtra', '1994-08-01', 'Banking', 15000000000.00, 120000, 
    'https://www.hdfcbank.com'),
    ('ICICI Bank', 'Mumbai, Maharashtra', '1994-01-05', 'Banking', 12000000000.00, 100000, 
    'https://www.icicibank.com'),
    ('Bharti Airtel', 'New Delhi', '1995-07-07', 'Telecommunications', 15000000000.00, 30000, 
    'https://www.airtel.in'),
    ('State Bank of India', 'Mumbai, Maharashtra', '1955-01-01', 'Banking', 20000000000.00, 250000, 
    'https://www.sbi.co.in'),
    ('Hindustan Unilever Limited', 'Mumbai, Maharashtra', '1933-10-17', 'Consumer Goods', 
    6000000000.00, 40000, 'https://www.hul.co.in'),
    ('Larsen & Toubro', 'Mumbai, Maharashtra', '1938-02-07', 'Engineering & Construction', 
    15000000000.00, 50000, 'https://www.larsentoubro.com');



-- 1. SELECT Queries

-- Select All Records
SELECT * FROM Companies;

-- 1. Select Specific Columns
SELECT company_name, headquarters_location, revenue FROM Companies;

-- 2. Select Companies in a Specific Industry
SELECT * FROM Companies WHERE industry = 'Information Technology';

-- 3. Select Companies with Revenue Greater Than a Certain Amount
SELECT * FROM Companies WHERE revenue > 10000000000.00;

-- 4. Select Companies Established in a Specific Year
SELECT * FROM Companies WHERE YEAR(established_date) = 1994;

--  5. Select Companies Ordered by Revenue in Descending Order
SELECT * FROM Companies ORDER BY revenue DESC;

-- 6. Select Companies with a Specific Headquarters Location
SELECT * FROM Companies WHERE headquarters_location = 'Mumbai, Maharashtra';

-- 7. Select Companies with Employee Count Greater Than a Certain Number
SELECT * FROM Companies WHERE employee_count > 100000;

-- 8. Select Companies Established After a Certain Date
SELECT * FROM Companies WHERE established_date > '2000-01-01';

-- 9. Select Companies with a Revenue Between Two Values
SELECT * FROM Companies WHERE revenue BETWEEN 5000000000.00 AND 20000000000.00;

-- 10. Count the Number of Companies in Each Industry
SELECT industry, COUNT(*) AS company_count FROM Companies GROUP BY industry;

/*
The error message you're encountering indicates that MySQL's "safe update mode" is enabled. 
This mode prevents you from executing UPDATE or DELETE statements that do not include 
a WHERE clause that uses a key column (like a primary key). This is a safety feature 
to prevent accidental updates or deletions of all rows in a table.
*/
--  Disable Safe Update Mode Temporarily
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe updates


-- 2. ALTER Queries
-- used to modify structure of a table (add column, drop column, name, datatype, constraints)

-- 1. Add a New Column
ALTER TABLE Companies 
ADD COLUMN stock_symbol VARCHAR(10);

select * from companies;

-- 2. Modify an Existing Column
ALTER TABLE Companies 
MODIFY COLUMN revenue DECIMAL(20, 2) CHECK (revenue >= 0);

-- 3. Drop a Column
ALTER TABLE Companies 
DROP COLUMN stock_symbol;

-- 4. Rename a Column
ALTER TABLE Companies 
CHANGE COLUMN headquarters_location location VARCHAR(100);

-- 5. Add a Default Value to an Existing Column
ALTER TABLE Companies 
ALTER COLUMN employee_count SET DEFAULT 1;

-- 6. Add a New Column with a Default Value
ALTER TABLE Companies 
ADD COLUMN country VARCHAR(50) DEFAULT 'India';

-- 7. Drop a Column if it Exists (Not Supported)
ALTER TABLE Companies 
DROP COLUMN IF EXISTS country;

-- 8. Add a Unique Constraint
ALTER TABLE Companies 
ADD CONSTRAINT unique_website UNIQUE (website);

-- 9. Change the Data Type of a Column
ALTER TABLE Companies 
MODIFY COLUMN established_date DATETIME;

-- 10. Add a Foreign Key Constraint
ALTER TABLE Companies 
ADD CONSTRAINT fk_industry FOREIGN KEY (industry) REFERENCES Industries(industry_name);


-- 3. DELETE Queries
-- drop(complete table(records+attributes) ), 
-- truncate(complete record only), 
-- delete(specific record)

-- 1. Delete a Specific Record
DELETE FROM Companies 
WHERE company_name = 'HDFC Bank';

select * from companies;

set sql_safe_updates=0;  -- disable safe-mode

-- 2. Delete Records Based on a Condition
DELETE FROM Companies 
WHERE industry = 'Banking';

-- 3. Delete Records with Revenue Below a Certain Amount
DELETE FROM Companies 
WHERE revenue < 5000000000.00;

-- 4. Delete Records Established Before a Certain Date
DELETE FROM Companies 
WHERE established_date < '2000-01-01';

-- 5. Delete Records with a Specific Headquarters Location
DELETE FROM Companies 
WHERE headquarters_location = 'New Delhi';

-- 6. Delete Records with a Specific Employee Count
DELETE FROM Companies 
WHERE employee_count = 0;

-- 7. Delete Records with a Specific Website
DELETE FROM Companies 
WHERE website = 'https://www.hdfcbank.com';

-- 8. Delete Records Based on Multiple Conditions
DELETE FROM Companies 
WHERE industry = 'Telecommunications' AND revenue < 10000000000.00;

--  Disable Safe Update Mode Temporarily
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe updates

-- 9. Delete All Records (Use with Caution)
DELETE FROM Companies;

select * from companies;

-- 10. Delete Records with a Specific Name Pattern
DELETE FROM Companies 
WHERE company_name LIKE 'H%';

use MNC;
-- 4. RENAME Query (we can rename any table name, coulmn name)

-- 1. Rename the Database (database renaming is not allowed)
ALTER DATABASE MNC RENAME TO MultiNationalCompanies;

-- 2. Rename the Companies Table
ALTER TABLE Companies RENAME TO MultinationalCompanies;

-- 3. Rename the company_id Column
ALTER TABLE MultinationalCompanies RENAME COLUMN company_id TO id;

select * from MultinationalCompanies;

-- 4. Rename the company_name Column
ALTER TABLE MultinationalCompanies RENAME COLUMN company_name TO name;

-- 5. Rename the headquarters_location Column
ALTER TABLE Companies RENAME COLUMN headquarters_location TO headquarters;

-- 6. Rename Multiple Columns
ALTER TABLE MultinationalCompanies
RENAME COLUMN industry TO business_sector,
RENAME COLUMN website TO company_website;

select * from Companies;

-- 5. UPDATE Query

--  Disable Safe Update Mode Temporarily
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe updates

select * from Companies;

-- 1.Update a Specific Record
UPDATE Companies 
SET revenue = 22000000000.00, employee_count = 520000 
WHERE company_name = 'Tata Consultancy Services';

-- 2.Update Multiple Records
UPDATE Companies 
SET industry = 'Telecom' 
WHERE name IN ('Bharti Airtel', 'Reliance Industries Limited');

-- 3. Update Revenue for All Companies in a Specific Industry
UPDATE Companies 
SET revenue = revenue * 1.10 
WHERE industry = 'Banking';

-- 4. Update Employee Count for a Specific Company
UPDATE Companies 
SET employee_count = 210000 
WHERE company_name = 'Wipro';

-- 5. Update Headquarters Location
UPDATE Companies 
SET headquarters_location = 'Gurugram, Haryana' 
WHERE company_name = 'ICICI Bank';

-- 6. Update Established Date
UPDATE Companies 
SET established_date = '1994-01-01' 
WHERE company_name = 'ICICI Bank';

-- 7. Update Website URL
UPDATE Companies 
SET website = 'https://www.infosys.co.in' 
WHERE company_name = 'Infosys';

-- 8. Update Revenue for Companies with Low Employee Count
UPDATE Companies 
SET revenue = 0 
WHERE employee_count < 50000;

-- 9. Update Industry for a Specific Company
UPDATE Companies 
SET industry = 'Consumer Products' 
WHERE company_name = 'Hindustan Unilever Limited';

-- 10. Update Multiple Fields for a Specific Company
UPDATE Companies 
SET revenue = 16000000000.00, industry = 'Construction & Engineering' 
WHERE company_name = 'Larsen & Toubro';

-- Home work - create remaining 4 tables, insert 10 records in each table, write 10-10 queries using select,alter, update, delete

-- Table-2
-- Create the Departments table
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    company_id INT,
    manager_id INT,
    FOREIGN KEY (company_id) REFERENCES Companies(company_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (manager_id) REFERENCES Employees(employee_id) ON DELETE SET NULL ON UPDATE CASCADE,
    UNIQUE (department_name, company_id)
);

-- Table-3
-- Create the Employees table
CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    hire_date DATE NOT NULL,
    job_title VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Create the Projects table
CREATE TABLE Projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    budget DECIMAL(15, 2),
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES Companies(company_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create the Salaries table
CREATE TABLE Salaries (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    salary_amount DECIMAL(15, 2) NOT NULL,
    effective_date DATE NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (employee_id, effective_date)
);