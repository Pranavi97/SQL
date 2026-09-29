-- left join
-- return all the data from left table and matching data from the right table and order is important

-- exp Get all the customers along with their orders including those without orders

SELECT *
FROM customers;

SELECT *
FROM orders


-- exp1
SELECT *
FROM customers
LEFT JOIN orders
ON customers.id=orders.customer_id

-- exp2
SELECT 
    c.id,
    o.order_id,
    c.country
FROM customers AS c
LEFT JOIN orders AS o
ON c.id=o.customer_id


-- RIGHT JOIN
-- return everything from right table and matching data from left table
--exp1
SELECT *
FROM customers
RIGHT JOIN orders
ON customers.id=orders.customer_id

-- exp2
SELECT 
    c.id,
    o.order_id,
    c.country
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id=o.customer_id