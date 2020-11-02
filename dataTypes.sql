use db;

show tables ;

#-------------------------------------------------------
# int类型  默认为有符号

create table IntTypes(
    t1 TINYINT unsigned,  # 设置无符号
    t2 SMALLINT unsigned,
    t3 MEDIUMINT zerofill, # 零填充，这样就是无符号数字了，如果不设置长度，不够的话会使用0填充(显示的时候)
    t4 Int,
    t5 BIGINT
);

# out of range 错误,无法插入
insert into IntTypes(t1) value(1000000);

select *
from IntTypes;


#-------------------------------------------------------
# 小数
# float(M,D) M:整数+小数位数 D:小数位数
# M和D都可以省略
# 默认情况下，float和double会随着插入的数值的精度改变
# 定点数默认为 (10,0) ，精度较高

create table DecimalTypes(
    t1 float(5,2),
    t2 double(5,2),
    t3 decimal(5,2)  # 定点小数
);

select *
from DecimalTypes;

insert into DecimalTypes(t1, t2, t3) VALUES
(123.456,123.456,123.456),
(123.4567,123.4567,123.4567);

#------------------------------------------------------
# 字符类型

create table StringTypes(
    t1 char(3),  # 固定长度   --- 相当于数组,性能要好一点，但是比较耗费空间
    t2 varchar(3),  # 可变长度 --- 相当于链表，这里规定的是最大长度
    t3 text(1000)
);

describe StringTypes;

# 报错，123456长度超过了规定的长度
# insert into StringTypes(t1,t2) value('123456','123456');
insert into StringTypes(t2) value('123');
# insert into StringTypes(t2) value('123456');

select *
from StringTypes;


#----------------------------------------------------------
# 日期和时间类型
/*
 timestamp    ---> 受到时区的影响
 time
 year
 month

 */
drop table if exists TimeTypes;
create table TimeTypes(
    t1 TIMESTAMP,
    t2 datetime,
    t3 year
);

insert into TimeTypes(t1, t2,t3) values (now(),date(now()),year(now()));

select *
from TimeTypes;

show variables like '%time_zone%';


