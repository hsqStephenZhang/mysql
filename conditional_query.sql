use myemployees;

# 条件表达式 > | < | <> | >= | <= | ~=
# && | || | !
# like | between and | in | is null

#  普通的算数比较
select *
from employees where salary>10000 order by salary desc ;

# between and 表达式,闭区间
select salary from employees where salary between 9000 and 15000 order by salary desc ;

# 逻辑表达式
select salary from employees where salary<10000 || salary>15000 order by salary;

# in 同时匹配多个项，这里的括号中的内容必须是精确匹配的
select job_id from employees where job_id in ('ac_mgr','ad_vp','fi_account');

select employee_id from employees where salary>15000 or department_id<90;

# like 模糊查询
select first_name
from employees where first_name like '%a%';  # % 通配符，代表0到任意多个字符

select first_name
from employees where first_name like '__e_a%';

select last_name
from employees where last_name like '_\_%';

# 手动指定转义字符
select first_name,last_name
from employees where last_name like '_$_%' escape '$';



select commission_pct
from employees where commission_pct is not null order by commission_pct ;


# 安全等于,既可以判断null，也可以判断普通的数值
select commission_pct
from employees where not commission_pct <=>null order by commission_pct ;

select salary
from employees where salary <=> 12000;



# 经典面试题

## 可能为null
select commission_pct
from employees;

## 如果commission_pct有null值，会过滤掉
select commission_pct
from employees where commission_pct like '%%';
