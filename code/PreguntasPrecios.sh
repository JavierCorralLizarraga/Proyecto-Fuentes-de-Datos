#!/bin/bash

# 1. Con grep averigua ¿Cuántas gasolineras sirven gasolina regular
#    en este conjunto de datos? Imprime en terminal gasolineras que 
#    sirven gasolina regular: <z> . Donde  <z>  corresponde al 
#    número de gasolineras.

GasRegular=$(grep -oP '\d*\.{0,1}\d*\,\d+\.{0,1}\d*,\d*\.{0,1}\d*,\d*\.{0,1}\d*' precios.csv | wc -l)
echo 'gasolineras que sirven gasolina regular:' $GasRegular

# 2. Con grep averigua ¿Cuántas gasolineras sirven gasolina  diesel
#    en este conjunto de datos? Imprime en terminal gasolineras que 
#    sirven gasolina diesel: <y> . Donde  <y>  corresponde al número 
#    de gasolineras.

GasDiesel=$(grep -oP '\d*\.{0,1}\d*\,\d*\.{0,1}\d*,\d*\.{0,1}\d*,\d+\.{0,1}\d*' precios.csv | wc -l)
echo 'gasolineras que sirven gasolina diesel:' $GasDiesel

# 3. Con grep averigua ¿Cuántas gasolineras sirven  premium  en este
#    conjunto de datos? Imprime en terminal  gasolineras que sirven 
#    gasolina premium: <x> 

GasPremium=$(grep -oP '\d*\.{0,1}\d*\,\d*\.{0,1}\d*,\d+\.{0,1}\d*,\d*\.{0,1}\d*' precios.csv | wc -l)
echo 'gasolineras que sirven gasolina premium:' $GasPremium

# 4. Con AWK averigua ¿De cuántas gasolineras diferentes tienes datos 
#    de precios? * Te puedes apoyar de un archivo auxiliar creado 
#    con  grep  o  sed . Imprime en terminal  gasolineras diferentes:
#    <m> . Donde  <m>  corresponde al número de gasolineras.

GasDiferentes=$(sed '1d' precios.csv | 
    awk -F, '
    {
    if($1 != ""){
        n++
    }
    }END{print n}')
echo 'gasolineras diferentes:' $GasDiferentes

# 5. ¿Cuántos renglones de precios de gasolina tienes (una vez que 
#    ya tienes 1 renglón por estación de gasolina)? Imprime en 
#    terminal  observaciones de precios: <n> . Donde  <n>  
#    corresponde al número de gasolineras.

echo 'observaciones de precios:' $RenglonesPrecios
