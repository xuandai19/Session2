-- 1. Tạo Database (Thực hiện lệnh này trước)
CREATE DATABASE "HotelDB";

-- Sau đó kết nối vào LibraryDB rồi mới chạy tiếp:
CREATE SCHEMA hotel;

SET search_path TO hotel;

create table RoomTypes(
    room_type_id serial primary key ,
    type_name varchar(50) unique not null ,
    price_per_night numeric(10,2) check (price_per_night > 0) ,
    max_capacity int check (max_capacity > 0)
);

create table Rooms(
    room_id serial primary key ,
    room_number varchar(10) unique not null ,
    room_type_id int ,
    foreign key (room_type_id) references RoomTypes(room_type_id) ,
    status varchar(20) check (status IN ('Available','Occupied','Maintenance'))
);

create table Customers(
    customer_id serial primary key ,
    full_name varchar(100) not null ,
    email varchar(100) unique not null ,
    phone varchar(15) not null
);

create table Bookings(
    booking_id serial primary key ,
    customer_id int,
    foreign key (customer_id) references Customers(customer_id) ,
    room_id int,
    foreign key (room_id) references Rooms(room_id) ,
    check_in date not null ,
    check_out date not null ,
    status varchar(20) check (status IN ('Pending','Confirmed','Cancelled'))
);

create table Payments(
    payment_id serial primary key ,
    booking_id int,
    foreign key (booking_id) references Bookings(booking_id) ,
    amount numeric(10,2) check (amount >= 0) ,
    payment_date date not null ,
    method varchar(20) check (method IN ('Credit Card','Bank Transfer','Cash'))
);


