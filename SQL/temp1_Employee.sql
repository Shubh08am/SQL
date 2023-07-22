create database temp1;

use temp1;

create table employee(
id int primary key auto_increment,
fname varchar(255),
lname varchar(255),
Age int,
CONSTRAINT age_chk check(age >= 18),
emailID varchar(255),
constraint emailID_chk check(emailID like '%@gmail.com'),
PhoneNo int,
city varchar(255)
);

select * from employee;

insert into employee
values (1, 'Aman', 'Khare', 23, 'amankhare2002@gmail.com', 585, 'Delhi');

insert into employee
values	(2, 'Chaman', 'Lathiyare', '24', 'chaman@gmail.com', 878, 'Palam'),
		(3, 'Chitra', 'Shinde', '21', 'chitra@gmail.com', 528, 'Kolkata'),
        (4, 'Khagesh', 'Sharma', '19', 'Khagesh@gmail.com', 284, 'Raipur'),
        (5, 'Ramesh', 'Gupta', '18', 'Ramesh@gmail.com', 716, 'Jaipur');

create table client(
id int primary key auto_increment,
fname varchar(255),
lname varchar(255),
Age int,
CONSTRAINT age_chk1 check(age >= 18),
emailID varchar(255),
PhoneNo int,
city varchar(255),
empID int,
foreign key(empID) references employee(id) ON DELETE SET NULL
);

alter table client rename to client_details;

select * from client_details;

insert into client_details
values	(1, 'Chirag', 'Lathiyare', '44', 'chirag@hotmail.com', 878, 'Kolkata', 3),
		(2, 'Shekhar', 'Shinde', '31', 'shekhar@gmail.com', 528, 'Kolkata', 3),
        (3, 'Ajay', 'Sharma', '29', 'ajay@abc.com', 284, 'Delhi', 1),
        (4, 'Rakesh', 'Gupta', '19', 'rakesh@yahoo.com', 716, 'Hyderabad', 5),
        (5, 'Kamlesh', 'Khare', 28, 'kamleshkhare2002@xyz.com', 585, 'Mumbai', 2);


create table project(
id int primary key,
empID int,
name varchar(255),
startdate date,
clientID int,
foreign key(empID) references employee(id) on delete set null,
foreign key(clientID) references client_details(id) on delete set null
);

select * from project;

insert into project
values	(1, 1, 'A', '2021-04-21', 3),
		(2, 2, 'B', '2021-03-12', 1),
        (3, 3, 'C', '2021-01-16', 5),
        (4, 4, 'D', '2021-04-27', 2),
        (5, 5, 'E', '2021-05-01', 4);
        






