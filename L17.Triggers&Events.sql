-- Triggers & Events
-- A trigger is a block of code that excutes automatically when an event takes place at a specific table

SELECT * 
FROM employee_demographics
;

SELECT * 
FROM employee_salary
;

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary -- we can use BEFORE/AFTER if we are gonna delete or update 
    FOR EACH ROW   -- FOR EACH ROW means that the trigger is gonna activated for each row that is inserted
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES ( NEW.employee_id, NEW.first_name, NEW.last_name )  -- we can use OLD for rows that were deleted or updated
    ;
END $$
DELIMITER ;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id )
VALUES (13,'Jean', 'Saperstein', 'Entertainment 720 CEO', 100000, NULL)
;

-- EVENTS : Event takes place when it is scheduled so basically it is a scheduled automater rather than trigger that happens when an event takes place

SELECT * 
FROM employee_demographics
;

DELIMITER $$
CREATE EVENT  Delete_retirees
ON SCHEDULE EVERY 1 YEAR
DO 
BEGIN
	DELETE
	FROM employee_demographics
    WHERE age>=60;
END $$
DELIMITER ;

SHOW VARIABLES LIKE 'event%'; -- if event is not created you can turn it on from here if it is off