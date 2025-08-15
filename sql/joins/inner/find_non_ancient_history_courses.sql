/*
-- Exercise 18/80 (Tier 2)
-- The History department chair is planning future course offerings.
-- They need a list of all courses offered by their department, but
-- excluding any that are focused on the ancient world. Please retrieve
-- all details for any course from the 'History' department whose name
-- does not contain the word 'Ancient'.
*/

SELECT
    c.*
FROM
    courses AS c
JOIN
    departments AS d ON c.department_id = d.department_id
WHERE
    d.department_name = 'History' AND c.course_name NOT LIKE '%Ancient%';