show tables from myemployees;


use myemployees;

select *
from myemployees.employees;

select *
from myemployees.departments;

select *
from myemployees.locations;

select *
from myemployees.jobs;

select
    employee_id as id,
    first_name as name1,
    last_name as name2,
    email as mail
from myemployees.employees;

