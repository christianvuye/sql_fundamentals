/*
-- Exercise 6/80 (Tier 1)
-- The curriculum committee is reviewing courses with a high workload.
-- Can you retrieve the records for all courses that are worth more
-- than 4 credits?
*/

SELECT
    *
FROM
    courses
WHERE
    credits > 4;