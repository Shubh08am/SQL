create database temp3;
use temp3;

create table pairs(
A int,
B int
);

insert into pairs values (1,2), (2,4), (2,1), (3,2), (4,2), (5,6), (6,5), (7,8);

-- remove reversed pair
-- METHOD 1 -> JOIN
select * from pairs;