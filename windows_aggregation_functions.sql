/* Windows Aggregation functions */
/*

    Aggregates set of values and return a single aggregated value
    Rules:
    1. expressions 
        a. all functions should be numbers
        b. For Count() we can use all the data types
    2. all clauses are optional

    UseCases:
    1. overall analysis
    2. total per group analysis
    3. part to whole analysis
    4. comparision analysis [average, extreme: highest/lowest]
    5. identify duplicates
    6. Outlier detection
    7. running total
    8. rolling total
    9. moving avg



*/
-- find the total sales across all orders

SELECT 
    SUM(Sales) sum_of_sales
FROM Sales.Orders

-- find the total sales across all orders for each product
SELECT 
    ProductID,
    SUM(Sales) sum_of_sales
FROM Sales.Orders
GROUP BY ProductID

-- find the total sales for each product, 
-- additionally provide details such order id and order date 
SELECT 
    OrderID,
    OrderDate,
    ProductID,
    SUM(Sales) sum_of_sales
FROM Sales.Orders
GROUP BY 
    OrderID,
    OrderDate,
    ProductID

/* for the above example we can't do aggregations and provide details at the same time accuretly using GROUP BY. */

-- WINDOW. OVER()
SELECT 
    SUM(Sales) OVER() sum_of_sales
FROM Sales.Orders

SELECT 
    OrderID,
    OrderDate,
    ProductID,
    SUM(Sales) OVER(PARTITION BY ProductID) sum_of_sales_by_products
FROM Sales.Orders

/* rank each order bbased on their sales from highest to lowest  additionally provide order id and order date*/
SELECT 
    OrderID,
    OrderDate,
    Sales,
    RANK() OVER(ORDER BY Sales DESC) RankSales
FROM Sales.Orders

-- Window FRAME clause
SELECT 
    OrderID,
    OrderDate,
    OrderStatus,
    Sales,
    SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate
    ROWS BETWEEN CURRENT ROW AND 2 following) total_sales,
    SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate
    ROWS BETWEEN CURRENT ROW AND unbounded following) total_sales2,
    SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate
    ROWS BETWEEN unbounded preceding AND unbounded following) total_sales3
FROM Sales.Orders

/* Running window and Rolling window functions */

/* running window or moving window */
-- calculate moving average of sales for each product over time
SELECT 
    OrderID,
    ProductID,
    OrderDate,
    Sales,
    AVG(Sales) OVER(PARTITION BY ProductID) AvgByProduct,
    AVG(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate) movingAvg,
    AVG(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate ROWS BETWEEN unbounded preceding AND CURRENT ROW) runningAvg,
    -- calculate moving avg of sales for each product over time, including only the next order
    AVG(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate ROWS BETWEEN CURRENT ROW AND 1 following) rollingAvg
FROM Sales.Orders