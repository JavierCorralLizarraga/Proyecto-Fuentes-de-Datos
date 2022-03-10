#!/bin/bash

# 2. Con  sed  cambiar a minúsculas el contenido del atributo  name  (sin crear otro archivo)
sed -i 's/[A-Z]/\L&/g' estaciones.csv

# 3. Con  sed  elimina los acentos del contenido del atributo  name  (sin crear otro archivo)
sed -i 'y/ÁÉÍÓÚáéíóú/AEIOUaeiou/' estaciones.csv

# 4. Con  sed  elimina signos de puntuación del atributo  name  (sin crear otro archivo)
#SinP=$(grep -oP '(?<=,").*(?=",)' estaciones.csv | sed -e 's/,//g' -e 's/;//g' -e 's/\.//g' -e 's/://g' -e 's/-//g')
#linesSinP=$(echo "$SinP" | wc -l)
#for ((i = 1 ; i <= "$linesSinP"  ; i++))
#do
#    LineSP=$(echo "$SinP" | sed -n "$i"'p')
#    sed '1d' estaciones.csv | sed -i "$i"'s/,["].*["],/,"'"$LineSP"'",/'
#done
# se intento pero tuvo bugs, mejor se resolvio esta normalizacion en la etapa de creacion del archivo

# 5. Con  AWK  averigua ¿De cuántas estaciones diferentes tienes geolocalización?

geo=$(sed '1d' estaciones.csv | 
    awk -F, '
    {
        if($3 != "" && $4 != ""){
            n++
        }
    }END{
        print n
    }')

echo "estaciones diferentes:" $geo

