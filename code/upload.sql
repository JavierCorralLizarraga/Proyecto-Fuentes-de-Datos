drop schema if exists raw cascade;
create schema raw;
drop table if exists raw.estaciones;
create table raw.estaciones(
    id_estacion numeric(7,0) not null unique, 
    nombre varchar(250), 
    latitud numeric(5,2), 
    longitud numeric(5,2), 
);
drop table if exists raw.precios;
create table raw.precios(
    estacion_servicio numeric(7,0) not null unique, 
    regular numeric(5,2), 
    premium numeric(5,2), 
    diesel numeric(5,2), 
);

