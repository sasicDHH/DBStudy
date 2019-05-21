Create table If Not Exists Customers (Id int, Name varchar(255));
Create table If Not Exists Orders (Id int, CustomerId int);
Truncate table Customers;
insert into Customers (Id, Name) values ('1', 'Joe');
insert into Customers (Id, Name) values ('2', 'Henry');
insert into Customers (Id, Name) values ('3', 'Sam');
insert into Customers (Id, Name) values ('4', 'Max');
Truncate table Orders;
insert into Orders (Id, CustomerId) values ('1', '3');
insert into Orders (Id, CustomerId) values ('2', '1');


select name as Customers from Customers a left join Orders b
    on b.CustomerId=a.Id
    where CustomerId is NULL;

select name as Customers from Customers a
where not exists(select * from Orders b where a.id =b.CustomerId);

select name as Customers  from Customers
where id not in (select CustomerId from Orders );