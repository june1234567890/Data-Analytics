-- 1. Retrieve all transactions with valid customer and product data.
-- Order by transaction date to understand the chronological flow of purchases.

SELECT * 
FROM retail
ORDER BY date;

-- 2. Clean the dataset by ensuring that numeric fields like Quantity,
-- Price per Unit, and Total Amount are properly formatted. 
-- Remove duplicates or null values if any exist.

SELECT DISTINCT 
 Quantity, 
 `Price per Unit`, 
 `Total Amount`
FROM retail;
 
-- Check if any NULLs values

SELECT  
Quantity, 
 `Price per Unit`, 
 `Total Amount`
FROM retail

WHERE 
Quantity IS NULL 
OR `Price per Unit` IS NULL 
OR `Total Amount` IS NULL;



-- 3. Calculate the total and average revenue for each product category.
-- Which categories bring in the most and least revenue?

SELECT 
    `Product Category`,
    SUM(`Total Amount`) AS Total_Revenue,
    AVG(`Total Amount`) AS Average_Revenue
FROM retail
GROUP BY `Product Category`
ORDER BY Total_Revenue DESC;


-- 4. Analyze the monthly sales trend over the entire dataset period.
-- Summarize total revenue per month and order the results chronologically.

SELECT 
    YEAR(Date) AS Year,
    MONTH(Date) AS Month,
    SUM(`Total Amount`) AS Total_Revenue
FROM retail
GROUP BY Year, Month
ORDER BY Year, Month;


-- 5. Identify the top 10 customers by total spending.
-- Rank customers based on how much they’ve spent across all transactions.

SELECT 
    `Customer ID`,
    SUM(`Total Amount`) AS Total_Spending
FROM retail
GROUP BY `Customer ID`
ORDER BY Total_Spending DESC
LIMIT 10;



-- 6. Calculate the average transaction value for each customer.
-- How much does each customer spend per transaction on average?

SELECT 
    `Customer ID`,
    AVG(`Total Amount`) AS Average_Transaction_Value
FROM retail
GROUP BY `Customer ID`
ORDER BY Average_Transaction_Value DESC;


-- 7. Group customers by gender and age brackets (e.g., 18–25, 26–35, 36–50, etc.).
-- Summarize total revenue and transaction count for each group.

SELECT 
    `Customer ID`,
    Gender,
    Age,
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 50 THEN '36-50'
        ELSE '51+'
    END AS Age_Group
FROM retail
WHERE Age BETWEEN 18 AND 50
GROUP BY `Customer ID`, Gender, Age
ORDER BY Age;



-- 8. Compare the number of one-time buyers versus repeat buyers.
-- Group customers by purchase frequency to determine repeat behavior.

SELECT 
    Purchase_Count,
    COUNT(*) AS Number_of_Customers
FROM (
    SELECT 
        `Customer ID`,
        COUNT(*) AS Purchase_Count
    FROM retail
    GROUP BY `Customer ID`
) AS Customer_Purchases
GROUP BY Purchase_Count
ORDER BY Purchase_Count;


-- 9. Identify inactive customers who have not made a purchase in the last 6 months.
-- Use the most recent date in the dataset as the reference point.

SELECT 
    `Customer ID`,
    MAX(Date) AS Last_Purchase_Date
FROM retail
GROUP BY `Customer ID`
HAVING Last_Purchase_Date < (
    SELECT MAX(Date) FROM retail
) - INTERVAL 6 MONTH;


-- 10. Perform RFM (Recency, Frequency, Monetary) analysis for customer segmentation.
-- Recency: Days since last purchase; Frequency: Number of purchases; Monetary: Total amount spent.


-- Step 1: Calculate RFM metrics for each customer

SELECT 
    `Customer ID`,
    
    -- Recency: Days since last purchase
    
    DATEDIFF(
        (SELECT MAX(Date) FROM retail), 
        MAX(Date)
    ) AS Recency,
    
    -- Frequency: Number of purchases
    
    COUNT(*) AS Frequency,
    
    -- Monetary: Total amount spent
    
    SUM(`Total Amount`) AS Monetary
FROM retail
GROUP BY `Customer ID`
ORDER BY `Customer ID`;



-- 11. Find the product categories with the highest average quantity per transaction.
-- Which product types are purchased in bulk?

SELECT 
    `Product Category`,
    AVG(Quantity) AS Average_Quantity
FROM retail
GROUP BY `Product Category`
ORDER BY Average_Quantity DESC;


-- 12. Identify the busiest sales day of the week.
-- Which day(s) consistently have the highest transaction volume or revenue?

SELECT 
    DAYNAME(Date) AS Day_of_Week,
    COUNT(*) AS Transaction_Count,
    SUM(`Total Amount`) AS Total_Revenue
FROM retail
GROUP BY Day_of_Week
ORDER BY Transaction_Count DESC, Total_Revenue DESC;


-- 13. Calculate total revenue and average spend per transaction by gender.
-- Are there differences in spending patterns across genders?

SELECT 
    Gender,
    SUM(`Total Amount`) AS Total_Revenue,
    AVG(`Total Amount`) AS Avg_Spend_Per_Transaction,
    COUNT(*) AS Number_of_Transactions
FROM retail
GROUP BY Gender;



-- 14. Find the top 5 most frequently purchased product categories.
-- Based on number of transactions involving each category.

SELECT 
    `Product Category`,
    COUNT(*) AS Transaction_Count
FROM retail
GROUP BY `Product Category`
ORDER BY Transaction_Count DESC
LIMIT 5;


-- 15. Determine the percentage of total revenue contributed by eachage group.
-- Which customer age brackets are most valuable to the business?

-- Step 1: Categorize customers into age brackets and calculate revenue per group

SELECT 
  CASE 
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 50 THEN '36-50'
    WHEN Age > 50 THEN '51+'
    ELSE 'Unknown'
  END AS Age_Group,
  
  SUM(`Total Amount`) AS Group_Revenue,
  
  ROUND(SUM(`Total Amount`) * 100.0 / 
        (SELECT SUM(`Total Amount`) FROM retail), 2) AS Revenue_Percentage
FROM retail
GROUP BY Age_Group
ORDER BY Revenue_Percentage DESC;