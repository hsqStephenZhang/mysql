use girls;

show tables ;


/*
 分类：
    内连接
      等值连接
      非等值连接
      自连接
    外连接
      左外连接
      右外连接
      全外连接
    交叉连接
 */

#----------------------------------------
# 内连接


#1. 等值连接
#  关键就是找到对应的关系,最后的结果为交集部分
#  n个表连接，至少需要n-1个等值条件
#  最好为表起别名

# 笛卡尔积
select name,boyName
from beauty,boys;

# 增加连接条件，根据这个条件来筛选
select count(name),boyName
from beauty,boys
where boyfriend_id=boys.id
group by boyName;


use myemployees;

select last_name,department_name
from employees,departments
where employees.department_id=departments.department_id;

# 查询城市名中，第二个字符为o的部门名和城市名
select department_name,city
from departments d,locations l
where d.location_id = l.location_id
and city like '_o%';   # 添加条件

select count(*),city
from departments as d ,locations as  l
where d.location_id=l.location_id
group by city;

select job_title,count(*) as c
from employees e,jobs j
where e.job_id=j.job_id
group by job_title
order by c desc ;

select last_name,department_name,city
from employees e,departments d,locations l
where e.department_id=d.department_id
and d.location_id=l.location_id;

# 非等值连接,只是查询的条件稍微变了一下，本质还是一样的

select salary,grade_level
from employees as e,job_grades as j
where salary>j.lowest_sal and salary<j.highest_sal
order by grade_level desc ;

# 自连接，


select e1.employee_id,e1.last_name,e2.employee_id,e2.last_name
from employees as e1,employees as e2
where e1.manager_id=e2.employee_id;
