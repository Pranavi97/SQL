/* SET operations*/
/* UNION operator : it will remove duplicates */
SELECT 
    FirstName,
    LastName
FROM Sales.Customers
UNION
SELECT 
    FirstName,
    LastName
FROM Sales.Employees

/* UNION ALL: results entire table and it will not remove duplicates */
SELECT
    FirstName,
    LastName
FROM Sales.Customers
UNION ALL
SELECT 
    FirstName,
    LastName
FROM Sales.Employees

/* Ecept (-)*/
SELECT 
    FirstName,
    LastName
FROM Sales.Employees
EXCEPT
SELECT
    FirstName,
    LastName
FROM Sales.Customers

/* Intersect*/
SELECT 
    FirstName,
    LastName
FROM Sales.Employees
Intersect
SELECT
    FirstName,
    LastName
FROM Sales.Customers

USE SalesDB
