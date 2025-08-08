-- Drop tables in reverse order of creation to avoid foreign key constraints
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS sections;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS professors;
DROP TABLE IF EXISTS departments;

-- Create the departments table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    building VARCHAR(50)
);

-- Create the professors table
CREATE TABLE professors (
    professor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INT NOT NULL,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Create the students table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    major_department_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (major_department_id) REFERENCES departments(department_id)
);

-- Create the courses table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    credits INT CHECK (credits > 0),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Create the sections table
CREATE TABLE sections (
    section_id SERIAL PRIMARY KEY,
    course_id INT NOT NULL,
    professor_id INT,
    semester VARCHAR(20) NOT NULL,
    year INT NOT NULL,
    classroom VARCHAR(50),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (professor_id) REFERENCES professors(professor_id)
);

-- Create the enrollments table
CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    section_id INT NOT NULL,
    grade NUMERIC(4, 2) CHECK (grade >= 0.00 AND grade <= 100.00),
    UNIQUE (student_id, section_id), -- A student can't enroll in the same section twice
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (section_id) REFERENCES sections(section_id)
);

-- Insert data into departments
INSERT INTO departments (department_name, building) VALUES
('Computer Science', 'Pascal Hall'),
('Physics', 'Newton Hall'),
('History', 'Herodotus Hall'),
('Fine Arts', 'Da Vinci Center'),
('Mathematics', 'Euler Building');

-- Insert data into professors
INSERT INTO professors (first_name, last_name, department_id, hire_date) VALUES
('Alan', 'Turing', 1, '1995-09-01'),
('Ada', 'Lovelace', 1, '2005-08-22'),
('Marie', 'Curie', 2, '1998-01-15'),
('Albert', 'Einstein', 2, '2010-06-01'),
('Thucydides', 'Son-of-Olorus', 3, '2002-07-30'),
('Leonardo', 'da Vinci', 4, '2018-02-12'),
('Carl', 'Gauss', 5, '1999-11-11'),
('Grace', 'Hopper', 1, '2020-01-10');

-- Insert data into students
INSERT INTO students (first_name, last_name, major_department_id, enrollment_date) VALUES
('Alice', 'Johnson', 1, '2022-09-01'),
('Bob', 'Smith', 1, '2021-09-01'),
('Charlie', 'Brown', 2, '2023-09-01'),
('Diana', 'Prince', 3, '2022-09-01'),
('Eve', 'Adams', 4, '2020-09-01'),
('Frank', 'Miller', NULL, '2023-01-15'),
('Grace', 'Kelly', 4, '2021-09-01'),
('Henry', 'Ford', 2, '2022-01-20'),
('Ivy', 'League', 1, '2020-09-01');


-- Insert data into courses
INSERT INTO courses (course_name, department_id, credits) VALUES
('Introduction to Programming', 1, 4),
('Data Structures', 1, 4),
('Classical Mechanics', 2, 3),
('Electromagnetism', 2, 4),
('The Ancient World', 3, 3),
('Renaissance Art', 4, 3),
('Calculus I', 5, 5),
('Linear Algebra', 5, 4),
('Database Systems', 1, 3);

-- Insert data into sections
INSERT INTO sections (course_id, professor_id, semester, year, classroom) VALUES
-- Year 2023
(1, 2, 'Fall', 2023, 'PH-101'),   -- Intro to Prog, Lovelace
(3, 3, 'Fall', 2023, 'NH-205'),   -- Classical Mech, Curie
(5, 5, 'Fall', 2023, 'HH-A'),    -- Ancient World, Thucydides
(7, 7, 'Fall', 2023, 'EB-303'),   -- Calculus I, Gauss
(9, 8, 'Fall', 2023, 'PH-210'),   -- Database Systems, Hopper
(2, 1, 'Spring', 2024, 'PH-101'), -- Data Structures, Turing
(4, 4, 'Spring', 2024, 'NH-207'), -- Electromagnetism, Einstein
(6, 6, 'Spring', 2024, 'DVC-S1'), -- Renaissance Art, da Vinci
(8, 7, 'Spring', 2024, 'EB-303'), -- Linear Algebra, Gauss
-- Year 2024
(1, 8, 'Fall', 2024, 'PH-101'),   -- Intro to Prog, Hopper
(3, 3, 'Fall', 2024, 'NH-205'),   -- Classical Mech, Curie
(9, 1, 'Fall', 2024, 'PH-210');   -- Database Systems, Turing


-- Insert data into enrollments
INSERT INTO enrollments (student_id, section_id, grade) VALUES
-- Alice Johnson (CS)
(1, 1, 95.50), -- Intro to Prog, Fall 2023
(1, 5, 88.00), -- Database Systems, Fall 2023
(1, 6, 92.10), -- Data Structures, Spring 2024
-- Bob Smith (CS)
(2, 1, 89.00), -- Intro to Prog, Fall 2023
(2, 7, 76.50), -- Electromagnetism, Spring 2024
-- Charlie Brown (Physics)
(3, 2, 91.20), -- Classical Mech, Fall 2023
(3, 4, 85.00), -- Calculus I, Fall 2023
(3, 7, 88.80), -- Electromagnetism, Spring 2024
-- Diana Prince (History)
(4, 3, 98.00), -- Ancient World, Fall 2023
(4, 8, 94.00), -- Renaissance Art, Spring 2024
-- Eve Adams (Fine Arts)
(5, 8, 81.50), -- Renaissance Art, Spring 2024
-- Frank Miller (Undeclared)
(6, 1, 72.00), -- Intro to Prog, Fall 2023
(6, 3, 68.90), -- Ancient World, Fall 2023
-- Grace Kelly (Fine Arts)
(7, 8, 99.10), -- Renaissance Art, Spring 2024
-- Henry Ford (Physics)
(8, 2, 84.00), -- Classical Mech, Fall 2023
(8, 4, 79.50), -- Calculus I, Fall 2023
-- Ivy League (CS)
(9, 9, 91.00), -- Linear Algebra, Spring 2024
(9, 5, 93.30); -- Database Systems, Fall 2023