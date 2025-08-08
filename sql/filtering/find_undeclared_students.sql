/*
-- Exercise 4/80 (Tier 1)
-- The registrar's office needs to contact all students who have not
-- yet declared a major. Could you generate a list showing all available
-- information for these students?
*/

SELECT
    *
FROM
    students
WHERE
    major_department_id IS NULL;