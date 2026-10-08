-- find the total sales per customer

WITH CTE_toal_customers AS
(
    SELECT 
        CustomerID,
        SUM(Sales) TotalSales
    FROM Sales.Orders
    GROUP BY CustomerID
)
--main query
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    cts.TotalSales
FROM Sales.Customers c
LEFT JOIN CTE_toal_customers cts
ON cts.CustomerID=c.CustomerID