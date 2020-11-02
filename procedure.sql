use myemployees;

use girls;
show tables ;
select *
from boys;

select *
from girls.beauty;

drop procedure if exists mypr1;
create procedure mypr1(in boyId int,out res varchar(20))
begin
    select boyName into res
    from boys where id=boyId;
end;

set @res1='123';
call mypr1(1,@res1);
select @res1;


create procedure mul2(inout a int ,inout b int)
begin
    set a=a*2;
    set b=b*2;
end;

set @a1=1;
set @a2=2;

call mul2(@a1,@a2);

select @a1,@a2 ;

use myemployees;
show tables ;

select *
from employees;


create table admin(
    id int primary key not null auto_increment,
    name varchar(20) unique,
    password varchar(20) default null
);

desc admin;

insert into admin(name, password)
values ('stephen','123'),('ysy','456'),('ljy','789');

select *
from admin;

drop procedure if exists authorize;
create procedure authorize(in name varchar(20),in password varchar(20),out res boolean)
begin
    select if(
        (
            select count(*)
            from admin
            where name=admin.name and admin.password=password
            ),true,false
        ) into res;
end;


set @exist1=false;
call authorize('stephen','123',@exist1);

select @exist1;

drop procedure if exists getNum;
create procedure getNum()
begin
    # 使用局部变量
    declare a int default 0;
    select count(*) into a from admin;
    select a;
end;

#  不合法，这里的变量不可以是多个数据
# set @outName=(
#     select name from admin
#     );
call getNum();


drop procedure if exists getDate;
create procedure getDate(in time datetime)
begin
    select date_format(time,'%Y--%m--%d');
end;

call getDate(now());


drop procedure if exists getN;
create procedure getN(in startIndex int,in num int)
begin
    select *
    from employees
    order by salary desc
    limit startIndex,num;
end;

call getN(5,10);

# ----------------------------------------------
# 显示存储过程的信息

show create procedure getNum;

