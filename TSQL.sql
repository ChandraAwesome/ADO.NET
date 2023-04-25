create database TSQLAssignment
use TSQLAssignment

CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY IDENTITY(1,1),
  CustomerName VARCHAR(50) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  Phone VARCHAR(15) NOT NULL
);

select * from Customer

CREATE TABLE [Order] (
  OrderID INT PRIMARY KEY IDENTITY(1,1),
  OrderDate DATE NOT NULL,
  CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID)
);

select * from [Order]

-- Insert a new customer into the Customer table
INSERT INTO Customer (CustomerName, Email, Phone)
VALUES ('John Doe', 'johndoe@email.com', '123-456-7890');

-- Get the CustomerID of the new customer
DECLARE @CustomerID INT;
SET @CustomerID = SCOPE_IDENTITY();

-- Insert a new order into the Order table with the corresponding customer ID
INSERT INTO [Order] (OrderDate, CustomerID)
VALUES ('2023-04-25', @CustomerID);

-- Retrieve customer details from the Customer table
SELECT *
FROM Customer;

-- Retrieve customer details from the Order table along with their associated customer details
SELECT o.OrderID, o.OrderDate, c.CustomerName, c.Email, c.Phone
FROM [Order] o
JOIN Customer c ON o.CustomerID = c.CustomerID;

INSERT INTO Customer (CustomerName, Email, Phone)
VALUES ('Jane Smith', 'jane.smith@example.com', '555-5678');


DECLARE @CustomerID INT;
SET @CustomerID = SCOPE_IDENTITY();

INSERT INTO [Order] (OrderDate, CustomerID)
VALUES ('2023-04-24', @CustomerID);

-- Delete the customer from the Customer table
DELETE FROM Customer
WHERE CustomerID = 1;

-- Delete the orders associated with the customer from the Order table
DELETE FROM [Order]
WHERE CustomerID = 1;

-- Update the customer's details in the Customer table
UPDATE Customer
SET CustomerName = 'Jane Doe', Email = 'jane.doe@example.com', Phone = '555-7890'
WHERE CustomerID = 2;

-- Update the customer's details in the Order table
UPDATE [Order]
SET OrderDate='2023-04-20'
WHERE CustomerID = 2;

