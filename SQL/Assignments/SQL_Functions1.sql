-- 1: Create the Sales Table
CREATE TABLE sales (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    quantity INT,
    price_per_unit DECIMAL(10, 2)
);

--2: Insert Sample Data
INSERT INTO sales (id, product_name, quantity, price_per_unit) VALUES
(1, 'Laptop', 3, 1200.00),
(2, 'Smartphone', 7, 800.00),
(3, 'Desk Chair', 10, 150.00),
(4, 'Monitor', 2, 300.00),
(5, 'Printer', 6, 250.00);

-- Section 3: Aggregation with COUNT and SUM


-- 4. Count the total number of sales records

SELECT COUNT(*) AS total_sales_records FROM sales;


-- 5. Count how many products have a quantity greater than 5

SELECT COUNT(*) AS products_with_quantity_gt_5 FROM sales WHERE quantity > 5;


-- 6. Find the total quantity of products sold

SELECT SUM(quantity) AS total_quantity_sold FROM sales;


-- 7. Calculate the total sales amount across all products

SELECT SUM(quantity * price_per_unit) AS total_sales_amount FROM sales;


-- 8. Calculate the total sales amount for products where the price_per_unit is greater than 1000

SELECT SUM(quantity * price_per_unit) AS high_value_sales_amount
FROM sales
WHERE price_per_unit > 1000;
