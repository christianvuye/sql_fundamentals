/*
-- Exercise 22/80 (Tier 3)
-- The academic affairs office is conducting a review of course
-- difficulty. They need a report that shows the full name of each
-- course alongside the average grade achieved by all students across
-- all its sections. The list should only include courses that have
-- actually had students enrolled.
*/

SELECT
    c.course_name,
    AVG(e.grade) AS average_grade
FROM
    courses AS c
JOIN
    sections AS s ON c.course_id = s.course_id
JOIN
    enrollments AS e ON s.section_id = e.section_id
GROUP BY
    c.course_name;