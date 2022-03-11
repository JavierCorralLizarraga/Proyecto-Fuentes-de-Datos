#!/bin/bash

estaciones=$1
columnas="id_estacion,nombre,latitud,longitud" 

touch estaciones.csv
echo $columnas > estaciones.csv
touch aux
touch BloqueEstacion
grep -nP '(?<=place_id=")\d{4,5}(?=">)' $estaciones | awk -F ":" '!_[$2]++' | cut  -d : -f 1  > aux # return archivo con numeros de linea del archivo precios en la posicion del id y lidiamos con ids repetidos
line1="$(awk 'NR==1' aux)" 
line2="$(awk 'NR==2' aux)"  
cat aux | while read line # loopeamos linea a linea a traves de aux 
do  
    if [[ "$line1" == "$line" ]] # si es la primera linea
    then 
        pre=$line
        continue
    elif [[ "$line2"  == "$line" ]] # si es la 2da linea
    then 
        post=$line
    else
        pre=$post
        post=$line
    fi
    awk -v pre=$pre -v post=$post 'NR>=pre && NR<=post' $estaciones  > BloqueEstacion # tomamos el bloque del archivo desde un id hasta el otro 
    sed -i '$ d' BloqueEstacion # borramos el 2do id matcheado para que no haya confusiones
    id="$(grep -oP '(?<=place_id=")\d{4,5}(?=">)' BloqueEstacion | uniq)" # matcheamos el id del bloque
    name="$(grep -oP '(?<=<name>).*(?=<\/name>)' BloqueEstacion | sed -e 's/,//g' -e 's/;//g' -e 's/\.//g' -e 's/://g' -e 's/-//g')" # matcheamos el nombre del bloque y quitamos los signos de puntuacion
    latitud="$(grep -oP '(?<=<x>).*(?=<\/x>)' BloqueEstacion)" # matcheamos la latitud del bloque
    longitud="$(grep -oP '(?<=<y>).*(?=<\/y>)' BloqueEstacion)" # matcheamos la longitud del bloque
    echo $id',"'$name'",'$latitud','$longitud >> estaciones.csv # agregamos los datos como una nueva linea a precios.csv
done
rm aux 
rm BloqueEstacion
