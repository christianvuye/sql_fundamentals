/*
-- Exercise 20/80 (Tier 2)
-- For a new inter-departmental research initiative, the university is
-- looking for students who fit a very specific profile. The criteria
-- are: the student must be a 'Computer Science' major who enrolled
-- before 2022, OR they must be a 'Physics' major who enrolled after
-- January 1st, 2023. From this combined group, the final list must
-- exclude any student whose first name is 'Alice'. Please provide all
-- details for the students who qualify.
*/

SELECT
    st.*
FROM
    students AS st
JOIN
    departments AS d
    ON st.major_department_id = d.department_id
WHERE (
        (d.department_name = 'Computer Science' AND st.enrollment_date < '2022-01-01')
    OR
        (d.department_name = 'Physics' AND st.enrollment_date > '2023-01-01')
)
AND st.first_name <> 'Alice';