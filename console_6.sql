-- 1. Tạo Database (Thực hiện lệnh này trước)
CREATE DATABASE "LibraryDB";

-- Sau đó kết nối vào LibraryDB rồi mới chạy tiếp:

-- 2. Tạo Schema
CREATE SCHEMA library;

-- 3. Tạo bảng Books trong schema library
CREATE TABLE library.books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50) NOT NULL,
    published_year INT,
    price FLOAT
);