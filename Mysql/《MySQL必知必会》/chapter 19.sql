#[插入数据]
# 19.2 插入完整的行
# ---插入一个新客户
insert into customers
values (NULL,'pppp','100 street','Los Angels','CA','90046','USA',NULL,NULL);
# ---降低优先级
insert low_priority into customers
values (NULL,'pppp','100 street','Los Angels','CA','90046','USA',NULL,NULL);
# ---插入行的一部分
insert into customers(cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country)
values ('pepesdf','100 Main Street','Los Angeles','CA','90046','USA');
# 19.3 插入多个行
insert into customers(cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country)
values ('pepesdf','100 Main Street','Los Angeles','CA','90046','USA'),
       ('sdfdf','43 Main Street','NY','NY','11213','USA');
# 19.4 插入检索出的数据
insert into customers(cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country)
select cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country from custnew;