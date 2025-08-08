/*
-- Exercise 14/80 (Tier 2)
-- The head of the Computer Science department wants to identify all
-- students who have ever enrolled in a course with the word 'Data'
-- in its title. Please provide a list of these students' first and
-- last names. Each student should only be listed once, regardless of
-- how many such courses they've taken.
*/

SELECT DISTINCT
    s.first_name,
    s.last_name
FROM
    students AS s
JOIN
    enrollments AS e ON s.student_id = e.student_id
JOIN
    sections AS se ON e.section_id = se.section_id
JOIN
    courses AS c ON se.course_id = c.course_id
WHERE
    c.course_name LIKE '%Data%';

-- Note: Your query using the USING clause was also perfectly correct and
-- is a great choice when joining keys are named identically.