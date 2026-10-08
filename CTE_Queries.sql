-- find the total sales per customer

WITH CTE_toal_customers AS
(
    SELECT 
        CustomerID,
        SUM(Sales) TotalSales
    FROM Sales.Orders
    GROUP BY CustomerID
)
--find last order
,CTE_last_order AS
(
    SELECT 
        CustomerID,
        MAX(OrderDate) AS LastOrder
    FROM Sales.Orders
    GROUP BY CustomerID
)
--main query
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    cts.TotalSales,
    cto.LastOrder
FROM Sales.Customers c
LEFT JOIN CTE_toal_customers cts
ON cts.CustomerID=c.CustomerID
LEFT JOIN CTE_last_order cto
ON cts.CustomerID=c.CustomerID