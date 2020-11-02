use db;

show tables ;

/*
 标识列只能有一个，并且只能是int类型

 */

create table identityTest(
    id int auto_increment primary key,
    name varchar(20),
    password varchar(30)
);

insert into identityTest(name,password) values('stephen','123');
insert into identityTest(name,password) values('YSY','456');

select *
from identityTest;

create table identityTest2(
    id int,
    name varchar(20),
    password varchar(30)
);

alter table identityTest2 modify column id int primary key auto_increment;

insert into identityTest2
set name='stephen';
insert into identityTest2
set name='ysy';

select *
from identityTest2
;