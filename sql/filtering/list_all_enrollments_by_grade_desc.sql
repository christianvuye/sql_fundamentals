/*
-- Exercise 8/80 (Tier 1)
-- To identify candidates for academic honors, the awards committee
-- needs a list of all individual course enrollments. Please present
-- this list ordered by grade, from the highest to the lowest.
-- Show all details for each enrollment record.
*/

SELECT
    *
FROM
    enrollments
ORDER BY
    grade DESC;