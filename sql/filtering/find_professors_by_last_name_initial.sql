/*
-- Exercise 2/80 (Tier 1)
-- The university is running a feature on faculty members. Find all
-- professors whose last name starts with the letter 'L' and retrieve
-- all their information.
*/

SELECT
    *
FROM
    professors
WHERE
    last_name LIKE 'L%';