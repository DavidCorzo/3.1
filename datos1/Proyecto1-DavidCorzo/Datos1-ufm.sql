
create table cooperativa (
    id_cooperativa integer primary key,
    total_prestamos FLOAT,
    total_cdp FLOAT
);
drop table cooperativa;

create table cliente (
    id_cliente integer,
    id_cooperativa integer,
    
    -- simple attributes.
    first_name varchar2(15),
    last_name varchar2(15),
    cui varchar2(13), -- CUI del dpi
    user_name varchar2(30), -- combinación de first y last name y el numero de cui
    email varchar2(40),
    nationality varchar2(25),
    prestamos integer, -- cantidad de prestamos que ha hecho.
    
    -- primary and foreign key declarations.
    primary key(id_cliente),
    foreign key(id_cooperativa) references cooperativa(id_cooperativa)
);
drop table cliente;

create table cuenta_de_ahorro (
    id_cuenta integer,
    
    -- simple attributes.
    saldo_promedio FLOAT,
    depositos FLOAT,
    retiros FLOAT,
    
    primary key(id_cuenta)
);
drop table cuenta_de_ahorro;

create table cdp ( -- certificado de depósito
    id_cdp integer,
    id_cliente integer,
    
    -- simple attributes.
    interes integer,
    monto float,
    plazo_en_meses integer,
    
    primary key(id_cdp),
    foreign key(id_cliente) references cliente(id_cliente)
);
drop table cdp;

create table prestamo (
    -- este es un weak entity. Solo existe si existe clientesñ
    id_prestamo integer,
    id_cliente integer,
    
    -- simple attributes.
    monto_prestado float,
    plazo_en_meses int,
    
    -- primary and foreign keys.
    primary key(id_prestamo),
    foreign key(id_cliente) references cliente(id_cliente)
);
drop table prestamo;

create table cdp_detalle (
    id_cdp_detalle integer,
    id_cdp integer,
    
    -- simple attributes.
    
    -- primary and foreign keys.
    primary key(id_cdp_detalle),
    foreign key(id_cdp) references cdp(id_cdp)
);
drop table cdp_detalle;

create table cuenta_detalle (
    id_cuenta_detalle integer,
    id_cuenta integer,
    
    -- simple attributes.
    
    -- primary and foreign keys.
    primary key(id_cuenta_detalle),
    foreign key(id_cuenta ) references cuenta_de_ahorro(id_cuenta)
);
drop table cuenta_detalle;

create table prestamo_detalle (
    id_prestamo_detalle integer,
    id_prestamo integer,
    
    -- simple attributes.
    
    -- primary and foreign keys.
    primary key(id_prestamo_detalle),
    foreign key(id_prestamo) references prestamo(id_prestamo)
);
drop table prestamo_detalle;

create table operacion (
    id_operacion integer,
    id_cdp_detalle integer,
    id_cuenta_detalle integer,
    id_prestamo_detalle integer,
    
    -- simple attributes.
    transaction_date DATE,
    
    -- primary and foreign key.
    primary key(id_operacion),
    foreign key(id_cdp_detalle) references cdp_detalle(id_cdp_detalle),
    foreign key(id_cuenta_detalle) references cuenta_detalle(id_cuenta_detalle),
    foreign key(id_prestamo_detalle) references prestamo_detalle(id_prestamo_detalle)
);
drop table operacion;