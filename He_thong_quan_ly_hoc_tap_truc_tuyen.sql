-- 1. Tạo Database
CREATE DATABASE "ElearningDB";

-- Kết nối vào ElearningDB trước khi chạy các lệnh sau:

-- 2. Tạo Schema
CREATE SCHEMA elearning;

-- 3. Tạo các bảng
CREATE TABLE elearning.students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email TEXT NOT NULL UNIQUE
);

CREATE TABLE elearning.instructors (
    instructor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email TEXT NOT NULL UNIQUE
);

CREATE TABLE elearning.courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    instructor_id INT REFERENCES elearning.instructors(instructor_id)
);

CREATE TABLE elearning.enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES elearning.students(student_id),
    course_id INT REFERENCES elearning.courses(course_id),
    enroll_date DATE NOT NULL
);

CREATE TABLE elearning.assignments (
    assignment_id SERIAL PRIMARY KEY,
    course_id INT REFERENCES elearning.courses(course_id),
    title VARCHAR(100) NOT NULL,
    due_date DATE NOT NULL
);

CREATE TABLE elearning.submissions (
    submission_id SERIAL PRIMARY KEY,
    assignment_id INT REFERENCES elearning.assignments(assignment_id),
    student_id INT REFERENCES elearning.students(student_id),
    submission_date DATE NOT NULL,
    grade FLOAT CHECK (grade >= 0 AND grade <= 10)
);
