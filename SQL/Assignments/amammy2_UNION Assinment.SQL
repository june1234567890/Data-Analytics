
Task 2: Combining Product Data

CREATE TABLE ProductsA (
    ProductID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

CREATE TABLE ProductsB (
    ProductID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

-- Inserting data into ProductsA table
INSERT INTO ProductsA (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1200.00),
(2, 'Smartphone', 800.00),
(3, 'Tablet', 400.00),
(4, 'Headphones', 150.00);

-- Inserting data into ProductsB table
INSERT INTO ProductsB (ProductID, ProductName, Price) VALUES
(3, 'Tablet', 400.00),
(4, 'Headphones', 150.00),
(5, 'Smartwatch', 250.00),
(6, 'Camera', 700.00);


--To combine all products from both ProductsA and ProductsB, including duplicates.

SELECT ProductID, ProductName, Price
FROM ProductsA

UNION ALL

SELECT ProductID, ProductName, Price
FROM ProductsB;
