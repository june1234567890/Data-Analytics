
-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2),
    OrderDate DATE
);

-- Inserting data into Orders table
INSERT INTO Orders (OrderID, CustomerID, TotalAmount, OrderDate) VALUES
(1, 101, 250.00, '2023-01-01'),
(2, 102, 150.00, '2023-02-01'),
(3, 103, 500.00, '2023-03-01'),
(4, 101, 100.00, '2023-01-15'),
(5, 104, 600.00, '2023-04-01'),
(6, 102, 400.00, '2023-05-01'),
(7, 103, 300.00, '2023-06-01');

 --Write a query that retrieves the order details for customers who have placed an order with a TotalAmount greater than $400.

SELECT OrderID, CustomerID, TotalAmount, OrderDate
FROM Orders
WHERE CustomerID IN (
    SELECT DISTINCT CustomerID
    FROM Orders
    WHERE TotalAmount > 400
);


--Write a query that retrieves the OrderID, CustomerID, and TotalAmount for each order. Additionally, return the number of orders each customer has placed.

SELECT 
    OrderID, 
    CustomerID, 
    TotalAmount,
    (SELECT COUNT(*) 
     FROM Orders AS o2 
     WHERE o2.CustomerID = o1.CustomerID) AS NumberOfOrders
FROM Orders AS o1;


 --Write a query that retrieves customers and their total spending.

SELECT CustomerID, TotalAmount
FROM (
    SELECT CustomerID, SUM(TotalAmount) AS TotalAmount
    FROM Orders
    GROUP BY CustomerID
) AS total_spending;


--Task 4: Subquery in HAVING Clause

SELECT CustomerID, TotalAmount
FROM (
    SELECT CustomerID, SUM(TotalAmount) AS TotalAmount
    FROM Orders
    GROUP BY CustomerID
) AS customer_spending
WHERE TotalAmount > (
    SELECT AVG(TotalAmount)
    FROM Orders
);
 