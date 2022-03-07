#!/bin/bash

# estaciones.xml existe
if [[ ! -f estaciones.xml ]] # -f exists and is a file  
then
    wget https://bit.ly/2V1Z3sm
    mv 2V1Z3sm estaciones.xml # rename
fi

if [[ ! -f precios.xml ]]
then
    wget https://bit.ly/2JNcTha
    mv 2JNcTha precios.xml
fi

bash proyecto_1_transform_1.sh precios.xml

bash proyecto_1_transform_2.sh estaciones.xml

bash proyecto_1_load.sh




