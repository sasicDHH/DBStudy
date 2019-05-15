#[更新和删除数据]
# 20.1 更新数据
# ---单列
update customers set cust_email='elmer@fudd.com'
where cust_id=10005;
update customers set cust_email=NULL
where cust_id=10005;
# ---发生错误，也继续进行更新
update ignore customers set cust_email='elmer@fudd.com'
where cust_id=10005;
# ---多列
update customers set cust_email='elmer@fudd.com',cust_name='nihao'
where cust_id=10005;

# 20.2 删除数据
# ---删除一个记录
delete from customers where cust_id=10006;