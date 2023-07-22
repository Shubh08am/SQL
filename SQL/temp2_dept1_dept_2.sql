create database temp2;

use temp2;

create table dept1(
empid int primary key,
name varchar(255),
role varchar(255)
);

select * from dept1;

insert into dept1
values	(1, 'A', 'engineer'),
		(2, 'B', 'salesman'),
        (3, 'C', 'manager'),
        (4, 'D', 'salesman'),
        (5, 'E', 'engineer');
        
create table dept2(
empid int primary key,
name varchar(255),
role varchar(255)
);

select * from dept2;

insert into dept2
values	(3, 'C', 'manager'),
        (6, 'F', 'marketing'),
        (7, 'G', 'salesman');