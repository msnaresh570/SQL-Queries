
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
  (003, 'Lead', '2016-06-11 00:00:00');
 
 select * from worker;
 # getting the highhest salary from worker
 select salary from worker
 order by salary desc
 limit 1;
 
 #2nd highest salary... clause- OFFSET
 #getting 2 records from the 3rd worker_id 
 select * from worker
 order by worker_id asc
 limit 2
 offset 2;
 
 #getting 1st and 2nd worker id seperately in 2 codes
 select worker_id from worker
 order by worker_id desc
 limit 1
 offset 1;
 
 #getting the 2nd highest salary from worker by using offset
 select salary from worker
 order by salary desc
 limit 1
 offset 2;
 
 #instead of giving limit and offset we can give both at once
 select salary from worker
 order by salary desc
 limit 2,1;
 
 #Distinct (unique salary records)
 select distinct(salary) from worker
 order by salary desc;
 
 #gettin unique departments
 select distinct(department) from worker;
 
 /* AGGREGATE and its clauses
 count.sum,avg,max,min,length,...
 */
 
 #gettin the count of employees working
 select count(*) from worker;
 
 #gettin the total salary from the table
 select sum(salary) from worker;
 
 #avg
  select avg(salary) from worker;
  #max
   select max(salary) from worker;
 #min
select min(salary) from worker;

#groupby clause
#gettin the count of workers from each dept.
select department, count(department) from worker
group by department;

#getting total salary dept.wise
select department, sum(salary) as "total salary" from worker
group by department;

#getting total salary dept.wise with depat. starting with "A"
select department, sum(salary) as "total salary" 
 from worker
 where department like "A%" 
group by department;

#getting total salary dept.wise with depat. starting with "A" 
#salary > 1lakh  "HAVING CLAUSE"
select department, sum(salary) as "total salary" 
 from worker
 where department like "A%" 
 group by department
having sum(salary)>"1000000";

#get me the department wise count of workers where more than 2 people are working
select * from worker;
select department, count(worker_id) from worker
group by department
having count(worker_id)>"2";

/* dept. wise avg salary where firstname has a "a" in it
and also no. of workers in department  >2, count od dept. as well
*/
select department, avg(salary), count(department) from worker
where first_name like "%a%"
group by department
having avg(salary)>"30000" and count(department)>2
order by department asc;

select * from society_members;
select * from committees;
select * from soc2;

-- date 08/01/2025 
#DDL-Data Definition Language
/* create, truncate, drop, alter, (rename)

-- creating the databse and tables 
/*
create table tab-name(
col1_name datatype1 constraint1(optional),
col2_name datatype2 constarint2(optional),
.....refer LMS
.....
.....
);

->DATATYPES:-
->KEYS:- a) primary key: will be always 'unique' & cant be blank/null
		b) Unique: unique but can have null record
        c) Foreign key: helps to create relationship or reference
        d) Candidate key:
        e)alternate key: Other than the primary key all are AK
        f)super key: combination of multiple keys
        g) composite key: a primary key consists of 2 or more columns
->CONSTRAINTS:(having restrictions makes constraints)
 a) primary key
 b) unique 
 c)foreign key
 d) not null: no nulls allowed
 e) default 
 f)check
 g) Index

*/
#show engines;
create database pga44;
use pga44;
-- create table of customers
create table customers (
cust_id int primary key,
cust_name varchar(20) not null,
mobile int unique not null,
city varchar(10) default "HYD"
);
select * from customers;
desc customers;

#DML- insert, update, delete
-- Inserting records into customers
insert into customers(cust_id, cust_name, mobile, city)
				values(11, "alan", 987987, "kobra");

select * from customers;
-- insert multiple records
insert into customers(cust_id, cust_name, mobile, city)
			values(12, "bhuvan", 858585, "asd"),
					(13, "farah", 965896, "kol"),
                    (44, "gagan", 745874, "del");
                    
select * from customers;
insert into customers
			values(55, "venu", 656565, "nep");
            
insert into customers(cust_id, cust_name, mobile)
			values  (26, "gopi", 258258);   
            select * from customers;
            
#DDL- (truncate, drop, alter)
truncate customers;
select * from customers;

drop table customers;
select * from customers;
/* alter has 4 clause
   1. change, 2. modify, 3. add, 4.drop
   */
   desc customers;

