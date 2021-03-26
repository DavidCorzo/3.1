drop table operacion;
drop table prestamo_detalle;
drop table cuenta_detalle;
drop table cdp_detalle;
drop table prestamo;
drop table cdp;
drop table cuenta_de_ahorro;
drop table cliente;
drop table cooperativa;

create table cooperativa (
    id_cooperativa integer primary key,
    total_prestamos FLOAT,
    total_cdp FLOAT
);

create table cliente (
    id_cliente integer,
    id_cooperativa integer,
    
    -- simple attributes.
    first_name varchar2(15),
    last_name varchar2(15),
    cui varchar2(13), -- CUI del dpi
    user_name varchar2(30), -- combinacin de first y last name y el numero de cui
    email varchar2(40),
    nationality varchar2(25),
    prestamos integer, -- cantidad de prestamos que ha hecho.
    
    -- primary and foreign key declarations.
    primary key(id_cliente),
    foreign key(id_cooperativa) references cooperativa(id_cooperativa),
);

create table cuenta_de_ahorro (
    id_cuenta integer,
    id_cliente integer,
    
    -- simple attributes.
    saldo_promedio decimal(10,2),
    depositos decimal(10,2),
    retiros decimal(10,2),
    
    primary key(id_cuenta),
    foreign key(id_cliente) references cliente(id_cliente)
);

create table cdp ( -- certificado de deposito
    id_cdp integer,
    id_cliente integer,
    
    -- simple attributes.
    interes integer,
    monto float,
    plazo_en_meses integer,
    
    primary key(id_cdp),
    foreign key(id_cliente) references cliente(id_cliente)
);

create table prestamo (
    -- este es un weak entity. Solo existe si existe clientes
    id_prestamo integer,
    id_cliente integer,
    
    -- simple attributes.
    monto_prestado float,
    plazo_en_meses int,
    
    -- primary and foreign keys.
    primary key(id_prestamo),
    foreign key(id_cliente) references cliente(id_cliente)
);

create table cdp_detalle (
    id_cdp_detalle integer,
    id_cdp integer,
    
    -- simple attributes.
    
    -- primary and foreign keys.
    primary key(id_cdp_detalle),
    foreign key(id_cdp) references cdp(id_cdp)
);

create table cuenta_detalle (
    id_cuenta_detalle integer,
    id_cuenta integer,
    
    -- simple attributes.
    
    -- primary and foreign keys.
    primary key(id_cuenta_detalle),
    foreign key(id_cuenta ) references cuenta_de_ahorro(id_cuenta)
);

create table prestamo_detalle (
    id_prestamo_detalle integer,
    id_prestamo integer,
    
    -- simple attributes.
    
    -- primary and foreign keys.
    primary key(id_prestamo_detalle),
    foreign key(id_prestamo) references prestamo(id_prestamo)
);

-- create table operacion (
--     id_operacion integer,
--     id_cdp_detalle integer,
--     id_cuenta_detalle integer,
--     id_prestamo_detalle integer,
    
--     -- simple attributes.
--     -- transaction_date DATE,
    
--     -- primary and foreign key.
--     primary key(id_operacion),
--     foreign key(id_cdp_detalle) references cdp_detalle(id_cdp_detalle),
--     foreign key(id_cuenta_detalle) references cuenta_detalle(id_cuenta_detalle),
--     foreign key(id_prestamo_detalle) references prestamo_detalle(id_prestamo_detalle)
-- );

insert into cooperativa values(001, 5, 10);

