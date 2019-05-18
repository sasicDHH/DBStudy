# [地址]
-- https://leetcode-cn.com/problems/combine-two-tables/

# [题目环境]
Create table Person
(PersonId int, FirstName varchar(255), LastName varchar(255));
Create table Address
(AddressId int, PersonId int, City varchar(255), State varchar(255));
Truncate table Person;
insert into Person
    (PersonId, LastName, FirstName) values ('1', 'Wang', 'Allen');
insert into Address
    (AddressId, PersonId, City, State) values ('1', '2', 'New York City', 'New York');

# [题目]
-- 无论 person 是否有地址信息，都需要基于上述两表提供 person 的以下信息：
-- FirstName, LastName, City, State

# [解]
alter table Person add primary key(PersonId);
alter table Address add primary key(AddressId);

select FirstName,LastName,City,State from Address a right outer join Person b
    on a.PersonId=b.PersonId;