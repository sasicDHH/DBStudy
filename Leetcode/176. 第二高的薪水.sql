Create table If Not Exists Employee (Id int, Salary int);
Truncate table Employee;
insert into Employee (Id, Salary) values ('1', '100');
insert into Employee (Id, Salary) values ('2', '200');
insert into Employee (Id, Salary) values ('3', '300');
#[解法1]
-- 当Employee表里只有一条数据时，内层SQL语句查询不到数据，其返回结果是空，而外层SQL的作用是把内层的查询结果赋值给SecondHighestSalar
select (select distinct salary from Employee order by salary desc limit 1,1) as SecondHighestSalary ;

# [解法2]
select IFNULL((select distinct(Salary)
from Employee
order by Salary desc
limit 1,1),null) as SecondHighestSalary