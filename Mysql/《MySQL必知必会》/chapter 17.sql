#[组合查询]
# 17.2.1 使用UNION
# ---价格不高于5的所有物品
select vend_id,prod_id,prod_price from products where prod_price<=5;
# ---供应商1001和1002生产的所有物品
select vend_id,prod_id,prod_price from products where vend_id in (1001,1002);
# ---供应商1001和1002生产的 或 价格不高于5的物品
select vend_id,prod_id,prod_price from products
where prod_price<=5 or vend_id in (1001,1002)order by vend_id,prod_price;
select vend_id,prod_id,prod_price from products where prod_price<=5
union
select vend_id,prod_id,prod_price from products where vend_id in (1001,1002);
select vend_id,prod_id,prod_price from products where prod_price<=5
union all
select vend_id,prod_id,prod_price from products where vend_id in (1001,1002);
# ---排序
select vend_id,prod_id,prod_price from products where prod_price<=5
union
select vend_id,prod_id,prod_price from products where vend_id in (1001,1002)
order by vend_id,prod_price;