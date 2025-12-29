/*
THis is end-of-course project for the SQL fundamentals course at Satr Academy, 
As a continuation of the previous project, where i displayed the tables and created copies of them,
and i used aggregate functions along with some numeric, string, and date functions,
as well as updating the data.


1. Create a table for honor students from the Students table; this table should include students whose cumulative GPA is greater than 90.
2. Create a table for non-passing students from the Students table; this table should include students whose cumulative GPA is less than 60.
3. Display the names of students whose names start with the letter A.
4. Display the names of students whose names consist of four characters.
5. Apply the aggregate functions AVG, MAX, and MIN to the students’ cumulative GPA, and add clear labels to the results.
6. List the names of honor students in Level 6 whose cumulative GPA is exactly 100.
7. Display students who are in Level 1 and whose ages are between 16 and 17 years.
8. Display the number of students in Level 2.
9. Display the students’ tracks/majors in the school without duplicates.
10. Display the course names in UPPERCASE.
11. Display the average cumulative GPA and round it down to the nearest lower integer (using numeric functions).
12. Replace gender values in the Students table: change F to Female and M to Male (using string functions).
13. Update the cumulative GPA for students whose GPA is less than 60 by increasing it by 5 points.
*/

use school;


-- 1) -----------------------------------------  Create a table for honor students from the Students  ------------------------------------

create table superior
select *
from students
where cumulative_score > 90;  


-- 2) ----------------------------------------- Create a table for non-passing students  ------------------------------------------------------------
create table fail
 select * 
 from students
 where cumulative_score < 60;  

-- 3) ----------------------------------------- Display the names of students whose names start with the letter A. -----------------------------------
 select * from students
 where Fname like 'A%'; 

-- 4) ----------------------------------------- Display the names of students whose names consist of four characters ---------------------------------
select * 
from students
where Fname like  '____';

-- 5) ----------------------------------------- Apply the aggregate functions to the students’ cumulative GPA -----------------------------------------
select avg(cumulative_score) as Avrage,
          max(cumulative_score) as maximim, 
          min(cumulative_score) as minimim
from students; 

-- 6) ----------------------------------------- List the names of honor students in Level 6 whose cumulative GPA is exactly 100 -----------------------
select *
from superior
where study_level = 6 and cumulative_score = 100; 

-- 7) ----------------------------------------- Display students who are in Level 1 and whose ages are between 16 and 17 years ------------------------
select * 
from students
where  (year(curdate()) - year(birth_date )) between 16 and 17;  
 
-- 8) ----------------------------------------- Display the number of students in Level 2 -------------------------------------------------------------
select count(*) 
from students
where study_level = 2; 

-- 9) ----------------------------------------- Display the students’ tracks/majors in the school without duplicates -----------------------------------
select distinct(pathway)
from students;

-- 10) ----------------------------------------- Display the course names in UPPERCASE -----------------------------------------------------------------
 select upper(subject_name)
 from subjects; 
 
-- 11) ----------------------------------------- Display the average cumulative GPA and round it down ---------------------------------------------------
 select round(avg(cumulative_score)) as 'Average Score'
 from students;

-- 12) ----------------------------------------- Replace gender values in the Students table: change F to Female and M to Male  ------------------------
alter table students
modify column gender varchar(200) not null;
 
update students
set gender =
 case
when gender = 'F' then 'Female'
when gender = 'M' then  'Male'
else gender
 end; 

-- 13) ----------------------------------------- Update the cumulative GPA for students whose GPA is less than 60 by increasing it by 5 points.---------
update students
set cumulative_score = cumulative_score + 5
where cumulative_score < 60;

 select * from students;
 select * from fail;
 select * from superior;

