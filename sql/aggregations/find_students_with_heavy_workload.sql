/*
-- Exercise 25/80 (Tier 3)
-- Academic advisors want to identify students who may be taking on an
-- exceptionally heavy workload. They have requested a list of any student
-- who has enrolled in more than 8 credits in any single semester. The
-- report should show the student's first and last name, the specific
-- semester and year of the heavy course load, and the total credits
-- they took in that term.
*/

SELECT
    st.first_name,
    st.last_name,
    se.semester,
    se.year,
    SUM(c.credits) AS total_credits
FROM
    students AS st
JOIN
    enrollments AS e ON st.student_id = e.student_id
JOIN
    sections AS se ON e.section_id = se.section_id
JOIN
    courses AS c ON se.course_id = c.course_id
GROUP BY
    st.student_id, -- Group by ID for accuracy
    st.first_name,
    st.last_name,
    se.semester,
    se.year
HAVING
    SUM(c.credits) > 8;