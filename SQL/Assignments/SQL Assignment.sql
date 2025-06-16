-- Step 1: Create the database if it doesn't already exist
--CREATE DATABASE IF NOT EXISTS store;

-- Step 2: Use the store database
--USE store;

-- Step 3: Create the sales table
CREATE TABLE sales (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    quantity INT,
    price_per_unit DECIMAL(10, 2)
);

-- Insert sample records into the sales table
INSERT INTO sales (id, product_name, quantity, price_per_unit)
VALUES
(1, 'Laptop', 3, 750.00),
(2, 'Smartphone', 5, 300.00),
(3, 'Desk Chair', 2, 120.50),
(4, 'Wireless Mouse', 10, 25.75),
(5, 'Monitor', 4, 199.99);


 --Count the total number of sales records in the table
SELECT COUNT(*) AS total_records FROM sales;

--Count how many products have a quantity greater than 5:
SELECT COUNT(*) AS products_with_quantity_gt_5
FROM sales
WHERE quantity > 5;

 --Find the total quantity of products sold:
SELECT SUM(quantity) AS total_quantity_sold FROM sales;

--Calculate the total sales amount across all products:
SELECT SUM(quantity * price_per_unit) AS total_sales_amount FROM sales;

--Calculate the total sales amount for products where the price_per_unit is greater than 1,000:
SELECT SUM(quantity * price_per_unit) AS high_value_sales_amount
FROM sales
WHERE price_per_unit > 1000;
