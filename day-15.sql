use zoom;

-- Triggers
/*
Definition of Triggers :
A trigger is a special type of stored procedure in a database that automatically executes (or "fires")
in response to certain events on a particular table or view. Triggers are used to enforce business rules,
maintain data integrity, and automate system tasks without requiring explicit calls from applications.
Triggers are powerful tools in database management, allowing for automated responses to data changes
while ensuring data integrity and enforcing business rules.


Key Characteristics of Triggers :

1. Automatic Execution: Triggers are executed automatically when a specified event occurs.
2. Event-Driven: They are associated with specific events such as INSERT, UPDATE, or DELETE.
3. Row-Level or Statement-Level: Triggers can operate on each row affected by the event (row-level)
or once for the entire statement (statement-level).
4. Performance: Triggers can impact performance, especially if they contain complex logic or are
executed frequently.
5. Debugging: Debugging triggers can be challenging, as they execute automatically and may not be visible in 
the application flow.

Types of Triggers :

1. BEFORE Triggers: Executed before the triggering event (e.g., before an INSERT, UPDATE, or DELETE operation).
2. AFTER Triggers: Executed after the triggering event has occurred.
3. INSTEAD OF Triggers(Not Supported in MySQL): Used primarily with views, these triggers execute in place of
the triggering event.

Structure of SQLSTATE

Format: The SQLSTATE value is a five-character string, where the first two characters represent
the class of the error, and the last three characters provide more specific information about the error.

Classes: The first two characters indicate the general category of the error.

For example:
- 00 indicates successful completion.
- 01 indicates a warning.
- 02 indicates no data found.
- 22 indicates a data exception (e.g., invalid data).
- 45 indicates a user-defined exception.
*/

-- Step 1: Create the Table
CREATE TABLE Accounts (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    AccountHolder VARCHAR(100) NOT NULL,
    Balance DECIMAL(10, 2) NOT NULL
);

INSERT INTO Accounts (AccountHolder, Balance) VALUES
('Rahul Sharma', 15000.00),  -- 15,000 INR
('Priya Gupta', 25000.50),   -- 25,000.50 INR
('Amit Verma', 1000.75),     -- 1,000.75 INR
('Sneha Reddy', 50000.00),   -- 50,000 INR
('Vikram Singh', 7500.00);    -- 7,500 INR

select * from Accounts;

-- Example 1: BEFORE Trigger
-- Scenario: Preventing negative balances in a bank account.

DELIMITER //
CREATE TRIGGER prevent_negative_balance
BEFORE UPDATE ON Accounts
FOR EACH ROW
BEGIN
    IF NEW.balance < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Balance cannot be negative';
    END IF;
END;
//DELIMITER ;

UPDATE Accounts SET Balance = -5000.00 WHERE AccountID = 2;  -- This will trigger an error

UPDATE Accounts SET Balance = 20000.00 WHERE AccountID = 3;  -- This will succeed



-- Example 2: AFTER Trigger
-- Scenario: Logging changes to an audit table after an account balance is updated.
-- Step 1: Create a table
CREATE TABLE AuditLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    old_balance DECIMAL(10, 2),
    new_balance DECIMAL(10, 2),
    change_time DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO AuditLog (account_id, old_balance, new_balance) VALUES
(1, 15000.00, 30000.00),  -- Example: Account ID 1 changed from 15000.00 to 30000.00
(2, 25000.50, 20000.00),  -- Example: Account ID 2 changed from 25000.50 to 20000.00
(3, 1000.75, 500.00);      -- Example: Account ID 3 changed from 1000.75 to 500.00

select * from AuditLog;

-- Step 2: Create the Trigger
DELIMITER //
CREATE TRIGGER log_balance_change
AFTER UPDATE ON Accounts
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (account_id, old_balance, new_balance)
    VALUES (OLD.AccountID, OLD.Balance, NEW.Balance);
END;
//
DELIMITER ;

-- Step 3: Test the Trigger
UPDATE Accounts SET Balance = 180000.00 WHERE AccountID = 2;  -- Update the balance of AccountID 1
select * from Accounts;
select * from AuditLog;

UPDATE Accounts SET Balance = 0.00 WHERE AccountID = 2;  -- Update the balance of AccountID 1
select * from Accounts;
select * from AuditLog;

-- Example 3: INSTEAD OF Trigger (Not Supported in Mysql)
-- Scenario: Updating a view instead of the underlying table.

DELIMITER //
CREATE VIEW AccountView AS
SELECT account_id, account_holder, balance
FROM Accounts;

CREATE TRIGGER update_account_view
INSTEAD OF UPDATE ON AccountView
FOR EACH ROW
BEGIN
    UPDATE Accounts
    SET balance = NEW.balance
    WHERE account_id = OLD.account_id;
END;
//DELIMITER ;

-- Example 4: BEFORE INSERT Trigger
-- Scenario: Automatically set the creation date for new accounts.

