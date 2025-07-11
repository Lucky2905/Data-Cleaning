-- HAVING V/S WHERE

SELECT gender, AVG(age)
FROM employee_demographics
WHERE AVG(age)>40
GROUP BY gender
;/*will give error*/
/*
This query will give an error because you can't use an aggregate function like AVG(age) in the WHERE clause.
Aggregate functions (e.g., AVG, SUM, MAX) can only be used in SELECT, HAVING, or ORDER BY clauses, not in WHERE.
"WHERE filters rows before grouping thus AVG will not be used; use HAVING to filter after aggregates like AVG."
*/


SELECT gender, AVG(age) 
FROM employee_demographics
GROUP BY gender
HAVING AVG(age)>40
;

SELECT occupation,ROUND(AVG(salary),2) -- ROUND(AVG(age), 2) rounds the average age to 2 decimal places.  
FROM employee_salary
WHERE occupation LIKE '%Manager%' -- filters at row level
GROUP BY occupation
HAVING ROUND(AVG(salary),2) > 75000 /*filter at aggregate function level so if we want to filter 
aggregate function columns we have to use HAVING clause
*/
;
/*Having is only gonna work for aggregate function after the group by actually runs*/




