/*
-- Exercise 24/80 (Tier 3)
-- The provost's office needs to analyze professor teaching loads for
-- each academic term. Can you produce a report that shows each
-- professor's first and last name, the specific semester and year
-- of a term they taught in, and the total number of course credits
-- they were assigned to teach during that single term?
*/

SELECT
    p.first_name,
    p.last_name,
    s.semester,
    s.year,
    SUM(c.credits) AS total_credits_taught
FROM
    professors AS p
JOIN
    sections AS s ON p.professor_id = s.professor_id
JOIN
    courses AS c ON s.course_id = c.course_id
GROUP BY
    p.professor_id, -- Always group by a unique ID if available
    p.first_name,
    p.last_name,
    s.semester,
    s.year
ORDER BY
    p.last_name,
    p.first_name,
    s.year,
    s.semester;

-- Note: It is a best practice to group by the primary key (professor_id)
-- in addition to names to prevent potential issues if two professors
-- share the same name. Your query was functionally correct for this dataset.