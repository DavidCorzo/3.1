drop table cliente;
-- Client.
create table cliente (
    client_id integer primary key ,
    fist_name varchar2(15),
    last_name varchar2(15),
    username varchar2(25),
    email varchar2(45),
    nationality varchar2(25),
    age integer,
    num_de_prestamos integer,
    address varchar(300),
    corp_account_id integer unique
);

insert into cliente values( 
    0, 'David', 'Corzo', 'davidcorzo', 'davcor@algo.com', 'guatemala', 21, 1, 'guate', 0); 
insert into cliente values( 
    1, 'Name1', 'Lname1', 'name1lname1', 'name1lname1@algo.com', 'guatemala', 22, 1, 'guate', 1); 
insert into cliente values( 
    2, 'Name2', 'Lname2', 'name2lname2', 'name2lname2@algo.com', 'guatemala', 23, 1, 'guate', 2); 
insert into cliente values( 
    3, 'Name3', 'Lname3', 'name3lname3', 'name3lname3@algo.com', 'guatemala', 24, 1, 'guate', 3); 
insert into cliente values( 
    4, 'Name4', 'Lname4', 'name4lname4', 'name4lname4@algo.com', 'guatemala', 25, 1, 'guate', 4); 
insert into cliente values( 
    5, 'Name5', 'Lname5', 'name5lname5', 'name5lname5@algo.com', 'guatemala', 26, 1, 'guate', 5); 
commit;

select * from cliente;