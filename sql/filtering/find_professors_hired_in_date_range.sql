/*
-- Exercise 12/80 (Tier 2)
-- The university is planning a recognition ceremony for faculty hired
-- at any point between the beginning of 2000 and the end of 2010.
-- We need a list of these professors, showing their first name, last
-- name, and the name of the department they work for.
*/

SELECT
    p.first_name,
    p.last_name,
    d.department_name
FROM
    professors AS p
JOIN
    departments AS d ON p.department_id = d.department_id
WHERE
    p.hire_date BETWEEN '2000-01-01' AND '2010-12-31';

-- Note: Your solution using INNER JOIN with the USING(department_id)
-- clause is also perfectly correct and is a convenient shorthand
-- for when the join columns have the same name in both tables.