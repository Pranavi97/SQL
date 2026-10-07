/*
    Ranking Function
    1. Integer based
        a. ROW_NUMBER()
        b. RANK()
        c. DENSE_RANK()
        d. NTILE()
    2. Percentage based



*/

-- rank the orders based on their sales from highest to lowest using ROW_NUMBER()
SELECT
    OrderID,
    ProductID,
    Sales,
    ROW_NUMBER() OVER(ORDER BY Sales DESC) Sales_RANK_ROW
FROM Sales.Orders

-- RANK()
SELECT *
FROM(
    SELECT
        OrderID,
        ProductID,
        Sales,
        RANK() OVER(PARTITION BY ProductID ORDER BY Sales DESC) Sales_RANK
    FROM Sales.Orders
)t
GROUP BY Sales_RANK


-- DENSE_RANK()
SELECT
    OrderID,
    ProductID,
    Sales,
    DENSE_RANK() OVER(ORDER BY Sales DESC) sales_dense_rank
FROM Sales.Orders

-- NTILE()
SELECT
    OrderID,
    ProductID,
    Sales,
    NTILE(1) OVER(ORDER BY Sales DESC) OneBucket,
    NTILE(2) OVER(ORDER BY Sales DESC) TwoBucket,
    NTILE(3) OVER(ORDER BY Sales DESC) ThreeBucket,
    NTILE(4) OVER(ORDER BY Sales DESC) FourBucket
FROM Sales.Orders


/* Integer based RANK functions */
SELECT
    OrderID,
    ProductID,
    Sales,
    ROW_NUMBER() OVER(ORDER BY Sales DESC) Sales_RANK_ROW,
    RANK() OVER(PARTITION BY ProductID ORDER BY Sales DESC) Sales_RANK,
    DENSE_RANK() OVER(ORDER BY Sales DESC) sales_dense_rank,
    NTILE(4) OVER(ORDER BY Sales DESC) FourBucket
FROM Sales.Orders

-- find the top highrdt sales for each product
SELECT *
FROM(
    SELECT
        OrderID,
        ProductID,
        Sales,
        ROW_NUMBER() OVER(PARTITION BY ProductID ORDER BY Sales DESC) rank_by_product
    FROM Sales.Orders
)t
WHERE rank_by_product=1

-- BOTTOM N ANALYSIS
-- find the lowest 2 customers based on their total sales 
SELECT *
FROM(
    SELECT
        CustomerID,
        SUM(Sales) TotalSales,
        ROW_NUMBER() OVER(ORDER BY SUM(Sales)) RankCustomers
    FROM Sales.Orders
    GROUP BY CustomerID
)t
WHERE RankCustomers <=2

-- Assign unique IDs to the rows of the orders archive table

SELECT 
    ROW_NUMBER() OVER(ORDER BY OrderID, OrderDate) UniqueID,
    *
FROM Sales.OrdersArchive
