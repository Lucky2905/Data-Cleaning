-- LIMITS & ALIASING

-- LIMIT
SELECT *
FROM employee_demographics
LIMIT 3
;

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3
;

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2,1 /*THIS MEANS START AT POSITION 2 AND TAKE 1 ROW AFTER THAT*/
;

-- ALIASING
SELECT gender,AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age>40
;

SELECT gender,AVG(age) avg_age -- even if we don't explicitly write 'AS' it is there 
FROM employee_demographics
GROUP BY gender
HAVING avg_age>40
;


