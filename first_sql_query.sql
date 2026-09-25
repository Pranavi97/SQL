-- first SQL commands query
SELECT DISTINCT TOP 2
    country,
    SUM(score) as total_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING SUM(score) > 400
ORDER BY country ASC