-- Step 1: Ensure the Accounts Table Has a creation_date Column
ALTER TABLE Accounts
ADD COLUMN creation_date DATETIME;

select * from Accounts;

-- Step 2: Create the BEFORE INSERT Trigger
DELIMITER //
CREATE TRIGGER set_creation_date
BEFORE INSERT ON Accounts
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
END;
//DELIMITER ;

-- Step 3: Test the Trigger
INSERT INTO Accounts (accountid, accountholder, balance)
VALUES (20, 'John Doe', 1000.00);

select * from Accounts;


-- Example 5: AFTER DELETE Trigger
-- Scenario: Log deletions of accounts to an audit table.
-- Step 1: Create the DeletedAccountsLog Table
CREATE TABLE DeletedAccountsLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    accountid INT,
    accountholder VARCHAR(100),
    deleted_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Step 2: Create the AFTER DELETE Trigger
DELIMITER //
CREATE TRIGGER log_account_deletion
AFTER DELETE ON Accounts
FOR EACH ROW
BEGIN
    INSERT INTO DeletedAccountsLog (accountid, accountholder)
    VALUES (OLD.accountid, OLD.accountholder);
END;
//
DELIMITER ;

-- Step 3: Test the Trigger
DELETE FROM Accounts WHERE accountid = 20;  -- Replace with an existing account ID
SELECT * FROM DeletedAccountsLog WHERE accountid = 20;  -- Replace with the deleted account ID


-- Example 6: BEFORE UPDATE Trigger
-- Scenario: Prevent updates to the account holder's name if the balance is not zero.
DELIMITER //
CREATE TRIGGER prevent_name_change_if_balance_not_zero
BEFORE UPDATE ON Accounts
FOR EACH ROW
BEGIN
    IF OLD.balance <> 0 AND OLD.accountholder <> NEW.accountholder THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot change account holder name when balance is not zero';
    END IF;
END;
//DELIMITER ;

-- Test the Trigger

UPDATE Accounts
SET accountholder = 'Bob Johnson'
WHERE accountid = 2;  -- Bob Smith has a balance of 0.00

SELECT * FROM Accounts;

-- Example 7: AFTER INSERT Trigger
-- Scenario: Automatically create an entry in the AuditLog table when a new account is created.
DELIMITER //
CREATE TRIGGER log_new_account_creation
AFTER INSERT ON Accounts
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (account_id, old_balance, new_balance)
    VALUES (NEW.accountid, 0, NEW.balance);
END;
//DELIMITER ;

-- Test the Trigger
INSERT INTO Accounts (accountholder, balance) VALUES ('John Doe', 1500.00);

SELECT * FROM AuditLog;

-- Example 8: BEFORE INSERT Trigger
-- Scenario: Ensure that the account balance cannot be set to a value greater than a specified limit.
DELIMITER //
CREATE TRIGGER prevent_exceeding_balance_limit
BEFORE INSERT ON Accounts
FOR EACH ROW
BEGIN
    IF NEW.balance > 10000 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Balance cannot exceed 10,000';
    END IF;
END;
//DELIMITER ;

-- Test the Trigger
INSERT INTO Accounts (accountholder, balance) VALUES ('Alice Johnson', 15000.00);


-- Example 9: AFTER UPDATE Trigger
-- Scenario: Update a summary table whenever an account balance is updated.
CREATE TABLE AccountSummary (
    total_accounts INT,
    total_balance DECIMAL(10, 2)
);

-- Initialize summary table
INSERT INTO AccountSummary (total_accounts, total_balance)
SELECT COUNT(*), SUM(balance) FROM Accounts;

DELIMITER //
CREATE TRIGGER update_account_summary
AFTER UPDATE ON Accounts
FOR EACH ROW
BEGIN
    UPDATE AccountSummary
    SET total_balance = total_balance + (NEW.balance - OLD.balance);
END;
//DELIMITER ;

--  Test the Trigger
INSERT INTO Accounts (accountholder, balance) VALUES
('Alice Johnson', 1000.00),
('Bob Smith', 2000.00),
('Charlie Brown', 3000.00);

set SQL_SAFE_UPDATES=0;

UPDATE Accounts
SET balance = 2500.00
WHERE accountid = 3;  -- Update Alice's balance

SELECT * FROM AccountSummary;

-- Example 10: BEFORE DELETE Trigger
-- Scenario: Prevent deletion of accounts that have a balance greater than zero.
DELIMITER //
CREATE TRIGGER prevent_account_deletion_with_balance
BEFORE DELETE ON Accounts
FOR EACH ROW
BEGIN
    IF OLD.balance > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete account with a positive balance';
    END IF;
END;
//DELIMITER ;

