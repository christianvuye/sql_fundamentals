/*
-- Exercise 17/80 (Tier 2)
-- Due to the recent change, the registrar needs an up-to-date list
-- of all course sections that currently have a professor assigned. For
-- each of these sections, display the course's full name, the
-- professor's first and last name, the semester, and the year.
*/

SELECT
    c.course_name,
    p.first_name,
    p.last_name,
    s.semester,
    s.year
FROM
    sections AS s
JOIN
    courses AS c ON s.course_id = c.course_id
JOIN
    professors AS p ON s.professor_id = p.professor_id;

-- Note: This works because an INNER JOIN requires a matching value
-- in the columns being joined. The section where professor_id was
-- updated to NULL has no matching professor_id in the professors
-- table, so it is automatically excluded from the result set.