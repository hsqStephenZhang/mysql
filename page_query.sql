use myemployees;

/*
 分页查询

 limit offset,size

 offset 从0开始

 查询第一页，size=10 ------> limit 0,10
 查询第二页，size=10 ------> limit 10,10
 查询第i页， size=10 ------> limit (i-1)*size,10

 */


select * from employees
limit 0,5;

select * from employees
limit 5;


select *
from employees
limit 5,5


select last_name,salary
from employees
where commission_pct is not null
order by salary desc
limit 10;