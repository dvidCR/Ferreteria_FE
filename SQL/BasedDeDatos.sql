#drop database FerreteriaFE;
create database FerreteriaFE;

use FerreteriaFE;

create table tiendas(
    id int auto_increment,
    direccion varchar(255) NOT NULL,
    provincia varchar(50),
    primary key(id)
);

create table RRHH(
    id int auto_increment,
    nombre varchar(70) NOT NULL,
    apellidos varchar(150) NOT NULL,
    DNI char(9)unique NOT NULL,
    turno varchar(30) NOT NULL,
    puesto varchar(60) NOT NULL,
    fk_id_tienda int NOT NULL,
    nomina float NOT NULL,
    primary key (id),
    foreign key(fk_id_tienda)references tiendas(id)on update cascade on delete cascade
);

create table proveedores(
    id int auto_increment,
    NIF char(9)unique not null,
    nombre varchar(50) not null,
    direccion varchar(255),
    telefono varchar(15),
    email varchar(150),
    primary key(id)
);

create table productos(
    id int auto_increment,
    nombre varchar(50) not null,
    stock int not null,
    fk_id_proveedor int not null,
    precio float not null,
    primary key(id),
    foreign key(fk_id_proveedor)references proveedores(id)on update cascade on delete cascade
);

create table clientes(
    id int auto_increment,
    nombre varchar(70) not null,
    apellidos varchar(150) not null,
    telefono varchar(15)unique not null,
    direccion varchar(255),
    codigo_postal char(5) not null,
    primary key(id)
);

create table ventas(
    id int auto_increment,
    fk_id_cliente int not null,
    fk_id_producto int not null,
    fk_id_RRHH int not null,
    cantidad int not null,
    ganancias float not null,
    primary key(id),
    foreign key(fk_id_cliente)references clientes(id)on update cascade on delete no action,
    foreign key(fk_id_producto)references productos(id)on update cascade on delete no action,
    foreign key(fk_id_RRHH)references RRHH(id)on update cascade on delete no action
);

create table mejorVendedor(
    id int,#se colocan manualmente al mejor vendedor
    fk_id_RRHH int not null,
    fk_id_venta int not null,
    primary key(id),
    foreign key(fk_id_RRHH)references RRHH(id)on update cascade on delete no action,
    foreign key (fk_id_venta)references ventas(id)on update cascade on delete no action
);
