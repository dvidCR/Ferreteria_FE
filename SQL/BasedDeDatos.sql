#drop database FerreteriaFE;
create database FerreteriaFE;

use FerreteriaFE;

create table tiendas(
    id int auto_increment,
    direccion varchar(255),
    provincia varchar(50),
    primary key(id)
);

create table RRHH(
    id int auto_increment,
    nombre varchar(70),
    apellidos varchar(150),
    DNI char(9)unique,
    turno varchar(30),
    puesto varchar(60),
    fk_id_tienda int,
    nomina float,
    primary key (id),
    foreign key(fk_id_tienda)references tiendas(id)on update cascade on delete cascade
);

create table proveedores(
    id int auto_increment,
    NIF char(9)unique,
    nombre varchar(50),
    direccion varchar(255),
    telefono varchar(15),
    email varchar(150),
    primary key(id)
);

create table productos(
    id int auto_increment,
    nombre varchar(50),
    stock int,
    fk_id_proveedor int,
    precio float,
    primary key(id)
);

create table clientes(
    id int auto_increment,
    nombre varchar(70),
    apellidos varchar(150),
    telefono varchar(15)unique,
    direccion varchar(255),
    codigo_postal char(5),
    primary key(id)
);

create table ventas(
    id int auto_increment,
    fk_id_cliente int,
    fk_id_producto int,
    fk_id_RRHH int,
    cantidad int,
    ganancias float,
    primary key(id),
    foreign key(fk_id_cliente)references clientes(id)on update cascade on delete no action,
    foreign key(fk_id_producto)references productos(id)on update cascade on delete no action,
    foreign key(fk_id_RRHH)references RRHH(id)on update cascade on delete no action
);

create table mejorVendedor(
    id int,#se colocan manualmente al mejor vendedor
    fk_id_RRHH int,
    fk_id_venta int,
    primary key(id),
    foreign key(fk_id_RRHH)references RRHH(id)on update cascade on delete no action,
    foreign key (fk_id_venta)references ventas(id)on update cascade on delete no action
);
