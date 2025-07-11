-- Subqueries

SELECT * 
FROM employee_demographics
;
SELECT * 
FROM parks_departments
;
SELECT * 
FROM employee_salary
;

SELECT * 
FROM employee_demographics
WHERE employee_id IN
	(SELECT employee_id
		FROM employee_salary 
		WHERE dept_id = 1)
;
 
 SELECT first_name,salary,
 (SELECT ROUND(AVG(salary),2)
 FROM employee_salary) as Avg_Sal
 FROM employee_salary
 ;
 
 /*ERROR : will generate error that can be tackled using CTE common table expression 
 SELECT first_name,salary,
 (SELECT AVG(salary)
 FROM employee_salary) as Avg_Sal,
 CASE 
	WHEN salary > Avg_Sal THEN 'Above Average'
    WHEN salary < Avg_Sal THEN 'Below Average'
 END as Label
 FROM employee_salary
 ;
 */
 
SELECT gender,AVG(age),MAX(age),MIN(age),COUNT(age)
FROM employee_demographics
GROUP BY gender
;

SELECT AVG(`MAX(age)`)
FROM
(SELECT gender,AVG(age),MAX(age),MIN(age),COUNT(age)
FROM employee_demographics
GROUP BY gender) AS Agg_Table -- Every derived table must have it's own alias
;
 
-- OR do this

SELECT gender, MAX_AGE
FROM
(SELECT gender,
AVG(age) AVG_AGE,
MAX(age) MAX_AGE,
MIN(age) MIN_AGE,
COUNT(age) AGE_COUNT
FROM employee_demographics
GROUP BY gender)  AS Agg_Table 
;


