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


/* DATEPART, DATANAME, DATETRUNC */
SELECT 
    OrderID,
    CreationTime,
    YEAR(CreationTime) Year,
    MONTH(CreationTime) MONTH,
    DAY(CreationTime) Day,
    --DATANAME(part, date)
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



