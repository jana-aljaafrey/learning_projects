/*
THis is end-of-course project for the SQL fundamentals course at Satr Academy, 
where we simulate a small database for high school and work with data using CRUD operations.


1) Create database
2) Use the database
3) Create tables
4) Insert values into tables
5) Show the tables in the database
6) Show the columns in each tables
7) Presnt the tables
8) some modifications 
9) present tables after modifications
*/


-- 1) ----------------------------------------- create database -----------------------------------------
create database school;

-- 2) ----------------------------------------- Use the database -----------------------------------------
use school;


-- 3) ----------------------------------------- create tables -----------------------------------------

-- creat sudents table

create table student (
student_id int primary key auto_increment,
Fname varchar(250) not null,
birth_date date not null,
gender enum( 'F', 'M' ) not null,
enrollment_date Date not null,
email varchar(250),
study_level int check(study_level between 1 and 6) not null,
pathway enum('science', 'humanities') not null,
cumulative_score decimal(5, 2) check(cumulative_score between 0 and 100) not null
);

-- create subjects table

create table teachers (
teacher_id int primary key auto_increment,
Fname varchar(250) not null,
birth_date date not null,
gender enum( 'F' , 'M' ) not null,
email varchar(250) not null,
office_num varchar(100) not null
);

-- create subjects table

create table subjects (
subject_id int primary key auto_increment,
subject_name varchar(250) not null
);

-- 4) ----------------------------------------- Insert values into tables -----------------------------------------

-- insert into students table (30)
insert into student (student_id, Fname, birth_date, gender, enrollment_date, email, study_level, pathway, cumulative_score ) values 
(null, 'Sara', '2007-04-22', 'F', '2023-10-28',  'soso883@gmail.com', 5, 'science', 95.43),
(null, 'Latifah', '2009-02-03', 'F', '2025-10-27',  'looloo@gmail.com', 1, 'humanities', 98.93),
(null, 'Aban', '2009-06-14', 'M', '2025-10-29',  'AAA93933@gmail.com', 2, 'science', 93.26),
(null, 'suhaib', '2008-10-22', 'M', '2024-10-28',  null,  3, 'science', 99.12),
(null, 'Lolo', '2008-11-15', 'F', '2024-10-28',  null, 3, 'science', 100),
(null, 'Fajer', '2007-05-29', 'F', '2023-10-28',  'fofooo27@ooutlook.com', 5, 'humanities', 60),
(null, 'Maria', '2008-07-10', 'F', '2024-10-27',  'mariiiaaa@gmail.com', 3, 'humanities', 79.43),
(null, 'Loai', '2009-08-05', 'M', '2025-10-27',  'loai.gamer.333@gmail.com', 5, 'science', 95.43),
(null, 'Botol', '2007-12-09', 'F', '2023-10-29',  null, 5, 'humanities', 100),
(null, 'Reem', '2009-09-18', 'F', '2025-10-28',  'rayomah738@gmail.com', 1, 'science', 94.43),
(null, 'Sultan', '2009-01-27', 'M', '2025-10-30', null, 1, 'humanities', 58.5),
(null, 'Maytham', '2009-02-25', 'M', '2025-10-28',  null, 2, 'science', 89.43),
(null, 'Jood', '2008-05-19', 'F', '2024-10-28',  'jood.jood@gmail.com', 3, 'science', 95.43),
(null, 'Bader', '2007-04-16', 'M', '2023-10-28',  null, 5, 'science', 88.43),
(null, 'Tamim', '2008-08-12', 'M', '2024-10-30',  'ta.m.001@gmail.com', 3, 'science', 95.43),
(null, 'Mashail', '2007-03-30', 'F', '2023-10-29',  'study.m@gmail.com', 5, 'humanities', 95.43),
(null, 'Mawadah', '2008-01-01', 'F', '2024-10-28',  null, 3, 'science', 95.43),
(null, 'Muhanad', '2009-12-13', 'M', '2025-10-26',  null, 1, 'science', 82.43),
(null, 'Abrar', '2007-04-11', 'F', '2023-10-28',  null, 5, 'science', 89.43),
(null, 'Ahmid', '2007-09-22', 'M', '2023-10-29',  'A.h.m.a.d@gmail.com', 5, 'humanities', 98.43),
(null, 'Alanoud', '2007-07-28', 'F', '2023-10-27',  'alanoud.chan@gmail.com', 5, 'humanities', 97.43),
(null, 'Amal', '2008-03-08', 'F', '2024-10-28',  null, 3, 'science', 95.43),
(null, 'Deema', '2007-07-17', 'F', '2023-10-27',  'Deeeem0983a@gmail.com', 5, 'science', 99.43),
(null, 'Hassan', '2008-05-03', 'M', '2024-10-28', null, 2, 'science', 85.43),
(null, 'Farah', '2007-01-20', 'F', '2023-10-28',  'faruhah_2@gmail.com', 5, 'humanities', 95.43),
(null, 'Sara', '2007-06-10', 'F', '2023-10-28',  null, 5, 'humanities', 55.43),
(null, 'Jawad', '2007-02-21', 'M', '2023-10-27',  'jawad_Zzz@gmail.com', 5, 'science', 93.43),
(null, 'Joury', '2008-08-13', 'F', '2024-10-28',  null, 3, 'humanities', 59.93),
(null, 'Jumana', '2007-06-17', 'F', '2023-10-28', null, 5, 'science', 95.43),
(null, 'Omar', '2009-01-07', 'M', '2025-10-28',  'OOmarrr.3@gmail.com', 5 , 'humanities', 82.62);

