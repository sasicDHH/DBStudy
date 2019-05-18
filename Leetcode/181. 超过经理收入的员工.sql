Create table If Not Exists Employee (Id int, Name varchar(255), Salary int, ManagerId int);
Truncate table Employee;
insert into Employee (Id, Name, Salary, ManagerId) values ('1', 'Joe', '70000', '3');
insert into Employee (Id, Name, Salary, ManagerId) values ('2', 'Henry', '80000', '4');
insert into Employee (Id, Name, Salary, ManagerId) values ('3', 'Sam', '60000', null);
insert into Employee (Id, Name, Salary, ManagerId) values ('4', 'Max', '90000', null);

-- 子查询
select a.Name as Employee from Employee a where a.Salary>(select Salary from Employee b where a.ManagerId=b.id);
-- 自联结
select e1.Name as Employee from Employee as e1 ,Employee as e2
where e1.ManagerId=e2.Id AND e1.Salary>e2.Salaryl