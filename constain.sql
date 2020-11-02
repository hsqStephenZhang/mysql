use db;

/*

    NOT NULL 非空
    PRIMARY KEY 主键
    UNIQUE 唯一
    CHECK 检查约束,MySQL 不支持,语法不报错但无效果
    FOREIGN KEY 外键.限制两表关系,通常在从表引入外键约束,引入主表中某列的值,保证从表该字段的值必须来源于主表关联列的值
    DEFAULT 默认值/系统设定值
 */

 /*
    表级约束:对多个数据列建立的约束，称为表级约束表级约束只能在列定义后声明
    列级约束:对一个数据列建立的约束，称为列级约束列级约束既可以在列定义时声明，也可以在列定义后声明
  */


create table stuInfo(
    id int primary key,
    name varchar(30) not null ,
    gender char(1) check ( gender in('m','f')), # 没有作用
    seat int unique ,
    age int default 18,
    majorId int references major(id),
);

create table major(
    id int primary key ,
    majorName varchar(20)
);

show tables ;

show index from stuinfo;

drop table if exists stuInfo2;
create table stuInfo2(
    id int ,
    name varchar(20),
    gender char(1),
    age int,
    seat int,
    majoyId int
);

# 修改表的时候添加或者减少约束

alter table stuInfo2 add constraint primary key (id);
alter table stuInfo2 add unique (seat);
alter table stuInfo2 add foreign key (majoyId) references major(id);

alter table stuInfo2 modify column age int not null ;

show index from stuInfo2;



alter table stuInfo2 drop constraint `PRIMARY`;
# alter table stuInfo2 drop index seat;  # 删除之后该语句就会报错
