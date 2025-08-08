/*
-- Exercise 11/80 (Tier 2)
-- A student needs to know who is teaching the 'Data Structures'
-- course section offered in the 'Spring' semester of 2024.
-- Can you find the first and last name of the professor?
*/

SELECT
    p.first_name,
    p.last_name
FROM
    professors AS p
JOIN
    sections AS s ON p.professor_id = s.professor_id
JOIN
    courses AS c ON s.course_id = c.course_id
WHERE
    c.course_name = 'Data Structures' AND s.semester = 'Spring' AND s.year = 2024;

-- Note: Using table aliases (e.g., "professors AS p") is a best
-- practice that makes queries with multiple joins easier to read
-- and write. Your query was correct without them, but this style
-- is recommended.