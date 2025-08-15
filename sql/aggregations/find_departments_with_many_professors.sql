/*
-- Exercise 23/80 (Tier 3)
-- The provost's office is identifying larger academic departments for
-- a new administrative support program. To qualify, a department must
-- have more than two professors. Please provide a report that lists
-- the names of these qualifying departments.
*/

SELECT
    d.department_name
FROM
    departments AS d
JOIN
    professors AS p ON d.department_id = p.department_id
GROUP BY
    d.department_name
HAVING
    COUNT(p.professor_id) > 2;

-- Note: While the prompt only asked for the department name, including
-- the count in your SELECT statement as you did is often very helpful
-- for verifying the result.