#!/bin/bash

# precios=$1 
precios=precios.xml # for practicity hard coded in the meanwhile
columnas="estacion_servicio, regular, premium, diesel" 

touch precios.csv
echo $columnas > precios.csv



