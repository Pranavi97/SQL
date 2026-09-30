/* String functions  */

-- concat

SELECT 
    first_name,
    country,
CONCAT(first_name, ' : ',country) AS name_country
FROM customers

/* UPPER and LOWER functions */
SELECT 
    first_name,
    country,
    CONCAT(first_name, ' : ',country) AS name_country,
    UPPER(first_name) AS Upper_Case,
    LOWER(country) AS Lower_Case
FROM customers


/* Trim */
SELECT 
    first_name,
    country,
    CONCAT(first_name, ' : ',country) AS name_country,
    UPPER(first_name) AS Upper_Case,
    LOWER(country) AS Lower_Case,
    TRIM(first_name) AS trim_value
FROM customers

/* detect trimming value and length of the value*/
SELECT 
    first_name,
    LEN(first_name) AS l
FROM customers
WHERE first_name != TRIM(first_name)

/* Replace */
SELECT 
    first_name,
    REPLACE(first_name, ' ', '-') AS replaced_value
FROM customers
WHERE first_name != TRIM(first_name)


/* LEFT and RIGHT functions */
/* LEFT(value, no of chars) */
SELECT 
    first_name,
    LEFT(TRIM(first_name), 2) AS left_chars,
    RIGHT(first_name, 2) AS right_chars
FROM customers

/* SUBSTRING */
/* SUBSTRING(value, start, length) */
SELECT 
    first_name,
    SUBSTRING(first_name, 3, LEN(TRIM(first_name))) AS substring_names
FROM customers

/* retrive a list of customers first names removing the first character */

SELECT 
    first_name,
    SUBSTRING(first_name, 2, LEN(TRIM(first_name))) AS substring_names
FROM customers