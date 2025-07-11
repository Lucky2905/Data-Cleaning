-- LIKE Statement : Can use this to look for specific patterns/sequence which may not be exact match 
-- % (means anything) and _ (means specificValue)
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'Jer%' # this means that first_name is starts with Jer and can have anything thing after that
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE '%er%' # this means that first_name can have anthing before and after ""er"" 
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%' 
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE '%a%' 
;


SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__' # here we used two underscores after A that means that the value starts with an A and has two character after that no more no less.
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%' # here we used two underscores after A that means that the value starts with an A and has two character after then it can have anything after that
;

SELECT *
FROM employee_demographics
WHERE birth_date LIKE '198%'
;
