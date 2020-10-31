use myemployees;

show tables ;

select salary,concat(first_name,' ',last_name) as name
from employees order by salary;


select hiredate,concat(first_name,' ',last_name) as name
from employees where department_id<90 order by hiredate desc ;

select concat(first_name,' ',last_name) as name,salary*12*(1+ifnull(commission_pct,0)) as money
from employees order by money desc ;

# order by可以支持多个字段
# 先按照姓名长度排序，然后按照姓名的首字母排序
select concat(first_name,' ',last_name) as name
from employees order by length(name) desc,name;