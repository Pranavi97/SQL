-- Display the full name of customers in a single field
-- by merging their first and last names,
-- and add 10 bonus points to each customer's score

SELECT 
    CustomerID,
    FirstName,
    LastName,
    Score,
    --COALESCE(LastName, '') lastname_2,
    FirstName + ' ' + COALESCE(LastName, '') AS full_name,
    COALESCE(Score, 0)  + 10 AS ScoreWithBonus
FROM Sales.Customers


-- sort the customers from lowest to highest scores,
-- with nulls appearing last

SELECT 
    CustomerID,
    Score,
    --coalesce(Score,99999)
    case when Score IS null then 1 else 0 end flag
FROM Sales.Customers
ORDER BY case when Score IS null then 1 else 0 end, Score


-- nullif
-- find the sales price for each order by dividing sales by quantity 
SELECT 
    OrderID,
    Sales,
    Quantity,
    Sales/Quantity AS price
FROM Sales.Orders

/*

25:11 PM
Started executing query at  Line 30
Msg 8134, Level 16, State 1, Line 30
Divide by zero error encountered.
2:25:11 PM
Total execution time: 00:00:00.011

*/

SELECT 
    OrderID,
    Sales,
    Quantity,
    -- Sales/Quantity AS price
    Sales / NULLIF(Quantity, 0) AS price
FROM Sales.Orders

/* use case of null with left and right joins */
/* list all details for customers who have not placed any orders */
SELECT 
    c.*,
    o.OrderID
FROM Sales.Customers AS c
LEFT JOIN Sales.Orders AS o  
ON c.CustomerID=o.OrderID
WHERE c.CustomerID IS NULL

