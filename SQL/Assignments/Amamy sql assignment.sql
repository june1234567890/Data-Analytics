--List all customers along with the number of orders they’ve placed.

SELECT c.customer_id, c.name, COUNT(o.order_id) AS order_count
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;



--Find customers who haven’t placed any orders.

SELECT c.customer_id, c.name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


--Find orders that were placed by unknown customers (those not in the customer list).

SELECT o.order_id, o.customer_id, o.amount
FROM Orders o
LEFT JOIN Customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;



--Calculate the total amount spent per customer.

SELECT c.customer_id, c.name, SUM(o.amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;


--Show a combined list of all customers and all orders (even unmatched ones).

SELECT c.customer_id, c.name, o.order_id, o.amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;