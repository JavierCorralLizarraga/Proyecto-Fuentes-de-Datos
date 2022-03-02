#!/bin/bash

precios=$1 
columnas="estacion_servicio, regular, premium, diesel" 

touch precios.csv
echo $columnas > precios.csv
touch aux
touch BloqueEstacion
grep -nP '(?<=place_id=")\d{4,5}(?=">)' $precios | awk -F ":" '!_[$2]++' | cut  -d : -f 1  > aux # return archivo con numeros de linea del archivo precios en la posicion del id y lidiamos con ids repetidos
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
    awk -v pre=$pre -v post=$post 'NR>=pre && NR<=post' $precios  > BloqueEstacion # tomamos el bloque del archivo desde un id hasta el otro 
    sed -i '$ d' BloqueEstacion # borramos el 2do id matcheado para que no haya confusiones
    id="$(grep -oP '(?<=place_id=")\d{4,5}(?=">)' BloqueEstacion | uniq)" # matcheamos el id del bloque
    regular="$(grep -oP '(?<=regular">)\d+\.{0,1}\d*(?=<\/gas_price>)' BloqueEstacion)" # matcheamos el precio regular del bloque
    premium="$(grep -oP '(?<=premium">)\d+\.{0,1}\d*(?=<\/gas_price>)' BloqueEstacion)" # matcheamos el precio premium del bloque
    diesel="$(grep -oP '(?<=diesel">)\d+\.{0,1}\d*(?=<\/gas_price>)' BloqueEstacion)" # matcheamos el precio diesel del bloque
    echo $id','$regular','$premium','$diesel >> precios.csv # agregamos los datos como una nueva linea a precios.csv
done
rm aux 
rm BloqueEstacion
