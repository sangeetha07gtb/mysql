create database dbs100;
use dbs100;
create database if not exists dbs100;
drop database if exists dbs100;
show databases;
show tables;

create database college2;
use   college2;
-- here we used the constraints(specific rules) unique,not null,
create table teacher (
id int unique,
name varchar(40),
salary int not null,
branch varchar(50)
);
-- i am inserting the values into tecaher table
insert into teacher
(id,name,salary,branch)
values
(1,"devi",23000,"science"),
(2,"raju",25000,"maths");
-- there is another way to insert the values into the table 
insert into teacher values (3,"sai",30000,"biology");
insert into teacher values (4,"sai ram",30000,"biology");

-- now we gonna view the table
select* from teacher;
select id,name from teacher;
-- now we want teachers with unique salary so we gonna use the distinct
select distinct salary from teacher;
-- now we gonna see about another constraints primary key, foreign key, default, check 
create table administration (
ad_id int primary key,
ad_salary int ,
ad_age int
);

insert into administration 
(ad_id,ad_salary,ad_age)
values(1001,20000,23),
(1002,22000,19),
(1003,23000,26),
(1004,0,21);
select* from administration;

update administration 
set ad_id =1005
where ad_id =1004;

-- updating(change) ad_id to id
update administration
set ad_id =c_id
where ad_id=1004;
-- we cannot  change the column name with this we had a different code(ALTER=>rename)
 
 -- deleting the values from table
 delete from administration
 where  ad_age =21;
-- using alter  which works on the columns
alter table administration
add ad_place1 varchar(30);

alter table administration
drop ad_place ;
 
alter table administration
change ad_id  a_id int;

alter table administration
modify ad_salary decimal(10,2);

alter table administration
rename to admion;

create table emp(
emp_id int primary key auto_increment,
emp_place varchar(30) default 'pune'
);

insert into emp
(emp_id,emp_place)
values
(default),
('uk'),
('sikkim'),
('kashmir');
select* from emp; -- if we run this agian without default by giving some other value in the place of default it will give 8 times (4+4=8)

select* from emp;

-- change 
-- " foreignkey ka example":
-- create table temp (
-- cust_id int,
-- foreign key(cust_id)references customer(id)
-- here cust_id is the foreign key in the table temp which is primary key in the customer table 

-- " default example":
-- salary int default 1500
create table pat (
id int,
salary int default 1500
);
insert into pat (id) values(1601);
select* from pat;

-- "check example":is not but adding the condition
create table newtab (
age int check(age >=18) 
);
-- here with the "check" the age values which aee equals to and grete than 18 will be addded


-- here we used the constraints not null, primary key
create table student2 (
rollno int primary key,
name varchar(50),
marks int not null,
grade varchar(1),
city varchar(20)
);
insert into student2
(rollno, name,marks,grade,city)
values
(101,"anil",78,"C","Pune"),
(102,"bhumiks",93,"A","Mumbai"),
(103,"chetan",85,"B","Mumbai"),
(104,"dhruc",96,"A","Delhi"),
(105,"emanuel",12,"F","Delhi"),
(106,"farah",82,"B","Delhi");
-- now we gonna use the "where" cluase (extra condition) by using operators
select* from student2 where marks+10>80;
select* from student2 where city="mumbai";
select* from student2 where marks>80 and city='delhi';
select* from student2 where marks>80 or city='delhi';
select* from student2 where marks between 90 and 100;
select* from student2 where city in ("delhi");
select* from student2 where city not in ("delhi");
-- limit sets n upper limit on number of rows need to be returnd
select* from student2 limit 3;
select* from student2 where marks>=75 limit 4;
-- "order by clause' sorts the data by asc or desc order
select* from student2 order by marks asc;
select* from student2 order by marks desc limit 3;

-- we are using aggregate functions
select max(marks) from student2;
select min(marks) from student2;
select avg(marks) from student2;
select count(rollno) from student2;
select sum(rollno) from student2;

-- count number of students in each city by using group by clause
 select city ,count(rollno)
 from student2
 group by city;
 
 -- write the query to find avg marks in each city in ascending order
 select city ,avg(marks)
 from student2
 group by city
 order by city asc;
 
 select  paymentmode ,count(customer)
 from customer
 group by paymentmode;
 
 -- now using having clause where we cant use where clause
 -- Q:"count number of students in each city where max marks cross 90
 select city, count(name)
 from student2
 group by city
 having max(marks)>90;
 
 -- general order
 select city 
 from student2 
 where grade='A'                                                  
 group by city
 having max(marks)>=93
 order by city asc; 
 
 -- table related queries 
 -- updating from grade 'O' TO 'A'
  -- we need to off the safe mode
  set sql_safe_updates =0;
 update student2
 set grade="O"
 where grade="A";
 
 select* from student2;
 -- here we need to add extra marks for everyone  then
 update student2
 set marks=marks + 1;
 
 -- deleting the rows
delete from student2
where marks <33; 
 select* from student2;
 

 -- revisiting the foreign key
 create table dept (
 id int primary key,
 name varchar(50)
 );
 create table professor (
 id int primary key,
 name varchar(40),
 dept_id int ,
 foreign key(dept_id)references dept(id)
 );
 
 -- table related queries(alter) =>add,drop,rename,change,modify
 alter table  student2
 add column  age int;
 -- drop column column_name;
 -- rename to new_table_name;
 -- change old_name new_name new_datatype new_constraint;
 -- modify col_name new_datatype new_condtraint;
 select*from student2;
 
 -- joins => joins the rows of 2 or more tables whic h has similar columns
 create table student3 (
 st_id int ,
 name varchar(30)
 );
 insert into student3
 (st_id,name)
 values
 (101,"adam"),
 (102,"bob"),
 (103,"casey");
 create table course3 (
 st_id int,
 course varchar(40)
 );
 insert into course3
 (st_id,course)
 values
 (102,"english"),
(105,"math"),
(103,"science"),
(107,"cse");

select*
from student3 as s3
inner join course3 as c3
on s3.st_id=c .st_id;

use dm100;
select*from sales;
select orderdate,category,region from sales;
-- to find subategory city and segment
select subcategory,city,segment from sales;
select distinct(category) from sales;

-- try to find how amny unique ids are there
select distinct(orderid) from sales;

-- now we are using as to just minimize the column name
select orderid as id from sales;
select region as reg from sales;

-- selecting only info regarding technology
select* from sales where category="technology";
select* from sales where subcategory="art";
select* from sales where region="west";
select* from sales where region="south";

select* from sales where sales<=10;
-- here the table name and column are same but ,,its fine we get no error
 select* from sales where category="technology" and region="west";
 select* from sales where subcategory="paper" and quantity>2 and state="texas";
 select* from sales where subcategory="paper" or "art";
 select* from sales where region ="east "or"west";
 select* from sales where sales>=5 and segment ="corporate" and category="technology"; 
 -- i dont want the data regaeding yhe te hnology
 select* from sales where not category="technology";
 -- order by clause
 select* from sales order by sales ;
select* from sales order by sales asc;
select* from sales order by sales desc;
select* from sales where category="technology" order by quantity desc;
select* from sales where category="technology" order by date desc;
select* from sales order by (STR_TO_DATE(orderdate, '%D-%M-%Y')) asc;	