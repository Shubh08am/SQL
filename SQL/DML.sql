use tmp;

create table customer(
id int primary key,
cname varchar(255) not null,
address varchar(255),
gender char(2),
city varchar(255),
pincode integer
);

insert into customer 
values (213, 'Ram', 'basant vihar', 'M', 'ajmer', 100101),
	   (312, 'Shyam', '50 - khedli', 'M', 'kaashi', 421003),
       (393, 'Ghanshyam', '60 - Baroda', 'M', 'Delhi', 421003);
       
insert into customer (id, cname, gender, pincode, address, city)
values  (105, 'Radha', 'F', 101001, '56 - kalwar', 'Jaipur'),
		(167, 'Rakesh', 'M', 101451, '6 - kamalpur', 'Raipur'),
        (185, 'kriti', 'F', 134001, '91 - adarsh colony', 'Udaipur');
        
select * from customer;

insert into customer(id, cname)
values	(1, 'Bob');

-- UPDATE 
UPDATE customer SET address = 'Mumbai', gender = 'M', pincode = 101001, city = 'Mumbai' where id = 1;

-- UPDATE - update multiple rows
SET SQL_SAFE_UPDATES = 0;
UPDATE customer SET pincode = 101001;

UPDATE customer SET pincode = pincode + 1;

-- DELETE FROM
DELETE FROM customer where id = 167;
DELETE FROM customer;
SET SQL_SAFE_UPDATES = 1;

-- REPLACE INTO
REPLACE INTO customer(id, cname)
VALUES (105, 'rakhi');

replace into customer(id, cname, city, pincode)
values (312, 'Ramesh', 'Mumbai', 101001);

replace into customer set id = 213, cname = 'Raj', pincode = 102341;

replace into customer(id, cname, address, gender)
	select id, cname, address, gender
    from customer where id = 393; -- if here I will use an id which does not exist, then it will do nothing
    
create table order_details(
order_id int primary key,
delivery_date date,
cust_id int,
foreign key(cust_id) references customer(id) ON DELETE SET NULL
);

select * from order_details;

insert into order_details
values (001, '2013-12-11', 167);

insert into order_details
values (002, '2013-12-14', 167);

DELETE FROM customer where id = 167;

-- now I had changed cust_id from delete cascade to delete set null


insert into order_details
values (001, '2013-12-11', 185);

insert into order_details
values (002, '2013-12-14', 185);

delete from customer where id = 185;