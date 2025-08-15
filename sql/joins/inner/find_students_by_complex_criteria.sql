/*
-- Exercise 15/80 (Tier 2)
-- The administration is creating a targeted mailing list. They need
-- to find students who meet a specific set of criteria. The list should
-- include any student who is either majoring in 'Physics' OR enrolled
-- at the university at any time in or after 2022. From that resulting
-- group, the final list should only contain students whose last name
-- is 'Smith' or 'Brown'. Please retrieve all information for the
-- students who match.
*/

SELECT
    s.*
FROM
    students AS s
JOIN
    departments AS d ON s.major_department_id = d.department_id
WHERE
    (d.department_name = 'Physics' OR s.enrollment_date >= '2022-01-01')
    AND s.last_name IN ('Smith', 'Brown');

-- Note: The prompt asked for student information, so s.* is used to
-- select all columns from the students table. Using * would have
-- returned columns from both tables. Your query correctly identified
-- the student, but this version provides a cleaner final result.