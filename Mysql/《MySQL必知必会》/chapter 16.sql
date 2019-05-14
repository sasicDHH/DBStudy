# 第16章
select concat(rtrim(vend_name),'(',rtrim(vend_country),')') as vend_title
from vendors order by vend_name;
select cust_name,cust_contact from customers as c,orders as o,orderitems as oi
where c.cust_id=o.cust_id and oi.order_num=o.order_num and prod_id='TNT2';
select prod_id,prod_name from products
where vend_id=(select vend_id from products where prod_id='DTNTR');
# 16.1
select p1.prod_id,p1.prod_name from products as p1,products as p2
where p1.vend_id=p2.vend_id and p2.prod_id='DTNTR';
# 16.2.2 自然联结
select c.*,o.order_num,o.order_date,oi.prod_id,oi.quantity,oi.item_price
from customers as c,orders as o,orderitems as oi
where c.cust_id=o.cust_id and oi.order_num=o.order_num and prod_id='FB';
# 16.2.3 外部联结
select c.cust_id,o.order_num from customers as c inner join orders as o
on c.cust_id=o.cust_id;
select c.cust_id,o.order_num from customers as c left outer join orders as o
on c.cust_id=o.cust_id;
select c.cust_id,o.order_num from customers as c right outer join orders as o
on c.cust_id=o.cust_id;

# 16.3 使用带聚集函数的联结
# --- 有订单的客户及每个客户的订单数
select c.cust_name,c.cust_id,count(o.order_num) as num_ord
from customers as c inner join orders as o
on c.cust_id=o.cust_id group by c.cust_id;
# --- 所有客户及每个客户的订单数
select c.cust_name,c.cust_id,count(o.order_num) as num_ord
from customers as c left outer join orders as o
on c.cust_id=o.cust_id
group by c.cust_id;