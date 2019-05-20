# [知识点]
# 1.建
drop database yiibaidb;
CREATE DATABASE IF NOT EXISTS yiibaidb
    DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
use crashcourse;
use yiibaidb;

select * from myclass;
SHOW TABLE STATUS LIKE 'myclass';

ALTER TABLE myclass engine  MYISAM;
rollback ;
alter table myclass engine InnoDB;