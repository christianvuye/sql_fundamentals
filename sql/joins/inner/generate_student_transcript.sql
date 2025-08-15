/*
-- Exercise 16/80 (Tier 2)
-- Student Alice Johnson has requested a simple transcript. Create a
-- report that shows the full name of every course she has been
-- enrolled in, the semester and year she took it, and the final grade
-- she received. The list should be sorted alphabetically by the
-- course name.
*/

SELECT
    c.course_name,
    s.semester,
    s.year,
    e.grade
FROM
    students AS st
JOIN
    enrollments AS e ON st.student_id = e.student_id
JOIN
    sections AS s ON e.section_id = s.section_id
JOIN
    courses AS c ON s.course_id = c.course_id
WHERE
    st.first_name = 'Alice' AND st.last_name = 'Johnson'
ORDER BY
    c.course_name ASC;