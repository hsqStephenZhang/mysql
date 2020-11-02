show variables ;
use myemployees;

/*
 系统： @@开头
        全局 global variables
        会话 session variables
 用户 @开头
 局部 declare 在begin/end 代码块(procedure)中有效

 */

show global variables ;
show global variables like '%char%';
select @@global.autocommit;

select @@core_file;
select @@autocommit;

show session variables ;

show session variables like '%char%';


#  用户自定义变量

set @name='stephen';
set @passwd:='123';

select @name;
select @passwd;


set @table1='jobs';
select @table1;


drop procedure if exists getName;
create procedure getName(in _id int,out res varchar(20))
begin
    select name into res from admin
        where id=_id;
end;


set @res1=null;

call getName(1,@res1);

select @res1;


drop procedure if exists swapName;
create procedure swapName(in _id1 int,in _id2 int)
begin
    declare str1 varchar(20);
    declare str2 varchar(20);
    declare tmp varchar(20) default null;
    select name into str1
        from admin
    where id=_id1;
    select name into str2
        from admin
    where id=_id2;
    update admin set name=null
    where id=_id1;

    update admin set name=str1
    where id=_id2;

    update admin set name=str2
    where id=_id1;
end;

select * from admin;
call swapName(3,2);

update admin set name='ljy'
where id=2;


