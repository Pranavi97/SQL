-- SQL combinining data

-- SQL joins

-- select data from table one and table two at a time
SELECT *
FROM customers;

SELECT *
FROM orders

-- INNER JOIN only matching data from two tables

-- get all customers along with their orders but only for customers who have placed an order
-- exp 1
SELECT * 
FROM customers
INNER JOIN orders
ON id=customer_id

-- exp 2
SELECT 
    first_name,
    order_id,
    sales
FROM customers
INNER JOIN orders
ON id=customer_id

-- exp 3
SELECT 
    customers.first_name,
    orders.order_id,
    sales
FROM customers
INNER JOIN orders
ON id=customer_id

-- use alias for tables names if we use multiple tables

SELECT 
    c.first_name,
    o.order_id,
    sales
FROM customers AS c
INNER JOIN orders AS o
ON id=customer_id


-- FULL JOIN
SELECT 
    c.first_name,
    o.order_id,
    sales
FROM customers AS c
FULL JOIN orders AS o
ON id=customer_id


--CROSS JOIN(Cartesian Join)
-- generate all possible combinations of customers and orders

SELECT *
FROM customers
CROSS JOIN orders