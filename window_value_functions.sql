/*
    VALUE Functions
    1. LEAD(exp, offset, default) -next row
    2. LAG(exp, offset, default) - previous row
    3. FIRST_VALUE()
    4. LAST_VALUE()



*/

/* LEAD, LAG */
-- analyse the month-over-month performance by finding the percentage change 
-- in sales between the current and previous months
SELECT 
    *,
    CurrentMonthSales - PreviousMonthSales AS MOM_performance,
    ROUND(CAST(CurrentMonthSales - PreviousMonthSales AS float)/PreviousMonthSales *100, 1) AS MOM_percentage,
    CurrentMonthSales - NextMonthSales AS MOM_Change
FROM(
    SELECT 
        MONTH(OrderDate) orderMonth,
        SUM(Sales) CurrentMonthSales,
        LAG(SUM(Sales)) OVER(ORDER BY MONTH(OrderDate)) PreviousMonthSales,
        LEAD(SUM(Sales)) OVER(ORDER BY MONTH(OrderDate)) NextMonthSales
    FROM Sales.Orders
    GROUP BY 
        MONTH(OrderDate)
)t

-- Customer retentional analysis
--in order to analyse customer loyality,
--rank customers based on the avergae days between their orders
SELECT 
    CustomerID,
    AVG(DaysUntilNextOrder) AvgDays,
    RANK() OVER(ORDER BY COALESCE(AVG(DaysUntilNextOrder), 99 )) RankAvg

FROM(
    SELECT
        OrderID,
        CustomerID,
        OrderDate CurrentOrderDate,
        LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate) NextOrder,
        DATEDIFF(DAY, OrderDate, LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate) ) DaysUntilNextOrder
    FROM Sales.Orders
)t
GROUP BY CustomerID



/* First_value and Last_value */

-- find the lowest and highest sales for each product
SELECT
    OrderID,
    ProductID,
    Sales,
    FIRST_VALUE(Sales) OVER(PARTITION BY ProductID ORDER BY Sales) LowestSales,
    LAST_VALUE(Sales) OVER(PARTITION BY ProductID ORDER BY Sales ROWS BETWEEN CURRENT ROW AND UNBOUNDED following) HighestValue,
    FIRST_VALUE(Sales) OVER(PARTITION BY ProductID ORDER BY Sales DESC) HighestValueWithFv
FROM Sales.Orders
