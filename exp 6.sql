Create table Salesmans (
  salesman_id varchar(255),
  name text,
  city text,
  commission float,
  primary key (salesman_id)
);

Create table Customers (
  cust_id varchar(255),
  name text,
  city text,
  grade int,
  salesman_id varchar(255),
  primary key (cust_id),
  foreign key (salesman_id) references Salesmans(salesman_id)
);

create table Orders (
  ord_no bigint,
  purch_amt bigint,
  ord_date date,
  cust_id varchar(255),
  salesman_id varchar(255),
  primary key (ord_no),
  foreign key (cust_id) references Customers(cust_id),
  foreign key (salesman_id) references Salesmans(salesman_id)
);

insert into Salesmans values
('s001', 'Gautam', 'Chd', 0.03),
('s002', 'Vinner', 'Klk', 0.25),
('s003', 'Sudhanshu', 'Del', 0.05),
('s004', 'Krishna', 'Rtk', 0.15),
('s005', 'Deepak', 'Bnl', 0.07),
('s006', 'Ankit', 'Chd', 0.03);

insert into Customers values
('c001', 'Anup', 'Chd', 4500, 's001'),
('c002', 'Aayush', 'Del', 45500, 's002'),
('c003', 'Komal', 'Bmk', 400, 's005'),
('c004', 'Gurleen', 'Chd', 100, 's003');

insert into Orders values
(001, 1005, '2024-02-07', 'c004', 's006'),
(002, 100, '2024-02-07', 'c004', 's006'),
(003, 500, '2024-02-07', 'c004', 's006'),
(004, 4500, '2024-02-07', 'c004', 's006');

-- 1
select Salesmans.name as Salesmans, Salesmans.city, Customers.name as Customers 
from Salesmans
inner join Customers on Salesmans.salesman_id = Customers.salesman_id
where Salesmans.city = Customers.city;

-- 2
select Orders.ord_no, Orders.purch_amt, Customers.name, Customers.city
from Orders
inner join Customers
on Orders.cust_id = Customers.cust_id
where Orders.purch_amt BETWEEN 500 AND 2000;

-- 3
select Customers.name, Customers.city, Salesmans.name, Salesmans.commission
from Customers
inner join Salesmans
on Salesmans.salesman_id = Customers.salesman_id;

-- 4
select Customers.name, Customers.city, Salesmans.name, Salesmans.commission
from Customers
inner join Salesmans
on Salesmans.salesman_id = Customers.salesman_id
where Salesmans.commission > 0.10;

-- 5 
select Customers.name as Customers, Customers.city AS 'Cust_city',
Salesmans.name as Salesmans, Salesmans.city as 'Sale_city', 
Customers.grade, Salesmans.commission
from Customers
inner join Salesmans
on Salesmans.salesman_id = Customers.salesman_id
where commission > 0.12
and Customers.city != Salesmans.city;









