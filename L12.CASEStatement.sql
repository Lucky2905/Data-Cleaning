-- Case Statement

SELECT first_name,last_name,age,
CASE 
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN  'Middle-Aged'
    WHEN age >=50 THEN 'Old'
END AS Age_Bracket
FROM employee_demographics;


SELECT * 
FROM parks_departments;
SELECT * 
FROM employee_salary;
-- Example Question
-- Find Pay Increase and Bonus
-- given pay < 50000 then raise 5%
-- pay > 50000 then raise 7%
-- FinanceDept then 10% Bonus 

SELECT first_name,last_name,salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
    ELSE salary
END AS New_Salary,
CASE
	WHEN dept_id = 6 THEN salary * 0.1
END AS Bonuses
FROM employee_salary
;

SELECT first_name,last_name,salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
    ELSE salary
END AS New_Salary,
CASE
	WHEN department_name = 'Finance' THEN salary * 0.1
    ELSE 0
END AS Bonuses
FROM employee_salary as sal
JOIN parks_departments as pd
	ON dept_id = department_id
;