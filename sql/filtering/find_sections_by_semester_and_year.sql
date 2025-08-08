/*
-- Exercise 7/80 (Tier 1)
-- For scheduling purposes, please provide the details of all course
-- sections that were offered during the 'Fall' semester of the year 2023.
*/

SELECT
    *
FROM
    sections
WHERE
    semester = 'Fall' AND year = 2023;