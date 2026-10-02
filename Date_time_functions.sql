/* DATE and TIME funtion */
/* Part extractio: we have 7 functions */

/* DAY, MONTH, YEAR funtions */
USE SalesDB

SELECT 
    OrderID,
    CreationTime,
    YEAR(CreationTime) Year,
    MONTH(CreationTime) MONTH,
    DAY(CreationTime) Day
FROM Sales.Orders


/* DATEPART, DATANAME, DATETRUNC, EOMONTH */
SELECT 
    OrderID,
    CreationTime,
    YEAR(CreationTime) Year,
    MONTH(CreationTime) MONTH,
    DAY(CreationTime) Day,
    --EOMONTH(date)
    EOMONTH(CreationTime) eom_name,
    --DATETRUNC(part, date)
    DATENAME(MM,CreationTime) date_name,
    DATENAME(DAY,CreationTime) day_name,
     --DATETRUNK(part, date)
    DATETRUNC(MM,CreationTime) date_name_trunc,
    DATETRUNC(DAY,CreationTime) day_name_trunc,
    --DATEPART(part, date)
    DATEPART(year,CreationTime) year_dp,
    DATEPART(MM, CreationTime) month_dp,
    DATEPART(QUARTER, CreationTime) QUARTER_dp,
    DATEPART(WEEK, CreationTime) week_dp
FROM Sales.Orders


/* how many orders placed each month */
SELECT 
    MONTH(OrderDate) month,
    COUNT(*) no_of_orders
FROM Sales.Orders
GROUP BY MONTH((OrderDate))

/* */
/* show all orders that were placed during the month of february */

SELECT 
    OrderID,
    CreationTime,
    FORMAT(CreationTime, 'dd') dd,
    FORMAT(CreationTime, 'ddd') ddd
FROM Sales.Orders
--WHERE MONTH(OrderDate)=2  

/* 
FORMAT
show creation time using the following format:
Day wed jan Q1 2025 12:34:56 PM
*/

SELECT 
    OrderID,
    CreationTime,
    --'Day ' + FORMAT(CreationTime, 'ddd') ddd,
    --'Day ' + FORMAT(CreationTime, 'ddd MMM') ddd
    'Day ' + FORMAT(CreationTime, 'ddd MMM') + ' Q' + DATENAME(QUARTER, CreationTime) + ' ' + FORMAT(CreationTime, 'yyyy hh:mm:ss tt') AS customerFormat
    
FROM Sales.Orders


/* 
CONVERT
CAST
*/
SELECT 
    OrderID,
    CreationTime,
    CAST(CreationTime AS varchar),
    CAST(CreationTime AS date),
    CONVERT(date, CreationTime, 32)
FROM Sales.Orders

/* DateAdd */
SELECT 
    OrderID,
    OrderDate,
    DATEADD(YEAR, 3, OrderDate) AS adding_3_years
FROM Sales.Orders 

/*DATEDIFF*/
/* Calculate the age of employees */
SELECT 
    EmployeeID,
    BirthDate,
    DATEDIFF(YEAR, BirthDate, GETDATE()) Age
FROM Sales.Employees

/*  find the average shipping duration in days for each month */

SELECT 
    MONTH(OrderDate),
    AVG(DATEDIFF(DAY, OrderDate, ShipDate)) AS day_to_ship
FROM Sales.Orders
GROUP BY(MONTH(OrderDate))

/*  find the number of days between each order and previous order */

SELECT 
    OrderID,
    OrderDate
FROM Sales.Orders


-- ISDATEE
SELECT 
    OrderID,
    OrderDate,
    ISDATE('OrderDate') is_it_a_date
FROM Sales.Orders
