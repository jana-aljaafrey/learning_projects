/*
Final Project for SQL 101, SQL 102, SQL 103 Courses
From Satr Academy

 1. Create the database.
 2. Create the required tables with their relationships.
 3. Populate the tables with data and display it.
    • Encrypt the user’s password.
    • When adding any auto-increment/serial column, it must be filled automatically.
 4. Create a procedure named createAccount to which we will pass the user and profile 
    data, and it will insert the data into both tables.
 5. Create a procedure named User_Follow to which we will pass the same username and the
    username to be followed; it will look up the serial/ID for both users and insert them
    into the follow table.
 6. Display the number of tweets for only one user.

Hints:
 • You are not required to use a specific number of entries.
 • When adding a new user, the account creation date should be added automatically with the current time.
 • The password data type is BINARY(64).
 • You can use MD5 to encrypt the password.
 • When adding any serial column, you can fill it automatically without repetition using AUTOINCREMENT.
*/



-- 1) create the database and use it
create database X;
use X;

-- 2) Create the tables

-- Create Account table
create table x_account(
Acc_id int auto_increment primary key,
Email varchar(150) unique not null,
Phone varchar(20) not null unique,
Acc_password binary(64) not null,
CreateDate timestamp not null default current_timestamp
);

-- Create Profile table
create table x_profile(
Acc_id int primary key,
User_name varchar(50) not null unique,
Bio varchar(200),
Photo varchar(250),
foreign key (Acc_id) references x_account(Acc_id)
);

-- Create Tweets table
create table tweets(
Tweet_id int auto_increment primary key,
Content varchar(250) not null,
Tweet_date timestamp not null default current_timestamp,
Acc_id int not null,
foreign key (Acc_id) references x_account(Acc_id)
);

-- Create Likes table
create table likes(
Acc_id int not null,
Tweet_id int not null,
LikeDate timestamp not null default current_timestamp,
primary key(Acc_id, Tweet_id),
foreign key (Acc_id) references x_account(Acc_id),
foreign key (Tweet_id) references tweets(Tweet_id)  
);

-- create Follow table
create table follow(
Follower_id int not null,
Followee_id int not null,
check (Follower_id != Followee_id),
Follow_date timestamp not null default current_timestamp,
primary key (Follower_id, Followee_id),
foreign key(Follower_id) references x_account(Acc_id),
foreign key (Followee_id) references x_account(Acc_id)
);

-- 3) Create Procedures + add data into tables

-- Create x_account and profile procedure
DELIMITER //
create procedure Create_Account(
in aemail varchar(150),
in aphone varchar(20), 
in aacc_password varchar(150), 
in puser_name varchar(50),
in pbio varchar(200), 
in pphoto varchar(250))

begin

insert into x_account(Email, Phone, Acc_password) values
(aemail, aphone, unhex(MD5(aacc_password)));

set @the_id = LAST_INSERT_ID();

insert into x_profile(Acc_id, User_name, Bio, Photo) values 
(@the_id, puser_name, pbio, pphoto);

end//
DELIMITER ;

call create_Account('jojo@gmail.com', '+966508362499', 'Aa123123', 'J_J_013442', 'Let''s learn English togather', 'https://i.pinimg.com/1200x/ab/05/15/ab0515b9bf9eb983c09059c419971a49.jpg');
call create_Account('lian.1@outlook.com', '+966503790437', 'hoDhsi992', 'laiioonaaa', 'Nice to meet you all', 'https://i.pinimg.com/1200x/5f/3f/b5/5f3fb52f4731a02eeac7724b5e431353.jpg');
call create_Account('mohammad@gmail.com', '+966503567843', 'ADjdijSj9928dnj', 'Call_me_momo', 'Do you like games? I do also!', 'https://i.pinimg.com/736x/7d/92/94/7d92942afd2ddd51d48e1918fe2b6a2e.jpg');
call create_Account('A_A@gmail.com', '+966503284743', 'Aa123123', 'A_Zz', 'Let me tell you a secret! A_Zz store is the best ever!', 'https://i.pinimg.com/736x/af/aa/56/afaa56baf27f234a9de37c85d0ff9224.jpg');
call create_Account('mona@gmail.com', '+966508340946', 'JIHUHiajJ03JHJ', 'Teacher_MMM', 'Math teacher, don''t hesitate to contact me!', 'https://i.pinimg.com/1200x/4a/e0/81/4ae08183aa07ee5bb88154fc01b5f928.jpg');
call create_Account('Ahmad@gmail.com', '+966502202887', 'AAhMMaDD1000', 'Chef_Ahmad', 'I don''t make mistakes! only limited-edition experiments', 'https://i.pinimg.com/1200x/ef/38/d8/ef38d86834e8d9212c6a3720f6f151a2.jpg');

-- create procedure to add follow relationships
DELIMITER //
create procedure User_Follow(
in follower_Uname varchar(50),
in followee_Uname varchar(50))

begin

DECLARE FollowerId int;
DECLARE FolloweeId int;

select Acc_id
into FollowerId
from x_profile
where User_name = follower_Uname;

select Acc_id
into FolloweeId
from x_profile
where User_name = followee_Uname;

insert into follow(Follower_id, Followee_id) values
(FollowerId, FolloweeId);

end//
DELIMITER ;

call User_Follow('laiioonaaa','Teacher_MMM');
call User_Follow('Call_me_momo','Teacher_MMM');
call User_Follow('Teacher_MMM','A_Zz');
call User_Follow('laiioonaaa','Chef_Ahmad');


-- Post Tweets procedure

DELIMITER //
create procedure new_tweet(
in id int,
in the_content varchar(250)
)
begin
insert into tweets(Acc_id, Content) values
(id, the_content);
end//
DELIMITER ;

call new_tweet(1, 'the word "Rapid" means: happening in a short time or at a fast pace. For example: the country''s rapid economic decline.');

-- Like procedure
DELIMITER //
create procedure giveLike(
in likerID int,
in tweetID int
)
begin
insert into likes(Acc_id, tweet_id) values
(likerID, tweetID);
end//
DELIMITER ;

call giveLike(2, 1);
call giveLike(3, 1);

-- ) display all tables
select * from x_account;
select * from x_profile;
select * from follow;
select * from tweets;
select * from likes;

drop database X;
