create database if not exists curd;

use curd;

create table insert_test(
    t1 int primary key not null ,
    name varchar(30),
    password varchar(30)
)

show tables ;
# 支持一次插入多行，支持子查询
insert into insert_test(t1,name,password) values(1,'stephen','123');

# 一次只能插入一次
insert into insert_test set t1=2,name='yangshuyu',password='456';

# 更新操作

update insert_test set name='ysy'
where t1=2;

select *
from insert_test;


# 删除

delete from insert_test
where password like '%456%';

truncate insert_test
