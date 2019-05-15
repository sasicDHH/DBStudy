# [创建和操纵表]
select distinct last_insert_id()from customers;
# 21.2 更新表
# ---增列
alter table vendors add vend_phone char(20);
# ---删列
alter table vendors drop column vend_phone;
# 21.4 重命名表
rename table backup_customers to customers,
    backup_vendors to vendors,
    backup_products to products;