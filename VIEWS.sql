

/*.  Find the running total of sales for each month */
CREATE VIEW monthly_summary AS(
    SELECT 
        DATETRUNC(MONTH, OrderDate) AS orderMonth,
        SUM(Sales) TotalSales,
        COUNT(OrderID) TotalOrders,
        SUM(Quantity) TotalQuantities
    FROM Sales.Orders
    GROUP BY DATETRUNC(MONTH, OrderDate)
)

SELECT *
FROM monthly_summary


-- case 2
/* TASK:
   Create a view that combines details from Orders, Products, Customers, and Employees.
   This view abstracts the complexity of multiple table joins.
*/
CREATE VIEW sales.Order_details AS(
SELECT 
    o.OrderID,
    o.OrderDate,
    o.Sales,
    o.Quantity,
    p.Product,
    p.Category,
    c.FirstName+' '+coalesce(c.LastName, '') CustomerName,
    c.Country,
    e.FirstName+' '+coalesce(e.LastName, '') EmployeeName,
    e.Department
FROM Sales.Orders AS o
LEFT JOIN Sales.Products AS p
ON p.ProductID=o.ProductID
LEFT JOIN Sales.Customers AS c  
ON c.CustomerID=o.CustomerID
LEFT JOIN Sales.Employees AS e  
ON e.EmployeeID=o.SalesPersonID
)

SELECT *
FROM Sales.Order_details