-- insert into teachers table (10)
insert into teachers (teacher_id, Fname, birth_date, gender, email, office_num) values 
(null, 'Ali', '1993-08-17', 'M', 'ali_alharbi@gmail.com', 'A01'),
(null, 'Rawan', '2000-04-07', 'F', 'rawan.omar@gmail.com', 'B07'),
(null, 'Ahmad', '1989-11-01', 'M', 'ahmad_mustafa@gmail.com', 'A06'),
(null, 'Laian', '1985-07-20', 'F', 'Laian_almatar@gmail.com', 'B01'),
(null, 'Asmaa', '1991-12-28', 'F', 'asmaa.alharthy@gmail.com', 'B01'),
(null, 'Yaser', '1992-02-06', 'M', 'yaser.M.alasiri@gmail.com', 'A03'),
(null, 'Walaa', '2001-10-19', 'F', 'walaa.mahmood@gmail.com', 'B08'),
(null, 'Norah', '1995-01-17', 'F', 'norah.alarfaj@gmail.com', 'B04'),
(null, 'Tala', '1997-06-27', 'F', 'tala.saaid@gmail.com', 'B06'),
(null, 'Ziad', '1998-09-22', 'M', 'ziad.zaid@gmail.com', 'A02');

-- insert into subjects table (6)
insert into subjects (subject_id, subject_name) values 
(null, 'Math'),
(null, 'Geography'),
(null, 'History'),
(null, 'English'),
(null, 'Physics'),
(null, 'Biology');



-- 5) ----------------------------------------- Show the tables in the database -----------------------------------------
show tables;

-- 6) ----------------------------------------- Show the tables in the database -----------------------------------------
show columns from student;
show columns from teachers;
show columns from subjects;

-- 7) ----------------------------------------- Show the tables in the database -----------------------------------------
select * from student;
select * from teachers;
select * from subjects;

-- 8) ----------------------------------------- some modifications -----------------------------------------

-- rename a table
alter table student
rename to students;

-- change a student email
update students
set email = 'aban.a.a@outlook.com'
where student_id = 3;

-- change an office number for a teacher
update teachers
set office_num = 'B05'
where teacher_id = 2;


-- 9) ----------------------------------------- present tables after modifications -----------------------------------------
select * from students;
select * from teachers;



