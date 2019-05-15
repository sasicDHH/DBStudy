# 23.3.1 执行存储过程
# ---执行名为productpricing的存储过程，返回产品的最低、最高和平均价格。

# 23.3.2 创建存储过程
create procedure productpricing()
begin
    select avg(prod_price) as priceaverage
    from products;
end ;
call productpricing(); # 执行

# 23.3.3 删除存储过程
drop procedure if exists productpricing;

# 23.3.4 使用参数
# ---创建
create procedure productpricing(
    out pl decimal(8,2),
    out ph decimal(8,2),
    out pa decimal(8,2)
)
begin
    select min(prod_price) into pl from products;
    select max(prod_price) into ph from products;
    select avg(prod_price) into pa from products;
end;
# ---执行 返回三个变量 @pricelow,@pricehigh,@priceaverage
call productpricing(@pricelow,@pricehigh,@priceaverage);
# ---调用变量
select @priceaverage;
select @priceaverage,@pricelow,@pricehigh;

# ---例2. ordertotal接受订单号并返回该订单的合计
create procedure ordertotal(
    in onumber int,
    out ototal decimal(8,2)
)
begin
    select sum(item_price*quantity) from orderitems
        where order_num=onumber into ototal;
end;
# ---执行
call ordertotal(20005,@total);
# ---调用
select @total;

# 23.3.5 建立智能存储过程
# 例1.   订单合计，对合计增加营业税，
-- Name:ordertotal
-- Parameters:onumber=order number
--            taxable=0 if not taxable,1 fi taxable
--            ototal=order total variable
create procedure ordertotal(
    in onnumber int,
    in taxable boolean,
    out ototal decimal(8,2)
)comment 'Obtain order total, optionally adding tax'
begin
    -- Declare variable for total
    declare total decimal(8,2); # 定义局部变量
    -- Declare tax percentage
    declare taxrate int default 6;
    -- Get the order total;
    select sum(item_price*quantity)from orderitems
        where order_num=onnumber into total;
    -- Is this taxable?
    if taxable then
        -- Yes, so add taxable to the total
        select total+(total/100*taxrate) into total;
    end if;
    -- And finally, save to out variable
    select total into ototal;
end;
# 执行--调用 1
call ordertotal(20005,0,@total);
select @total;
# 执行--调用 2
call ordertotal(20005,1,@total);
select @total;

# 23.3.6 检查存储过程
-- 检查存储过程
SHOW CREATE PROCEDURE ordertotal;
--
show procedure status;
show procedure status like 'ordertotal';
