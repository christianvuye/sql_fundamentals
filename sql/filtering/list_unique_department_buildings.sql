/*
-- Exercise 5/80 (Tier 1)
-- The facilities management team wants a report of all buildings that
-- house academic departments. To avoid duplicates, please ensure each
-- building appears only once in the final list.
*/

SELECT DISTINCT
    building
FROM
    departments;