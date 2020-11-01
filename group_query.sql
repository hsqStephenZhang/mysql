use myemployees;


#  group by 就是一个1对多的关系
/*

select 分组函数,列(要求出现在group by后面)
from 表
[where condition]
group by 分组的列表;
[order by xxx]

 */

/*
 having   给虚拟的表添加筛选
 group by 给真实的表添加筛选
 */


select max(salary),job_id
from employees
group by job_id;

select count(*),location_id
from departments
group by location_id;

#  查询有奖金的领导手下员工的最高工资
select max(salary),round(avg(salary),0),manager_id
from employees
where commission_pct is not null
group by manager_id;


# 查询哪个部门的员工个数大于2

select count(*),department_id
from employees
where department_id is not null
group by department_id  #进行分组
having count(*)>2;  # 添加分组之后的筛选

# 查询每一个工种有奖金的员工的最高工资>12000的工种编号和最高工资

select max(salary) as maxSalary,job_id
from employees
where commission_pct is not null
group by job_id
having maxSalary>12000;


# 下面的语句是不合法的
/*
 select count(*),last_name
from employees
group by length(last_name);

 */

select count(*) as occur,length(last_name) as name
from employees
group by name
having occur>5
order by occur desc;


# 按照多个字段分组

select round(avg(salary),0) average,department_id,job_id
from employees
where department_id is not null
group by department_id, job_id
having average>10000
order by average desc ;