-- Example 11: BEFORE INSERT Trigger
-- Scenario: Ensure that the account holder's name is not empty when creating a new account.
DELIMITER //
CREATE TRIGGER prevent_empty_account_holder
BEFORE INSERT ON Accounts
FOR EACH ROW
BEGIN
    IF NEW.account_holder IS NULL OR TRIM(NEW.account_holder) = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Account holder name cannot be empty';
    END IF;
END;
//
DELIMITER ;

-- Example 12: AFTER UPDATE Trigger
-- Scenario: Notify an external system (simulated here by inserting into a Notifications table)
-- whenever an account balance is updated.
CREATE TABLE Notifications (
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    message VARCHAR(255),
    notification_time DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER notify_balance_update
AFTER UPDATE ON Accounts
FOR EACH ROW
BEGIN
    INSERT INTO Notifications (account_id, message)
    VALUES (NEW.account_id, CONCAT('Account balance updated from ', OLD.balance, ' to ', NEW.balance));
END;
//
DELIMITER ;

-- Example 13: BEFORE UPDATE Trigger
-- Scenario: Prevent changes to the balance if the account is marked as inactive.
DELIMITER //
CREATE TRIGGER prevent_balance_change_if_inactive
BEFORE UPDATE ON Accounts
FOR EACH ROW
BEGIN
    IF OLD.status = 'inactive' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot change balance of inactive accounts';
    END IF;
END;
//
DELIMITER ;

-- Example 14: AFTER INSERT Trigger
-- Scenario: Automatically create a welcome message for new accounts in a Messages table.
CREATE TABLE Messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    message TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER create_welcome_message
AFTER INSERT ON Accounts
FOR EACH ROW
BEGIN
    INSERT INTO Messages (account_id, message)
    VALUES (NEW.account_id, CONCAT('Welcome, ', NEW.account_holder, '! Your account has been created.'));
END;
//
DELIMITER ;

-- Example 15: BEFORE DELETE Trigger
-- Scenario: Log the details of an account before it is deleted.

DELIMITER //
CREATE TABLE DeletedAccountsLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    account_holder VARCHAR(100),
    balance DECIMAL(10, 2),
    deleted_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER log_account_deletion_details
BEFORE DELETE ON Accounts
FOR EACH ROW
BEGIN
    INSERT INTO DeletedAccountsLog (account_id, account_holder, balance)
    VALUES (OLD.account_id, OLD.account_holder, OLD.balance);
END;
//
DELIMITER ;

-- Example 16: AFTER UPDATE Trigger
-- Scenario: Update a LastUpdated timestamp in the Accounts table whenever an account is updated.
ALTER TABLE Accounts ADD COLUMN last_updated DATETIME;

DELIMITER //
CREATE TRIGGER update_last_updated
AFTER UPDATE ON Accounts
FOR EACH ROW
BEGIN
    UPDATE Accounts
    SET last_updated = NOW()
    WHERE account_id = NEW.account_id;
END;
//
DELIMITER ;

-- Example 17: BEFORE INSERT Trigger
-- Scenario: Ensure that the account balance is not negative when creating a new account.
DELIMITER //
CREATE TRIGGER prevent_negative_balance_on_insert
BEFORE INSERT ON Accounts
FOR EACH ROW
BEGIN
    IF NEW.balance < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Balance cannot be negative on account creation';
    END IF;
END;
//
DELIMITER ;

-- Example 18: AFTER INSERT Trigger
-- Scenario: Update a summary table with the total number of accounts whenever a new account is created.
CREATE TABLE AccountSummary (
    total_accounts INT DEFAULT 0
);

-- Initialize summary table
INSERT INTO AccountSummary (total_accounts) VALUES (0);

DELIMITER //
CREATE TRIGGER update_account_summary_on_insert
AFTER INSERT ON Accounts
FOR EACH ROW
BEGIN
    UPDATE AccountSummary
    SET total_accounts = total_accounts + 1;
END;
//
DELIMITER ;

-- Example 19: BEFORE UPDATE Trigger
-- Scenario: Prevent changes to the account holder's name if the account has been active for more than a year.
DELIMITER //
CREATE TRIGGER prevent_name_change_if_active_for_year
BEFORE UPDATE ON Accounts
FOR EACH ROW
BEGIN
    IF DATEDIFF(NOW(), OLD.creation_date) > 365 AND OLD.account_holder <> NEW.account_holder THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot change account holder name after 1 year of account creation';
    END IF;
END;
//
DELIMITER ;

-- Example 20: AFTER DELETE Trigger
-- Scenario: Update a summary table with the total number of accounts whenever an account is deleted.
-- Assuming the AccountSummary table has already been created
-- and initialized with a total_accounts column.

DELIMITER //
CREATE TRIGGER update_account_summary_on_delete
AFTER DELETE ON Accounts
FOR EACH ROW
BEGIN
    UPDATE AccountSummary
    SET total_accounts = total_accounts - 1;
END;
//
DELIMITER ;
