-- WHERE clause : Used to filter records or rows of data
-- SELECT statement : Used to help filter or select columns
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary
WHERE first_name = 'Leslie';/* = is a comparison operator*/

SELECT *
FROM employee_salary
WHERE salary >= 50000;/* >= is a comparison operator*/

SELECT *
FROM employee_salary
WHERE salary < 50000;

SELECT *
FROM employee_demographics
WHERE gender = 'Female';

SELECT *
FROM employee_demographics
WHERE gender != 'Female';


SELECT *
FROM employee_demographics
WHERE birth_date like '199%';


-- Logical Operators in WHERE clause : AND OR NOT --
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'Male'
;

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'Male'
;


SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'Male'
;



SELECT *
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age>55 
;

