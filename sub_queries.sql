-- sub queries under joins

-- show all customer details and find the total orders of each customers
-- main query
SELECT 
    c.*,
    o.TotalOrders
FROM Sales.Customers  AS c
LEFT JOIN(
    SELECT 
        CustomerID,
        COUNT(*) TotalOrders
    FROM Sales.Orders 
    GROUP BY CustomerID
)o
ON c.CustomerID=o.CustomerID


-- where clause
-- subquery must be scalar value
-- find the products that have a price higher than the average price of all products

SELECT 
    ProductID,
    Price
FROM Sales.Products
WHERE Price > 
    (
        select AVG(Price) FROM sales.Products
    )

-- IN ope
-- show the details of orders made by customers in germany


SELECT 
    *
FROM Sales.Orders
WHERE CustomerID IN (
        SELECT 
            CustomerID
        FROM Sales.Customers
        WHERE Country = 'Germany'
)

-- ANY and ALL
-- find female employees whose salaries are greater than the salaries of any male employees
SELECT 
    EmployeeID,
    FirstName,
    Salary
FROM Sales.Employees
WHERE Gender = 'F' AND Salary > ANY(
    SELECT 
        Salary
    FROM Sales.Employees
    WHERE Gender='M'
)


-- find female employees whose salaries are greater than the salaries of all male employees
SELECT 
    EmployeeID,
    FirstName,
    Salary
FROM Sales.Employees
WHERE Gender = 'F' AND Salary > ALL(
    SELECT 
        Salary
    FROM Sales.Employees
    WHERE Gender='M'
)

/*
    Dependancy sub queries
    1. Non-correlated
    2. Correlated
*/
-- correlated
-- find all the customer details and find the total orders of each products
SELECT
    *,
    (
        SELECT 
            COUNT(*) 
        FROM Sales.Orders o
        WHERE c.CustomerID=o.CustomerID
    ) TotalOrders
FROM Sales.Customers c

-- correlted exists operator
-- show the details of orders made by customers in germany

SELECT 
    *
FROM Sales.Orders o
WHERE not exists (
    SELECT 
        1
    FROM Sales.Customers c
    WHERE Country='Germany' AND o.CustomerID=c.CustomerID
)






