-- anti joins
-- left anti join: returns rows from the left table that has NO MATCH of right table
-- exp1: get all the customers who haven't place any order
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id=o.customer_id
WHERE o.customer_id IS NULL

-- right anti join
SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id=o.customer_id
WHERE c.id IS NULL

-- get right anti join using left anti join

SELECT *
FROM orders AS o
LEFT JOIN customers AS c
ON c.id=o.customer_id
WHERE c.id IS NULL

-- full anti join

SELECT *
FROM customers AS c 
FULL JOIN orders AS o  
ON c.id=o.customer_id
WHERE o.customer_id IS NULL OR c.id IS NULL

-- get all customers along with their orders but only for customers who have placed an order without inner join
SELECT *
FROM customers AS c  
LEFT JOIN orders AS o  
ON c.id=o.customer_id
WHERE o.customer_id IS NOT NULL

SELECT *
FROM customers AS c  
FULL JOIN orders AS o  
ON c.id=o.customer_id
WHERE o.customer_id IS NOT NULL AND c.id IS NOT NULL
