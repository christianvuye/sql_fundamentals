/*
-- Exercise 21/80 (Tier 3)
-- The university planning committee needs to understand student
-- distribution across different fields of study. They have requested
-- a report that shows the name of each academic department alongside
-- the total number of students majoring in that department. Departments
-- with no students majoring in them can be excluded from this report.
*/

SELECT
    d.department_name,
    COUNT(s.student_id) AS number_of_students
FROM
    departments AS d
JOIN
    students AS s ON d.department_id = s.major_department_id
GROUP BY
    d.department_name;

-- Note: Your query is correct and produces the right result. However, the
-- "HAVING COUNT(s.student_id) > 0" clause is unnecessary in this case.
-- The INNER JOIN already ensures that only departments with at least one
-- matching student are included in the result set.