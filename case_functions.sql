/*
    create report showing total sales for each of the following categories:
    high(sales over 50), medium(sales 21-50), and low(sales 20 or less)
    sort the categories from highet sales to lowest
CASE FUNCTION
*/
/* Categorisation */
SELECT
    Category,
    SUM(Sales) AS total_sales
FROM (
SELECT
    OrderID,
    Sales,
    CASE 
        when Sales > 50 then 'High'
        when Sales > 20 then 'medium'
        else 'low'
    END Category
FROM Sales.Orders
)t
GROUP BY Category
ORDER BY total_sales DESC

/* Mapping */
/*
    retrive employee details with gender displayed as full text 
*/

SELECT 
    EmployeeID,
    FirstName,
    LastName,
    Gender,
    case 
        when Gender = 'F' then 'Female'
        when Gender = 'M' then 'Male'
        else 'Not available'
    END gender_display
FROM Sales.Employees

-- retrive customer details with abbrevated country code

SELECT
    CustomerID,
    FirstName,
    LastName,
    Country,
    case
        when Country = 'Germany' then 'DE'
        when Country = 'USA' then 'US'
        else 'Not available'
    END country_abbrivation
FROM Sales.Customers


--using one more syntax
SELECT
    CustomerID,
    FirstName,
    LastName,
    Country,
    case Country
        when 'Germany' then 'DE'
        when 'USA' then 'US'
        else 'Not available'
    END country_abbrivation
FROM Sales.Customers

SELECT DISTINCT Country
FROM Sales.Customers

-- handling nulls

/*
    find the average scores of customers and treat nulls as 0
    additionally provide details such customerID and lastname

*/

SELECT 
    CustomerID,
    LastName,
    Score,
    AVG(case
        when Score IS NULL then 0
        else Score
    END) OVER() avg_score
FROM Sales.Customers

/* conditional aggregation */
-- count how many times each customer has made an order with sales greater than 30

SELECT 
    CustomerID,
    SUM(case 
        WHEN Sales > 30 then 1
        else 0
    END) sales_flags,
    COUNT(*) total_orders
FROM Sales.Orders
GROUP BY CustomerID