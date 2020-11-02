#  创建数据库
create database books;

use books;

# 显示库的信息
show variables like '%char%';

# rename database books to myBooks

# 修改库的信息
alter database books character set 'utf8';
alter database books character set 'gbk';

# 如果存在，则删除
drop database if exists books;


create database db;
use db;

# 不存在则创建
create table if not exists  t1(
    id int primary key not null ,
    name varchar(30),
    password varchar(30)
)character set utf8;

insert into db.t1(id, username, password)
VALUES
(1,'stephen','123');
insert into db.t1(id, username, password)
VALUES
(2,'zhang','234');
insert into db.t1(id, username, password)
VALUES
(3,'zhuzhu','345');
insert into db.t1(id, username, password)
VALUES
(4,'weiwei','456');


show tables ;

describe t1;

/*
 表的修改：
 1.修改列名字
 2.修改列的类型和限制条件
 3.添加新列
 4.删除列
 5.修改表名

 */



# 修改(需要添加类型信息)
# alter table t1 change column name username varchar(20); # 后面修改了表的列名

alter table t1 modify column password varchar(30) default '123456';

# 添加新列
alter table t1 add column salary double default null;

# 删除列
alter table t1 drop column salary;

desc t1;

# 重命名
alter table t1 rename to table1;
alter table table1 rename to t1;

show tables ;

drop table if exists copy;

# 复制表的结构+数据
create table copy
select *
from db.t1;

select *
from t1;

create table copy2
select id
from db.t1
where 0;

select *
from copy2;
