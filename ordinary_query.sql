use myemployees;

# 查询常量
select 100;
select 'hello';
select 10*9;
select 10%3;
select version();

# 别名
# 便于展示，在联合查询的时候，可以区分开
select 100 as res;
select first_name as 姓,last_name as 名 from employees;

#  可以不使用as，而是空格隔开即可
select first_name 姓,last_name 名 from employees;

select salary as "out put" from employees;

# 不重复显示
select distinct department_id
from employees order by department_id desc ;


# + 号的作用
select '100'+90;  # 可以转换成功
select 10+90;  # 不需要转换，进行数值计算
select 'hello'+10;  # 将无法转换的字符串作为0计算
select null+100+10+20;

select concat('a','b','c') as result;

# 如果不使用ifNULL，在拼接字符串的时候，遇到null整个字符串就会变为null
  select concat(first_name,'---',last_name,'---',ifnull(commission_pct,0)) as name from employees;


