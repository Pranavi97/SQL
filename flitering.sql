-- name should end with n
SELECT *
FROM customers
where first_name LIKE '%n'

-- firstname persons have r anywhere in the name
SELECT *
FROM customers
WHERE first_name like '%r%'