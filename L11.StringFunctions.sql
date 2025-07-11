-- String Functions
SELECT LENGTH('skyfall');

SELECT first_name,LENGTH(first_name)
FROM employee_demographics
ORDER BY LENGTH(first_name)
;

SELECT UPPER('sky');
SELECT LOWER('SKY');

SELECT first_name,UPPER(first_name)
FROM employee_demographics
ORDER BY 2
;

SELECT first_name,UPPER(first_name)
FROM employee_demographics
ORDER BY LENGTH(first_name)
;

-- TRIM : get rid of whitespaces
SELECT TRIM('                 sky        ');
SELECT LTRIM('                 sky        ');
SELECT RTRIM('                 sky        ');

SELECT first_name,LEFT(first_name,3)
FROM employee_demographics;


SELECT first_name,
LEFT(first_name,3),
RIGHT(first_name,3),
SUBSTRING(first_name,2,3),
birth_date,
SUBSTRING(birth_date,6,2) AS birth_month
FROM employee_demographics;

SELECT first_name,REPLACE(first_name,'a','z')
FROM employee_demographics;

SELECT LOCATE('x','Alexander');

SELECT first_name,LOCATE('An',first_name)
FROM employee_demographics;

SELECT first_name,last_name,
CONCAT(first_name,'  ',last_name) as full_name
FROM employee_demographics;