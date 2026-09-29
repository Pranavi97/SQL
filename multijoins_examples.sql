/*
using sales DB. retrive a list of all orders, along with the related customer, product, and employee details, 
for each order, display:
-order id
-cutostomer's name
-product name
-sales amount
-product price
-salesperson's name
*/

SELECT * FROM Sales.Customers
SELECT * FROM Sales.Employees
SELECT * FROM Sales.Orders
SELECT * FROM Sales.OrdersArchive
SELECT * FROM Sales.Products


SELECT 
    o.OrderID,
    o.Sales,
    c.FirstName AS CustomerFirstname,
    c.LastName AS CustomerLastname,
    p.Product AS ProductName,
    p.Price,
    e.EmployeeID,
    e.FirstName AS EmployeeFirstname,
    e.LastName AS EmployeeLastname
FROM Sales.Orders AS o
LEFT JOIN Sales.Customers AS c
ON o.OrderID=c.CustomerID
LEFT JOIN Sales.Products AS p
ON o.ProductID=p.ProductID
LEFT JOIN Sales.OrdersArchive as s
ON o.SalesPersonID=s.SalesPersonID
LEFT JOIN Sales.Employees as e
ON o.SalesPersonID=e.EmployeeID
LEFT JOIN Sales.OrdersArchive AS a
ON o.ProductID=a.ProductID

