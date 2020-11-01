show variables like '%char%';
use myemployees;

#-----------------------------------------------
# 字符函数

# 1.length用来获取 '字节'长度
select length('hello');
select length('章翀123');

# 2.concat 连接字符串
select concat('a','b','c') as str;

# 3. lower upper转换大小写
select upper('hello') as str;
select lower('HELLO') as str;

select concat(upper(first_name),'--',lower(last_name))
from employees;

# 4.substr

# 从指定索引截取指定长度
select substr('1234567890',1,5) as output;
# 从指定索引到末尾
select substr('1234567890',5) as output;

select concat(upper(substr(first_name,1,1)),substr(first_name,1)) from employees;

# 5.instr 返回子串在str中的第一次出现的索引，如果找不到，返回0
select instr('123456','345') as output;
select instr('123456','123') as output;
select instr('123456','23456') as output;
select instr('123456','00000') as output;

#6. trim

select length(trim('  stephen         ')) as str;

select trim('a' from 'aaaaaaaaaaaaastephenZhangaaaaaaaaaaaaa') as str;


#7. lpad,rpad 左填充和右填充

select lpad('stephen',10,'*') as str;
select rpad('stephen',10,'*') as str;

#8. replace 替换

select replace('123456123456','123','aaa') as str;



#----------------------------------------------------
# 数学函数

#1.取整
select round(1.55);
select round(1.45);
select round(1.5);
select round(-1.6);
#  保留小数点后几位
select round(1.456,1);

#2.向上取整
select ceil(1.4);
select ceil(-1.2);

#3. 向下取整
select floor(-1.2);
select floor(1.2);


#4. 截断

select truncate(1.9999999999999,2) AS res;

# 5.mod 取模

select mod(10,3) as res;


#-----------------------------------------------
# 日期函数

#1. now
select now();

#2. 当前时间，不包含日期
select current_date();

# 当前的具体的年月日

# 必须要输入完整的 ‘年-月-日’ 日期
select year('1999-10-1');
select concat(year(now()),'--',month(now()),'--',day(now())) as res;

select monthname(now());


#3. 日期格式转换

# %y(Y)-%m-%d-%h(H)-%i-%s 年(2位/4位)-月-日-小时(12/24小时)-分钟-秒

# 按照指定的格式解析日期字符串
select str_to_date('9-13-2999','%m-%d-%y') as res;


select last_name,date_format(hiredate,'%m月/%s日 %Y年')
from employees where commission_pct is not null;


#--------------------------------------------------------------
# 其它函数

select version();
select database();
select user();



#-----------------------------------------------
# 流程控制函数

#1.if 语句
select last_name,if(commission_pct is null ,'没有奖金','有奖金') from employees;

#2.case 语句

select last_name,
case
when salary>20000 then 'A'
when salary>15000 then 'B'
when salary>10000 then 'C'
else 'E'
end as  `level`
from employees
order by level asc ;

select * from employees