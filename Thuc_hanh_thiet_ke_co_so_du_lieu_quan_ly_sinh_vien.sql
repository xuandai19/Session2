-- 1. Tạo Database
CREATE DATABASE "UniversityDB";

-- Kết nối vào UniversityDB trước khi chạy các lệnh sau:

-- 2. Tạo Schema
CREATE SCHEMA university;

-- 3. Tạo các bảng
CREATE TABLE university.students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    email TEXT NOT NULL UNIQUE
);

CREATE TABLE university.courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT
);

CREATE TABLE university.enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES university.students(student_id),
    course_id INT REFERENCES university.courses(course_id),
    enroll_date DATE
);
