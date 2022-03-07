drop schema if exists raw cascade;
create schema raw;
drop table if exists raw.estaciones;
create table raw.estaciones(
    id_estacion numeric(6,0) not null unique, 
    nombre varchar(100), 
    latitud numeric(4,2), 
    longitud numeric(4,2), 
);
drop table if exists raw.precios;
create table raw.precios(
    estacion_servicio numeric(6,0) not null unique, 
    regular numeric(4,2), 
    premium numeric(4,2), 
    diesel numeric(4,2), 
);

