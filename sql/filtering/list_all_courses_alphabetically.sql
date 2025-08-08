/*
-- Exercise 3/80 (Tier 1)
-- To prepare the official course catalog for printing, we need a list
-- of every course offered by the university. The list must be organized
-- alphabetically by course name. Please display all information for
-- each course.
*/

SELECT
    *
FROM
    courses
ORDER BY
    course_name ASC;