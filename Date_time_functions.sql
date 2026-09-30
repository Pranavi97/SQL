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
    *
FROM Sales.Orders
WHERE MONTH(OrderDate)=2  
