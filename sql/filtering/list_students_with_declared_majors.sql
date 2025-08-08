/*
-- Exercise 13/80 (Tier 2)
-- For the student directory, we need a report that lists every student
-- who has officially declared a major. The report should show the
-- student's first name, last name, and the full name of their
-- major department.
*/

SELECT
    s.first_name,
    s.last_name,
    d.department_name
FROM
    students AS s
JOIN
    departments AS d ON s.major_department_id = d.department_id;

-- Note: The INNER JOIN correctly excludes the student with a NULL
-- major_department_id, as JOIN conditions require a match in both tables.