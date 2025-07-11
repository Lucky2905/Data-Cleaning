SELECT * 
FROM employee_demographics
;

SELECT * 
FROM employee_demographics
ORDER BY first_name -- by default it is in ASC i.e ascending order
;

SELECT * 
FROM employee_demographics
ORDER BY first_name DESC
;

SELECT * 
FROM employee_demographics
ORDER BY gender
;

SELECT * 
FROM employee_demographics
ORDER BY age
;

SELECT * 
FROM employee_demographics
ORDER BY gender,age 
;


SELECT * 
FROM employee_demographics
ORDER BY gender,age DESC
;

SELECT * 
FROM employee_demographics
ORDER BY gender DESC,age 
;

-- If we use gender first instead of age, gender will not be used for ordering
SELECT * 
FROM employee_demographics
ORDER BY age , gender 
;

SELECT * 
FROM employee_demographics
ORDER BY 5,4 -- using col position to access the columns not recommended 
;



