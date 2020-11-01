use myemployees;

show tables ;

# 标量查询(1行1列的结果可以作为标量使用)
# 子查询优先执行

# 谁的工资比abel高

#1.abel的工资
select salary
from employees
where last_name='abel';

#2.工资比abel高的
select salary
from employees
where salary>(
    select salary
    from employees
    where last_name='abel'
);


# job_id=141并且工资大于job_id=143的员工

select last_name,job_id,salary
from employees
where job_id=(
    select job_id
    from employees
    where employee_id=141
    )
and salary>(
    select salary
    from employees
    where employee_id=143
    );


#  查询工资最少的员工的last_name,salary

select last_name,salary,job_id
from employees
where salary=(
    select min(salary)
    from employees
);

# 查询最低工资大于40号部门的最低工资的部门最低工资和部门id

select min(salary)
from employees
where department_id=40;

select department_id,min(salary) as m
from employees
group by department_id
having m>(
    select min(salary)
    from employees
    where department_id=40
) order by m;




# 列子查询 -------------> 一列多行

/*
 in /not in
 any|some
 all

 in(...)  equals  =any(...)

 */

# 查询location_id为1400或者1700的部门的员工姓名


select last_name
from employees
where department_id in(
    select distinct  d.department_id
    from departments as d
    where location_id in (1400,1700)
);


# 查询其他工种中，比job_id为`it_prog`部门的任意工资都要低的员工
# 使用 any | some 可以用其余的代替(min/max)

select last_name,salary,job_id
from employees
where salary < any (
    select distinct salary
    from employees
    where job_id='it_prog'
) and job_id<>'it_prog';



# 行子查询    -----------> 有局限性
# 将多个条件整合在一起


select *
from employees
where (employee_id,salary)=(
    select min(employee_id),max(salary)
    from employees
);


