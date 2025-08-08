/*
-- Exercise 1/80 (Tier 1)
-- To plan for an alumni event, we need a list of all students who began
-- their studies at the university before the start of 2022. Please
-- provide all available details for these students.
*/

SELECT
    *
FROM
    students
WHERE
    enrollment_date < '2022-01-01';