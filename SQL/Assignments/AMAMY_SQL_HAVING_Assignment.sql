1.(i) Use CREATE to create the table shown below.

CREATE TABLE Products (
    id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    sales INT,
    profit INT,
    country VARCHAR(50)
);


(ii) Use INSERT INTO to insert the data into the table you created.

INSERT INTO Products (id, product_name, category, sales, profit, country) VALUES
(1, 'Smartphone', 'Electronics', 1000, 200, 'Kenya'),
(2, 'Sofa', 'Furniture', 1500, 300, 'South Sudan'),
(3, 'Headphones', 'Electronics', 800, 120, 'Congo'),
(4, 'Table', 'Furniture', 950, 180, 'Kenya'),
(5, 'Refrigerator', 'Appliances', 2000, 450, 'Congo'),
(6, 'T-Shirt', 'Clothing', 600, 150, 'South Sudan'),
(7, 'Laptop', 'Electronics', 2500, 600, 'Kenya'),
(8, 'Blender', 'Appliances', 700, 100, 'South Sudan'),
(9, 'Dress', 'Clothing', 900, 220, 'Congo'),


  2.Write an SQL query to find the total profit by category. Only include categories
where total profit is greater than 500.

SELECT category, SUM(profit) AS total_profit
FROM Products
GROUP BY category
HAVING SUM(profit) > 500;


   3.Write an SQL query to find total sales per country. Only include countries with
total sales above 2500.

SELECT country, SUM(sales) AS total_sales
FROM Products
GROUP BY country
HAVING SUM(sales) > 2500;


   4.Write an SQL query to find the average profit per category. Only show
categories with an average profit greater than 200.

SELECT country, SUM(sales) AS total_sales
FROM Products
GROUP BY country
HAVING SUM(sales) > 2500


   5.Write an SQL query to count the number of products per country. Only include
countries with more than 2 products.

SELECT country, COUNT(*) AS product_count
FROM Products
GROUP BY country
HAVING COUNT(*) > 2;