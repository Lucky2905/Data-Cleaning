-- WINDOW FUNCTIONS : similar to group by but instead of keeping everything in one row they allow us to look at a partition or a group but they each keep their own unique rows in output.

SELECT  gender,ROUND(AVG(salary),2) AS avg_sal
FROM employee_demographics ed
JOIN employee_salary es
	ON ed.employee_id = es.employee_id
GROUP BY gender
;

SELECT  ed.first_name, ed.last_name,gender,ROUND(AVG(salary),2) AS avg_sal
FROM employee_demographics ed
JOIN employee_salary es
	ON ed.employee_id = es.employee_id
GROUP BY ed.first_name, ed.last_name,gender
;

SELECT  gender, AVG(salary) OVER()
FROM employee_demographics ed
JOIN employee_salary es
	ON ed.employee_id = es.employee_id
;
SELECT * FROM employee_salary;
SELECT  ed.first_name, ed.last_name,gender, ROUND(AVG(salary) OVER(PARTITION BY gender),2)
FROM employee_demographics ed
JOIN employee_salary es
	ON ed.employee_id = es.employee_id
;

-- ROLLING TOTAL
SELECT  ed.first_name,
ed.last_name,
gender,
ROUND(SUM(salary) OVER(PARTITION BY gender ORDER BY ed.employee_id),2) as ROLLING_TOTAL
FROM employee_demographics ed
JOIN employee_salary es
	ON ed.employee_id = es.employee_id
;

SELECT  ed.employee_id,
ed.first_name,
ed.last_name,
gender,
ROW_NUMBER() OVER()
FROM employee_demographics ed
JOIN employee_salary es
	ON ed.employee_id = es.employee_id
;

SELECT  ed.employee_id,
ed.first_name,
ed.last_name,
gender,
salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS Row_Num, -- Row number doesn't repeat within partition 
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) Rank_Num, -- Rank may repeat and give next rank positionally 
-- (so if it encounters a duplicate based on the order by which is the salary here it going to assign it the same number and the number after that will be assigned positionally) 
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) DenseRank_Num -- Rank may repeat and give next rank numerically
FROM employee_demographics ed
JOIN employee_salary es
	ON ed.employee_id = es.employee_id
;


