use myemployees;

select sum(salary) as `sum`,round(avg(salary),2) as `avg`,max(salary) as `max`,min(salary) as `min`
from employees;

# sum avg 一般用来处理数值类型

# max,min,count 可以用来处理任何类型，只要能够进行比较(支持排序)就可以

# 以上分组函数都忽略null(直接忽略掉null行，所以计算平均值时候也不参与计数，不是 sum/总的个数 )

# count函数

select sum(commission_pct),avg(commission_pct) from employees;

# 统计行数，只要一行中有一个字段不为null，就可以统计进来(主键不会为null)

# 比 count(field) 效率高，一般用count(*)
select count(*) as `count` from employees;
select count(1) from employees;

# 和分组函数一同查询的字段，一般是 group by 的字段