/*
-- Exercise 10/80 (Tier 1)
-- For a university-wide census, we need to know the total number of
-- students currently registered. Can you provide this single number?
*/

SELECT
    COUNT(*) AS total_students
FROM
    students;

-- Note: Your solution using COUNT(first_name) is also correct, as
-- the first_name column does not contain any NULL values. Using
-- COUNT(*) or COUNT(primary_key) is a more common convention for
-- counting all rows in a table.