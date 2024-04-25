CREATE TABLE Employeeinfo (
  EmpID int Primary Key,
  EmpFname varchar(50),
  EmpLname text,
  Department text,
  Project varchar(10),
  Address varchar(255),
  DOB date,
  Gender text
);

CREATE TABLE EmployeePosition (
  EmpID int,
  EmpPosition text,
  DateOfJoining date,
  Salary bigint,
  foreign key (EmpID) references Employeeinfo(EmpID)
);

insert into Employeeinfo VALUES 
(1, 'Rohit', 'Gupta', 'Admin', 'P1','Delhi', '1979-12-2', 'Male'),
(2, 'Rahul', 'Mahajan', 'Admin', 'P2','Mumbai', '1986-10-10', 'Male'),
(3, 'Sonia', 'Banerjee', 'HR', 'P3','Pune', '1983-06-5', 'Female'),
(4, 'Ankita', 'Kapoor', 'HR', 'P4','Chennai', '1983-11-28', 'Female'),
(5, 'Swati', 'Garg', 'HR', 'P5','Delhi', '1991-04-6', 'Female');

insert into EmployeePosition VALUES 
(1, 'Executive', '2020-4-1', 75000),
(2, 'Manager', '2020-4-3', 500000),
(3, 'Manager', '2020-4-2', 150000),
(2, 'Officer', '2020-4-2', 90000),
(1, 'Manager', '2020-4-3', 300000);

select * from Employeeinfo;
select * from EmployeePosition;

-- 1st query
select count('*') from Employeeinfo where Department = 'HR';
-- 2nd query
select CURDATE() as date;
-- 3RD query
select * from Employeeinfo where EmpFname like 's%';
-- 4th query
select * from Employeeinfo order by Department ASC, EmpLname desc;
-- 5th query
select * from EmployeePosition where Salary >= 150000;
-- 6th query
Select EmpPosition ,sum(Salary) from EmployeePosition group by EmpPosition;
-- 7th query
Select * from EmployeePosition order by Salary limit 2,1;

-- now statement
select now();
-- index
create index idx_empName on Employeeinfo(EmpFname);
drop index idx_empName on Employeeinfo;
-- concat
select EmpID, concat(EmpFname, ' ', EmpLname) as 'Name', Department, Project
from Employeeinfo;
-- combining aggregate
select count(*) as total_emp,
  avg(Salary) as avg_salary,
  max(Salary) as max_salary
from EmployeePosition;  

-- case statement
select EmpPosition,
  case
    when Salary > 150000 then 'High Salary'
    when Salary < 100000 then 'low Salary'
    else 'Mid salary'
  end as Salary_category  
from EmployeePosition;
