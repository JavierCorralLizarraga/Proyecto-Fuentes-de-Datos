#!/bin/bash

# precios=$1 
precios=precios.xml # for practicity hard coded in the meanwhile
columnas="estacion_servicio, regular, premium, diesel" 

touch precios.csv
echo $columnas > precios.csv
touch aux
touch BloqueEstacion
grep -nP '(?<=place_id=")\d{5}(?=">)' $precios | cut  -d : -f 1 > aux
cat aux | while read line 
do  
    line1="$(awk 'NR==1' aux)" 
    line2="$(awk 'NR==2' aux)"  
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
    awk -v pre=$pre -v post=$post 'NR>=pre && NR<=post' $precios  > BloqueEstacion
    sed -i '$ d' BloqueEstacion
    id="$(grep -oP '(?<=place_id=")\d{5}(?=">)' BloqueEstacion)"
    regular="$(grep -oP '(?<=regular">)\d+\.{0,1}\d*(?=<\/gas_price>)' BloqueEstacion)"
    premium="$(grep -oP '(?<=premium">)\d+\.{0,1}\d*(?=<\/gas_price>)' BloqueEstacion)"
    diesel="$(grep -oP '(?<=diesel">)\d+\.{0,1}\d*(?=<\/gas_price>)' BloqueEstacion)"
    echo $id','$regular','$premium','$diesel >> precios.csv     
done
rm aux
rm BloqueEstacion
