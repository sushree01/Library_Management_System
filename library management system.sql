create database library;

show databases;

use library;

drop table if exists book_details;

## creating table with book_details;

create table book_details (
Book_id int primary key,
Book_title varchar(100),
Language varchar(20),
Binding_id int,
No_copies_actual int,
No_copies_current int,
Category_id int,
Publication_year int );

desc book_details;

insert into book_details values(0001,'The Monk who sold his Ferrari','English',1,25,19,123,2015),
(0002,'The 5am Club','English',1,30,28,126,2019),
(0003,'Why I supported the emergency','English',1,10,10,127,2004),
(0004,'Immortals of Meluha','Hindi',2,15,14,124,2010),
(0005,'The God of Small Things','English',3,20,15,127,2008),
(0006,'The God of Small Things','Hindi',3,10,4,127,2008),
(0007,'The Inheritance of Loss','English',3,20,8,126,2020),
(0008,'Knight of The Legion of Honor','English',4,25,22,125,2016),
(0009,'Stronger than a man','English',5,12,12,124,2020);

select*from book_details;

##creating table Binding_details;

create table binding_details (
Binding_id int primary key,
Binding_name varchar(50));

desc binding_details;

insert into binding_details values (1,'Jaico Publication House'),
(2, 'Westland Publications'),(3,'Penguin Random House India'),
(4,'Roli books'),(5,'Rupa Publications');

select * from binding_details;

select 
b.Book_id,
b.Book_title,
b.Binding_id,
b.No_copies_actual,
b.No_copies_current,
b.Category_Id,
b.Publication_year,
bi.Binding_name

from book_details as b
inner join Binding_details as bi
on b.Binding_id=bi.Binding_id;

##creating table category_details;

create table category_details(
Category_id int primary key,
Category_name varchar(30));

desc category_details;

insert into category_details values(
123,'Fiction'),(124,'Drama'),(125,'Thriller'),(126,'Autobiography'),(127,'Narrative');

select*from category_details;

select 
b.Book_id,
b.Book_title,
b.Binding_id,
b.No_copies_actual,
b.No_copies_current,
b.Category_Id,
bi.Binding_name,
c.Category_name

from(( book_details as b
inner join Binding_details as bi
on b.Binding_id=bi.Binding_id)
inner join category_details as c
on b.Category_id=c.Category_id);

##creating table borrower_details;

drop table if exists borrower_details;

create table borrower_details(
Borrower_id int,
Book_id int,
Borrowed_from date,
Borrowed_to date,
Actual_return_date date,
Issued_by int);

desc borrower_details;

insert into borrower_details values(1111,0001,'2022-04-05','2022-04-15','2022-04-10',101),
(1112,0002,'2022-05-20','2022-05-31','2022-05-22',102),
(1113,0003,'2022-01-01','2022-01-10','2022-01-09',103),
(1114,0004,'2022-01-05','2022-01-15','2022-01-17',104),
(1115,0005,'2022-01-20','2022-01-31','2022-01-27',105),
(1116,0006,'2022-02-01','2022-02-10','2022-01-04',101),
(1117,0007,'2022-03-20','2022-03-31','2022-03-22',102),
(1118,0008,'2022-06-07','2022-06-17','2022-06-20',103),
(1119,0009,'2022-07-01','2022-07-10','2022-07-09',104),
(1111,0004,'2022-06-23','2022-07-03','2022-07-01',105),
(1112,0007,'2022-03-19','2022-03-31','2022-03-25',101),
(1115,0006,'2022-05-18','2022-05-29','2022-05-22',102),
(1117,0003,'2022-04-28','2022-05-08','2022-05-05',101);

select * from borrower_details;

update borrower_details set Actual_return_date='2022-02-06' where Borrower_id=1116;

select 
b.Book_id,
b.Book_title,
b.Binding_id,
b.No_copies_actual,
b.No_copies_current,
b.Category_Id,
bi.Binding_name,
c.Category_name,
bo.Borrower_id,
bo.Borrowed_from,
bo.Borrowed_to,
bo.Actual_return_date,
bo.Issued_by

from((( book_details as b
inner join Binding_details as bi
on b.Binding_id=bi.Binding_id)
inner join category_details as c
on b.Category_id=c.Category_id)
inner join borrower_details as bo
on b.Book_id=bo.Book_id);

##creating table staff_details

create table staff_details (
Staff_id int primary key,
Staff_name varchar (30),
Designation varchar (15));

desc staff_details;

insert into staff_details values(101, 'Mariamma','Manager'),
(102,'Rahul','Librarian'),(103,'Sonam','Admin'),(104,'Rohit','Staff'),(105,'Seetha','Staff');

select*from staff_details;

select

b.Book_id,
b.Book_title,
b.Binding_id,
b.No_copies_actual,
b.No_copies_current,
b.Category_Id,
bi.Binding_name,
c.Category_name,
bo.Borrower_id,
bo.Borrowed_from,
bo.Borrowed_to,
bo.Actual_return_date,
bo.Issued_by,
s.Staff_id,
s.Staff_name,
s.Designation

from book_details as b
inner join Binding_details as bi
on b.Binding_id=bi.Binding_id
inner join category_details as c
on b.Category_id=c.Category_id
inner join borrower_details as bo
on b.Book_id=bo.Book_id
inner join staff_details as s
on bo. Issued_by=s.Staff_id;

create table lib_management
(Book_id int,Book_title varchar(50),Binding_id int, No_copies_actual int,
No_copies_current int, Category_Id int,Binding_name varchar(50),
Category_name varchar(30),Borrower_id int,Borrowed_from date,
Borrowed_to date,Actual_return_date date,Issued_by int,Staff_id int,
Staff_name varchar(30),Designation varchar(30));

insert into lib_management(select
b.Book_id,
b.Book_title,
b.Binding_id,
b.No_copies_actual,
b.No_copies_current,
b.Category_Id,
bi.Binding_name,
c.Category_name,
bo.Borrower_id,
bo.Borrowed_from,
bo.Borrowed_to,
bo.Actual_return_date,
bo.Issued_by,
s.Staff_id,
s.Staff_name,
s.Designation

from book_details as b
inner join Binding_details as bi
on b.Binding_id=bi.Binding_id
inner join category_details as c
on b.Category_id=c.Category_id
inner join borrower_details as bo
on b.Book_id=bo.Book_id
inner join staff_details as s
on bo. Issued_by=s.Staff_id);

select * from lib_management;

#calculate fine for the defaulters (Rs. 20 per day for total no.of days)
select *,datediff(Borrowed_to,Borrowed_from) as 'Duration_of_Book_Issued',
 datediff(Actual_return_date,Borrowed_from) as 'Actual_Duration_of_Book_Issued',
 (datediff(Actual_return_date,Borrowed_from)-datediff(Borrowed_to,Borrowed_from))*20 as 'fine'from lib_management
 where 
 (datediff(Actual_return_date,Borrowed_from)-datediff(Borrowed_to,Borrowed_from))>0;