insert into cliente values(101, 001, 'Scott'       , 'Jackson'   , '0000000000001',	'ScottJackson'	  , 'ScottJackson@email.com'    , 'Guatemala'  , 0);
insert into cliente values(102, 001, 'Nelson'      , 'Morgan'    , '0000000000002',	'NelsonMorgan'	  , 'NelsonMorgan@email.com'    , 'Guatemala'  , 0);
insert into cliente values(103, 001, 'Lewis'       , 'Allen'     , '0000000000003',	'LewisAllen'	  , 'LewisAllen@email.com'      , 'Guatemala'  , 0);
insert into cliente values(104, 001, 'James'       , 'Walker'    , '0000000000004',	'JamesWalker'	  , 'JamesWalker@email.com'	    , 'Guatemala'  , 0);
insert into cliente values(105, 001, 'Jenkins'     , 'Hall'      , '0000000000005',	'JenkinsHall'	  , 'JenkinsHall@email.com'     , 'US'         , 0);
insert into cliente values(106, 001, 'Baker'       , 'Thompson'  , '0000000000006',	'BakerThompson'	  , 'BakerThompson@email.com'	, 'US'	       , 1);
insert into cliente values(107, 001, 'Robinson'    , 'Miller'    , '0000000000007',	'RobinsonMiller'  , 'RobinsonMiller@email.com'	, 'US'	       , 1);
insert into cliente values(108, 001, 'Thomas'      , 'Patterson' , '0000000000008',	'ThomasPatterson' , 'ThomasPatterson@email.com'	, 'Mexico'	   , 1);
insert into cliente values(109, 001, 'Joseph'      , 'Collins'   , '0000000000009',	'JosephCollins'	  , 'JosephCollins@email.com'	, 'Mexico'	   , 1);


insert into cuenta_de_ahorro values(201, 101, 713.27, 147.63, 25.96 );
insert into cuenta_de_ahorro values(202, 102, 512.19, 760.24, 26.15 );
insert into cuenta_de_ahorro values(203, 103, 596.29, 254.97, 1.451 );
insert into cuenta_de_ahorro values(204, 104, 269.52, 719.78, 24.84 );
insert into cuenta_de_ahorro values(205, 105, 504.09, 273.81, 16.80 );
insert into cuenta_de_ahorro values(206, 106, 869.91, 557.78, 21.50 );
insert into cuenta_de_ahorro values(207, 107, 148.89, 849.68, 8.412 );
insert into cuenta_de_ahorro values(208, 108, 735.84, 733.50, 23.21 );
insert into cuenta_de_ahorro values(209, 109, 454.43, 689.01, 10.36 );
-- insert into cuenta_de_ahorro values(210, 110, 650.36, 416.82, 11.52 );

insert into cdp values(301, 101, 5, 944.20, 3);
insert into cdp values(302, 102, 5, 231.50, 4);
insert into cdp values(303, 103, 5, 274.40, 3);
insert into cdp values(304, 104, 5, 138.80, 4);
insert into cdp values(305, 105, 5, 417.00, 5);
insert into cdp values(306, 106, 5, 259.42, 2);
insert into cdp values(307, 107, 5, 210.59, 4);
insert into cdp values(308, 108, 5, 411.98, 5);
insert into cdp values(309, 109, 5, 352.36, 4);
-- insert into cdp values(310, 110, 5, 293.65, 3);


insert into prestamo values(401, 106, 795.28, 3);
insert into prestamo values(402, 107, 822.55, 3);
insert into prestamo values(403, 108, 360.95, 3);
insert into prestamo values(404, 109, 558.05, 3);
-- insert into prestamo values(405, 110, 916.00, 5);

-- insert into cdp_detalle values(501, 301);
-- insert into cdp_detalle values(502, 302);
-- insert into cdp_detalle values(503, 303);
-- insert into cdp_detalle values(504, 304);
-- insert into cdp_detalle values(505, 305);
-- insert into cdp_detalle values(506, 306);
-- insert into cdp_detalle values(507, 307);
-- insert into cdp_detalle values(508, 308);
-- insert into cdp_detalle values(509, 309);
-- insert into cdp_detalle values(510, 310);

-- insert into cuenta_detalle values(601, 201);
-- insert into cuenta_detalle values(602, 202);
-- insert into cuenta_detalle values(603, 203);
-- insert into cuenta_detalle values(604, 204);
-- insert into cuenta_detalle values(605, 205);
-- insert into cuenta_detalle values(606, 206);
-- insert into cuenta_detalle values(607, 207);
-- insert into cuenta_detalle values(608, 208);
-- insert into cuenta_detalle values(609, 209);
-- insert into cuenta_detalle values(610, 210);

