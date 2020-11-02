show engines;

use db;

show tables ;

create table transaction1(
    id int primary key not null auto_increment,
    name varchar(20)
);

set autocommit=0;

insert into transaction1(name) values ('stephen');
rollback ;

select * from transaction1;