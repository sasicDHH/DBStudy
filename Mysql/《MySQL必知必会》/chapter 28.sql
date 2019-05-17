# [安全管理]

select host,user from mysql.user;
use mysql;
# 查
show grants ; # 查看自己
show grants for dinghonghui@localhost;
show grants for ding2@localhost;

-- 设置权限
# [普通用户]    查询、插入、更新、删除
grant select on testdb.* to common_user@'%';
-- （作用域：某些列）
grant select(id, se, rank) on testdb.apache_log to dba@localhost;
grant insert on testdb.* to common_user@'%';
grant update on testdb.products to common_user@'%';# （作用域：整个表）
grant delete on testdb.* to common_user@localhost;
grant select, insert, update, delete on testdb.* to common_user@'%'

# [数据库开发人员] 创建表、索引、视图、存储过程、函数
-- 创建、修改、删除 表结构权限
grant create on testdb.* to developer@'192.168.0.%';
grant alter on testdb.* to developer@'192.168.0.%';
grant drop on testdb.* to developer@'192.168.0.%';
-- 外键权限
grant references on testdb.* to developer@'192.168.0.%';
-- 临时表权限
grant create temporary tables on testdb.* to developer@'192.168.0.%';
-- 索引权限
grant index on testdb.* to developer@'192.168.0.%';
-- 视图权限
grant create view on testdb.* to developer@'192.168.0.%';
grant show view on testdb.* to developer@'192.168.0.%';
-- 存储过程、函数权限  （作用域：单个库）
grant create routine on testdb.* to developer@'192.168.0.%'; -- now, can show procedure status
grant alter routine on testdb.* to developer@'192.168.0.%'; -- now, you can drop a procedure
grant execute on testdb.* to developer@'192.168.0.%';
-- （作用域：存储过程、函数上）
grant execute on procedure testdb.pr_add to 'dba'@'localhost';
grant execute on function testdb.fn_add to 'dba'@'localhost';

# [普通DBA] 某个库
grant all privileges on testdb to dba@'localhost';# 关键字 “privileges” 可以省略
# [高级DBA] 所有库 （作用域：整个服务器）
grant all on *.* to dba@'localhost';

# 删，撤销
revoke select on crashcourse.* from ding2@localhost;

set password for ding2@localhost=password('ding123');
set password =password ('ding123');



