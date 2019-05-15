# [视 图]
# 22.2.1 简化复杂的联结
# ---已订购了任意产品的所有客户的列表
create view productcustomers as
select cust_name,cust_contact,prod_id
from customers,orders,orderitems
where customers.cust_id=orders.cust_id
  and orderitems.order_num=orders.order_num;
# ---查视图表
select * from productcustomers;
# ---订购了产品TNT2的客户
SELECT cust_name,cust_contact FROM productcustomers
where prod_id='TNT2';

# 22.2.2 用视图重新格式化检索出的数据
create view vendorlocations as
select concat(rtrim(vend_name),'(',rtrim(vend_country),')') as vendor_title
from vendors order by vend_name;

# 22.2.3 用视图过滤不想要的数据
create view customeremaillist as
select cust_id,cust_name,cust_email from customers
where cust_email is not NULL;

# 22.2.4 使用视图与计算字段
create view oderitemsexpanded as
select order_num,prod_id,quantity,item_price,quantity*item_price as expand_price
from orderitems;
select *from oderitemsexpanded where order_num=20005;