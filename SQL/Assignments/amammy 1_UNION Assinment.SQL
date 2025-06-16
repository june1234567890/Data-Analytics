
Task 1: Combining Customer Data

CREATE TABLE OnlinePurchases (
    CustomerID INT,
    CustomerName VARCHAR(100),
    PurchaseAmount DECIMAL(10, 2)
);

CREATE TABLE InStorePurchases (
    CustomerID INT,
    CustomerName VARCHAR(100),
    PurchaseAmount DECIMAL(10, 2)
);



-- Inserting data into OnlinePurchases table
INSERT INTO OnlinePurchases (CustomerID, CustomerName, PurchaseAmount) VALUES
(1, 'Alice Johnson', 350.00),
(2, 'Bob Smith', 420.00),
(3, 'Catherine Lee', 150.00),
(4, 'Daniel Kim', 500.00);

-- Inserting data into InStorePurchases table
INSERT INTO InStorePurchases (CustomerID, CustomerName, PurchaseAmount) VALUES
(2, 'Bob Smith', 200.00),
(3, 'Catherine Lee', 300.00),
(5, 'Emily Davis', 600.00),
(6, 'Frank Moore', 120.00);



--To combine customer data from OnlinePurchases and InStorePurchases without duplicates (based on CustomerID and CustomerName),

SELECT CustomerID, CustomerName, PurchaseAmount
FROM OnlinePurchases

UNION

SELECT CustomerID, CustomerName, PurchaseAmount
FROM InStorePurchases;