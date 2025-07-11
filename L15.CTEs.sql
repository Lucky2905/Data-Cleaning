-- CTEs : Common Table expression allows us to define a sub-query block that we can refer in the main query
-- WITH is the keyword to define CTE
-- CTE are unique and can be only used immediately after we create it.
WITH CTE_EXAMPLE AS
(
SELECT gender ,AVG(salary) avg_sal,MAX(salary) max_sal,MIN(salary) min_sal,COUNT(salary) count_sal
FROM employee_demographics ed
JOIN employee_salary es 
	ON ed.employee_id = es.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_EXAMPLE
;
-- this will give error as it is not a real table or view it is a just Table expression and is not stored in memory 
/*
SELECT *
FROM CTE_EXAMPLE
;
*/


WITH CTE_EXAMPLE AS
(
SELECT gender ,AVG(salary) avg_sal,MAX(salary) max_sal,MIN(salary) min_sal,COUNT(salary) count_sal
FROM employee_demographics ed
JOIN employee_salary es 
	ON ed.employee_id = es.employee_id
GROUP BY gender
)
SELECT AVG(avg_sal)
FROM CTE_EXAMPLE
;

-- CTE helps us to perfrom more advanced calculations that cannot be easily done or can't be done within one query
-- IT also increase the readablity wrt subqueries
-- FOR example

SELECT AVG(avg_sal)
FROM (
SELECT gender ,AVG(salary) avg_sal,MAX(salary) max_sal,MIN(salary) min_sal,COUNT(salary) count_sal
FROM employee_demographics ed
JOIN employee_salary es 
	ON ed.employee_id = es.employee_id
GROUP BY gender
) EXAMPLE_SUBQUERY
;

-- Addtional functionality of CTE'savepoint

-- MULTIPLE CTEs within one to do more complex query
WITH 
CTE_EXAMPLE1 AS
(
SELECT employee_id,gender,birth_date
FROM employee_demographics 
WHERE birth_date > '1985-01-01'
),
CTE_EXAMPLE2 AS
(
SELECT employee_id,salary
FROM employee_salary
WHERE salary>50000
)
SELECT *
FROM CTE_EXAMPLE1 
JOIN CTE_EXAMPLE2
	ON CTE_EXAMPLE1.employee_id = CTE_EXAMPLE2.employee_id
;

-- a useful concept -> (Gender, avg_sal ,max_sal ,min_sal ,count_sal) will overwrite the col names in the actual CTE query
WITH CTE_EXAMPLE (Gender, avg_sal ,max_sal ,min_sal ,count_sal) AS
(
SELECT gender ,AVG(salary) ,MAX(salary) ,MIN(salary) ,COUNT(salary) 
FROM employee_demographics ed
JOIN employee_salary es 
	ON ed.employee_id = es.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_EXAMPLE
;















WITH CTE_EXAMPLE2 AS
(
SELECT first_name,salary,
(SELECT AVG(salary)
FROM employee_salary) as Avg_Sal,
CASE 
	WHEN salary > (SELECT AVG(salary) FROM employee_salary) THEN 'Above Average'
	WHEN salary < (SELECT AVG(salary) FROM employee_salary) THEN 'Below Average'
    ELSE 'AVERAGE'
END as Label
FROM employee_salary
)
SELECT * 
FROM CTE_EXAMPLE2
;

-- Use a CTE to compute average first (more readable with complex logic)
WITH avg_cte AS (
    SELECT AVG(salary) AS avg_salary
    FROM employee_salary
)
SELECT 
    es.first_name,
    es.salary,
    a.avg_salary AS Avg_Sal,
    CASE 
        WHEN es.salary > a.avg_salary THEN 'Above Average'
        WHEN es.salary < a.avg_salary THEN 'Below Average'
        ELSE 'Average'
    END AS Label
FROM employee_salary es
CROSS JOIN avg_cte a;

-- Use a CROSS JOIN with a subquery (clean and efficient)
SELECT 
    es.first_name,
    es.salary,
    avg_data.avg_salary AS Avg_Sal,
    CASE 
        WHEN es.salary > avg_data.avg_salary THEN 'Above Average'
        WHEN es.salary < avg_data.avg_salary THEN 'Below Average'
        ELSE 'Average'
    END AS Label
FROM employee_salary es
CROSS JOIN (
    SELECT AVG(salary) AS avg_salary
    FROM employee_salary
) avg_data;


