-- A professor has taken a leave of absence for an upcoming semester.
-- Their course section assignment has been removed for now.
UPDATE sections SET professor_id = NULL WHERE section_id = 12;