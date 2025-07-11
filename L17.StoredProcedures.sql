-- Stored procedure : is a saved collection of SQL statements that can be executed repeatedly. It allows you to encapsulate complex SQL logic and reuse it whenever needed. Once created, the procedure can be called by name, and it will execute all the SQL code defined within it. Stored procedures help improve code reusability, maintainability, and performance.
-- stored procedure is similar to a function, but they are not exactly the same.
-- https://chatgpt.com/share/6804ca50-8094-8012-9bf0-4094da36f218 
SELECT * 
FROM employee_salary
WHERE salary >= 50000
;

USE `parks_and_recreation`;
DROP PROCEDURE IF EXISTS `high_salaries`;
CREATE PROCEDURE high_salaries()
SELECT * 
FROM employee_salary
WHERE salary >= 50000
;

CALL high_salaries();

-- DELIMITER : A character or sequence of characters marking the beginning or end of a unit of data

DELIMITER $$
CREATE PROCEDURE high_salaries2()
BEGIN
	SELECT * 
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT * 
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL high_salaries2(); -- Here, we'll get 2 outputs 1 for each query in stored procedure

-- Can also create a stored procedure by doing a right click on stored procedure and then selecting create stored procedures.

-- PARAMETER : are variable that are passed as inputs to a stored procedure. 

DELIMITER $$
CREATE PROCEDURE high_salaries4(p_employee_id INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id = p_employee_id
    ;
END $$
DELIMITER ;

CALL high_salaries4(1);