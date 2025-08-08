/*
-- Exercise 9/80 (Tier 1)
-- The administration is reviewing standard course structures. Please
-- pull the records for all courses that are worth either 3 or 4 credits.
*/

SELECT
    *
FROM
    courses
WHERE
    credits IN (3, 4);

-- Note: An alternative solution using OR would also be correct:
-- WHERE credits = 3 OR credits = 4;