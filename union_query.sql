use myemployees;

/*

 查询语句1
 union
 查询语句2
 union (all)  不去重
 查询语句3


 1.查询列数必须是一致的，并且顺序最好一致
 2.默认会去重，使用 union all可以防止去重

 */

select *
from employees
where department_id>90
union
select *
from employees
where email like '%a%';
