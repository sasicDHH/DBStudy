# [事务处理]
# 26.2 控制事务处理

# 26.2.1 使用ROLLBACK
select *from ordertotals;
start transaction;
delete from ordertotals;
select *from ordertotals;
rollback ;
select *from ordertotals;

# 26.2.2 使用COMMIT
start transaction;
delete from orderitems where order_num=20010;
delete from orders where order_num=20010;
commit ;

# 26.2.3 使用保留点
savepoint delete1;
rollback to delete1;

