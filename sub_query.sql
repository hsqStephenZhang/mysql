use myemployees;
show tables ;

# 查询每一个部门的员工个数

select d.department_id,(
    select count(*)
    from employees e
    where e.department_id=d.department_id
) num
from departments d;

#  必须要起别名
select e.*,job_grades.grade_level from(
    select min(salary) as m,department_id
    from employees
    where department_id is not null
    group by department_id
) as e
inner join job_grades
where e.m between job_grades.lowest_sal and job_grades.highest_sal
order by grade_level;

select * from job_grades;





# exists

/*
 exists(完整的查询语句)
 先执行外查询，然后根据exists结果进行过滤
 */

# 选取有员工的部门
select department_name
from departments d
where exists(
    select *
    from employees e
    where e.department_id=d.department_id
);

select department_name
from departments d
where department_id in (
    select employees.department_id
    from employees
    );









#  查询各部门中工资高于本部门的平均工资的员工信息

select res.average,e.salary,e.department_id,e.last_name from(
    select avg(salary) as average,department_id
    from employees
    group by department_id
) as res
inner join  employees e
on e.department_id=res.department_id
where e.salary>res.average;

# 查询管理者为King的员工的姓名和工资

select last_name,salary,manager_id
from employees
where manager_id in(
    select distinct employee_id
    from employees
    where last_name='K_ing'
);


#  查询最高工资的员工的姓名

select concat(first_name,' ',last_name) as name,salary
from employees
where salary=(
    select max(salary)
    from employees
);