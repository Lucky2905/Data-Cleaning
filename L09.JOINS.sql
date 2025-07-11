-- Joins allows us to combine two tables or more if they have a common column here it is not necessary that column name has to be same but the data in it must be similar so we can used it
-- Inner Join Outer Join & Self Join
SELECT * 
FROM employee_demographics;

SELECT * 
FROM employee_salary;

-- INNER JOIN : RETURN THE ROWS THAT ARE THE SAME IN BOTH COLUMNS FROM BOTH TABLES 
-- by default JOIN represent INNER JOIN
/*
SELECT * 
FROM employee_demographics
JOIN employee_salary
	ON employee_id = employee_id
;
ERROR: employee_id is ambiguous i.e. the SQL is not able to interpret which employee_id belongs to which table
*/
-- Removing error
SELECT *
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.employee_id,age,occupation
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- OUTER JOIN : 
-- OUTER JOIN types: 
-- 1.LEFTOUTERJOIN/LEFTJOIN  
-- 2. RIGHTOUTERJOIN/ RIGHTJOIN
SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- SELF JOIN : WE TIE TABLE TO ITSELF
SELECT * 
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;

SELECT emp1.employee_id AS emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id AS emp,
emp2.first_name as first_name,
emp2.last_name as last_name
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;

SELECT *
FROM parks_departments -- reference table
;

-- JOINING MULTIPLE TABLE TOGETHER 
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments pd
	ON sal.dept_id = pd.department_id
;
