# [触发器]
-- 文本Product added将对每个插入的行显示一次
create trigger newproduct after insert on products
    for each row select 'Product added' into @newp1;

# 25.3 删除触发器
drop trigger newproduct;

# 25.4.1 INSERT触发器
-- 例1. 定义
create trigger neworder after insert on orders
    for each row select new.order_num into @newo1;
-- 执行
insert into orders(order_date, cust_id)
    values (now(),10001);
-- 调用
select @newo1;

# 25.4.2 DELETE触发器
create trigger deleteorder before delete on orders
    for each row
    begin
        insert into archive_orders(order_num,order_date,cust_id)
            values(OLD.order_num,OLD.order_date,OLD.cust_id);
    end;
-- 执行
delete from orders where order_num=20012;

# 25.4.3 UPDATE触发器
-- 定义 更新vend_country时，把vend_state设置大写
create trigger updatevendor before update on vendors
    for each row
        set new.vend_state=upper(new.vend_state);
-- 执行
update vendors set vend_country='japan' where vend_id=1006;
