use myemployees;

show tables ;


/*

 顺序
 分支
 循环
 */


# if语句
select if (1,'true','false') ;


# case语句 (使用在begin/end中)
drop procedure if exists caseTest;
create procedure caseTest()
begin
    declare res int default 0;
    select avg(salary) into res from employees;
    select res;
    case res
    when 0<res<5000 then select 'low';
    when 5000<=res<10000 then select 'medium';
    else select 'high';
    end case ;
end;

call caseTest();


drop function if exists scoreTest;
create function scoreTest(score int)returns char(1)
begin
    if score>90 then return 'a';
    elseif score>80 then return 'b';
    elseif score>70 then return 'c';
    else return 'd';
    end if;
end;

select scoreTest(69);


drop procedure if exists hello;
create procedure hello(in score int)
begin
    if score>90 then select 'a';
    elseif score>80 then select 'b';
    elseif score>70 then select 'c';
    else select 'd';
    end if;
end;

call hello(79);


#  循环

/*

 // 先判断后执行
 while 循环条件 do
    循环体
 end while


  // 模拟简单的死循环
 标签:loop
    循环体
 end loop 标签

 // 先执行后判断
 标签: repeat
    循环体
 until 结束循环的条件




 */

drop procedure if exists loopTest;
create procedure loopTest(in showCount int)
begin
    declare i int default 0;
    declare res int default 0;
    while i<showCount do
        if i%2=0 then
            set res=res+i*2;
        else
            set res=res;
        end if;
        set i=i+1;
    end while;
    select res;
end;

call loopTest(10);

