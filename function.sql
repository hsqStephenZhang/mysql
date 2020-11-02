# 函数   vs  存储过程

#  函数只能有一个返回值，但是存储过程可以有多个返回值 out/inout

use myemployees;
SET GLOBAL log_bin_trust_function_creators = 1;


drop function if exists getNum;
create function getNum()returns int
begin
    declare res int default 0;
    select count(*) into res
    from employees;
    return res;
end;

select getNum();

select *
from employees;

drop function if exists getName;
create function getName(_id int)returns varchar(20)
begin
    declare s varchar(40) default null;
    select concat(first_name,' ',last_name) into s
    from employees
    where _id=employee_id;
    return s;
end;

select getName(100);

show create function getName;


use mysql;
show tables ;

select *
from db;