-- insert into prestamo_detalle values(701, 401);
-- insert into prestamo_detalle values(702, 402);
-- insert into prestamo_detalle values(703, 403);
-- insert into prestamo_detalle values(704, 404);
-- insert into prestamo_detalle values(705, 405);


-- drop procedure mostrar_cliente;

-- mostrar_cliente()
-- create or replace procedure mostrar_cliente( id_cliente_p in integer ) 
--     is 
--         cliente_seleccionado CLIENTE%ROWTYPE;
--     begin 
--         select * into cliente_seleccionado
--         from cliente 
--         where id_cliente = id_cliente_p;
        
--         DBMS_OUTPUT.put_line('first_name: ' || cliente_seleccionado.first_name);
--         DBMS_OUTPUT.put_line('id_cliente: ' || cliente_seleccionado.id_cliente);
--         DBMS_OUTPUT.put_line('id_cooperativa: ' || cliente_seleccionado.id_cooperativa);
--         DBMS_OUTPUT.put_line('first_name: ' || cliente_seleccionado.first_name);
--         DBMS_OUTPUT.put_line('last_name: ' || cliente_seleccionado.last_name);
--         DBMS_OUTPUT.put_line('cui: ' || cliente_seleccionado.cui);
--         DBMS_OUTPUT.put_line('user_name: ' || cliente_seleccionado.user_name);
--         DBMS_OUTPUT.put_line('email: ' || cliente_seleccionado.email);
--         DBMS_OUTPUT.put_line('nationality: ' || cliente_seleccionado.nationality);
--         DBMS_OUTPUT.put_line('prestamos: ' || cliente_seleccionado.prestamos);
--     end mostrar_cliente;



-- SET SERVEROUTPUT ON;
-- begin 
--     mostrar_cliente(103);
-- end;
-- create or replace procedure crear_cliente(id_cliente_p integer, id_cooperativa_p integer, first_name_p varchar2, last_name_p varchar2, cui_p varchar2, user_name_p varchar2, email_p varchar2, nationality_p varchar2, prestamos_p integer) 
--     is 
--     begin 
--         insert into cliente values(id_cliente_p, id_cooperativa_p, first_name_p, last_name_p, cui_p, user_name_p, email_p, nationality_p, prestamos_p); 
--         DBMS_OUTPUT.put_line('Added succesfully :) ' || id_cliente_p);
--     end crear_cliente;


-- begin 
--     crear_cliente(110, 001, 'Nathaniel'   , 'Foster'    , '0000000000010',	'NathanielFoster' , 'NathanielFoster@email.com'	, 'Italy'	   , 1);
--     end;
-- select * from cliente;


-- create or replace procedure crear_cdp(id_cuenta_p integer, id_cliente_p integer, saldo_promedio_p decimal, depositos_p decimal, retiros_p decimal) 
--     is 
--     begin 
--         insert into cdp values(id_cuenta_p, id_cliente_p, saldo_promedio_p, depositos_p, retiros_p); 
--         DBMS_OUTPUT.put_line('Added succesfully :) ' || id_cuenta_p);
--     end crear_cdp;

-- begin 
--     crear_cdp(310, 110, 5, 293.65, 3);
--     end;



-- create or replace procedure mostrar_cdp( id_cdp_p in integer ) 
--     is 
--         cdp_seleccionado CDP%ROWTYPE;
--     begin 
--         select * into cdp_seleccionado
--         from cdp 
--         where id_cdp = id_cdp_p;
--         DBMS_OUTPUT.put_line('id_cdp: ' || cdp_seleccionado.id_cdp);
--         DBMS_OUTPUT.put_line('id_cliente: ' || cdp_seleccionado.id_cliente);
--         DBMS_OUTPUT.put_line('interes: ' || cdp_seleccionado.interes);
--         DBMS_OUTPUT.put_line('monto: ' || cdp_seleccionado.monto);
--         DBMS_OUTPUT.put_line('plazo_en_meses: ' || cdp_seleccionado.plazo_en_meses);
--     end mostrar_cdp;


-- SET SERVEROUTPUT ON;
-- begin 
--     mostrar_cdp(304);
--     end;
-- select * from cdp;

