#[游标]
# 24.2.1 创建游标
-- 例1.
create procedure processorders()
begin
    declare ordernumbers cursor # 1. 定义游标
        for select order_num from orders;
    -- 2. 开
    open ordernumbers;
    -- 3. 闭
    close ordernumbers;
end;
-- 例2. 当前行检索
create procedure processorders()
begin
    declare o int; -- 局部变量
    declare ordernumbers cursor
        for select order_num from orders;
    open ordernumbers;
    fetch ordernumbers into o; # 检索当前行的order_num列
    close ordernumbers;
end;
call processorders();
# ---调用变量
select @o;

-- 例3 循环检索
create procedure processorders()
begin
    declare done boolean default 0;
    declare o int; -- 局部变量
    declare ordernumbers cursor
        for select order_num from orders;
    declare continue handler
        -- 当SQLSTATE '02000'出现时， SET done=1
        for sqlstate '02000' set done = 1;


    open ordernumbers;

    repeat
        fetch ordernumbers into o;
    until done end repeat;

    close ordernumbers;
end;
-- 例4.
create procedure processorders()
begin
    declare done boolean default 0;
    declare o int; -- 局部变量
    declare t decimal(8,2); # 存储每个订单的合计
    declare ordernumbers cursor
        for select order_num from orders;
    declare continue handler
        for sqlstate '02000' set done = 1;

    create table if not exists ordertotals(
        order_num int,
        total decimal(8,2)
    );

    open ordernumbers;

    repeat
        fetch ordernumbers into o;
        call ordertotal(o,1,t); # 内部调用不加@
        insert into ordertotals(order_num,total)
            values (o,t);
    until done end repeat;

    close ordernumbers;
end;
call processorders();
select * from ordertotals;