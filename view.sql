use myemployees;

show tables ;

create view myview1
as
select *
from employees;

select * from myview1;

desc myemployees.myview1;
show create view myemployees.myview1;

# 修改

create or replace view myview1 as
          select *
          from departments;


alter view myemployees.myview1 as
    select * from job_grades;

drop view myview1;


# 视图的更新

# '可以'通过视图进行更新操作，和普通的表的操作是相同的
# 但是这种方法不是万能的，有些情况不允许
# 1.包含 分组函数，distinct，group，by，having，union，all的关键字的sql语句
# 2. 常量视图
# 3. 子查询
# 4. join

#  视图一般是用来查询的，一般不能用来增删改

create view update_test
as
select last_name from employees;

insert into update_test values ('stephen');

select * from update_test;

create view const_view
as select 'hello';


# insert into const_view values ('123');