#ALTER
#1. change- renaming the column names, datatypes and constraints
truncate customers;

alter table customers change cust_id customer_id int;
desc customers;

alter table customers change id customer_id int;
desc customers;
alter table customers change location city char(25);
desc customers;

#2 modify- changes datatypes and constraints
alter table customers modify cust_name varchar(10) unique;
desc customers;

#3. add- insterting a column in between 
alter table customers add mail_id varchar(30);
desc customers;
#as i forgot to mention the constraint i wrote modify
alter table customers modify mail_id varchar(30) unique;
#alter-add-after
alter table customers add gender varchar(10) after cust_name;
desc customers;

#4. Drop
alter table customers drop gender;
-- can drop the key also
alter table customers drop primary key;

#Rename
rename table customers to clients;
desc clients;

SHOW TABles;

# PRODUCT table
create table products(
product_id varchar(10) primary key,
prod_name varchar(20),
brand varchar(10),
price float  not null
);

insert into products values("1a","TV","Sony",5000.25),
                            ("2b","IB","Wipro",1200.25),
                            ("3c","AC","LG",4400.20),
                            ("4d","Phone","Apple",7000.25),
                            ("5e","Fridge","Samsung",3000.25);
select * from products;
select * from customers;

# CREATE TABLE of ORDERS

create table orders(
ord_id int primary key auto_increment,
ord_date date ,
ord_amt float not null,
ord_location varchar(25) ,
prod_id varchar(10),
cust_id int,
check(ord_location in ("HYD","MUM","CHN","DEL")),
foreign key(prod_id) references products(product_id) on delete cascade on update cascade,
foreign key(cust_id) references customers(cust_id) on delete set null on update set null
);

select * from orders;
select * from customers;
select * from products;

delete from customers
where cust_id=12;

select * from products;
select * from orders;

delete from products
where product_id="2b";

select * from products;
select * from orders;

insert into orders values(101,"2025-01-05",45000.36,"HYD","1a",12);
 
select * from orders;




insert into orders(ord_date,ord_amt,ord_location,prod_id,cust_id)
			values("2025-01-06",5000.36,"MUM","2b",13),
				   ("2025-01-07",800.36,"CHN","3c",26),
                  ("2025-01-08",5000.36,"HYD","4d",13);
 select * from orders;   
 
 
 # DML : UPDATE
 select * from customers;
select * from products;
select * from orders;

# single column update
update customers 
	set cust_name="Bhuvan Raj"
    where cust_id=12;
    
# multiple column update   
update customers
      set cust_name="Sivashini",
          mobile =0646534
      where cust_id=44;
      
 update customers
      set city="RAIPUR"
      where city in ("kobra","kol");

select * from customers;


# Delete

select * from orders;

delete from orders
where ord_id=103;

select * from orders;


# COMBINING Multiple tables

# union, union all ,intersect(not working in Mysql)

select * from society_members;
select * from soc2;

desc orders;

# UNION
select * from society_members
union
select * from soc2;

select * from society_members;
select * from soc2;

select * from society_members
union all
select * from soc2;



# JOINS

select * from society_members;
select * from committees;


# INNER JOIN : only the matching recordds from both the table
# inner join, left join,right join,cross join, natural, self join,

/*
select * from left_table as L
join
right_table as R
on L.joining_key= R.joining_kery;

select * from left_table as L
join
right_table as R
using(joining_key) ;    This works when common cvolumn name is exactly same
*/

select * from  society_members
inner join 
committees
on society_members.name=committees.name;

select memnber_id,com_id,scm.name from  society_members as scm
inner join 
committees as cmt
on scm.name=cmt.name;

select * from  society_members
inner join 
committees
using(name);

select * from  society_members
join 
committees
using(name);

# LEFT JOIN
select * from  society_members as scm
left join 
committees as cmt
on scm.name=cmt.name;

select * from  society_members as scm
left join 
committees as cmt
on scm.name=cmt.name
where cmt.name is null;


# RIGHT JOIN
select * from  society_members as scm
right join 
committees as cmt
on scm.name=cmt.name;

select * from  society_members as scm
left join 
committees as cmt
on scm.name=cmt.name
where cmt.name is null;

show tables;


