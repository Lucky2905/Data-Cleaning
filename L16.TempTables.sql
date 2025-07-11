-- Temporary Tables : are tables that are visible only in that session in which they are created (that means it will work even if you use a new window but once you close the SQL WorkBench it wont work)

CREATE TEMPORARY TABLE temp_Table
(
first_name VARCHAR(50),
last_name VARCHAR(50),
favortie_movie VARCHAR(100)
)
;

SELECT * 
FROM temp_Table
;

INSERT INTO temp_Table 
VALUES ('Alex','Freberg','Lord of the Rings')
;

SELECT *
FROM employee_salary
;

CREATE TEMPORARY TABLE salary_over_50K
(
SELECT * 
FROM employee_salary
WHERE salary >= 50000 
)
;

SELECT * 
FROM salary_over_50K
;