/*
-- Exercise 19/80 (Tier 2)
-- To help build the master schedule document, we need a comprehensive
-- list of all sections offered for all courses. Please display the
-- department name, the course name, the semester, and the year for
-- every section. The list should be organized first alphabetically by
-- department name, and then alphabetically by course name within each
-- department.
*/

SELECT
    d.department_name,
    c.course_name,
    s.semester,
    s.year
FROM
    sections AS s
JOIN
    courses AS c ON s.course_id = c.course_id
JOIN
    departments AS d ON c.department_id = d.department_id
ORDER BY
    d.department_name ASC,
    c.course_name ASC;