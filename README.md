# Proyecto-Fuentes-de-Datos
Proyecto para de examen a suficiencia para la materia de Fuentes de Datos en el ITAM

Progreso:

## Parte 1 - Extract
- [x] estaciones.xml
- [x] precios.xml

## Parte 2 - Transform 1 - precios.xml
- [x] precios.csv
- [x] regular (grep)
- [x] diesel (grep)
- [x] premium (grep)
- [x] precios gasolineras diferentes (awk + sed/grep)
- [x] observaciones de precio

## Parte 3 - Transform 2 - estaciones.xml
- [x] estaciones.csv
- [x] name minuscula (sed, no archivo auxiliar)
- [x] name sin acentos (sed, no archivo auxiliar)
- [x] name sin signos de puntuacion (sed, no archivo auxiliar)
- [x] gasolineras diferentes geolocalizacion (awk)

## Parte 4 - Load
- [x] upload.sql
- [x] borrar raw
- [x] crear raw
- [x] borrar tabla
- [x] crear tabla estaciones
- [x] borrar tabla raw.precios si existe
- [x] tabla precios
- [x] proyecto_1_load.sh
- [x] psql
- [x] poblar tabla raw.precios

## Parte 5 - Wrap it up
- [x] incluir parametro precios.xml
- [x] incluir parametro estaciones.xml
- [x] proyecto_1_load.sh

## Parte 6 - Analisis de datos
- [x] analisis.ipynb

## Parte 7 - Analisis con Pandas
- [ ] conectar a BD
- [ ] query sql
- [x] pandas

## Parte 8 - Visualizacion
- [x] boxplot
- [x] histograma
- [x] mapa registros
- [x] mapa regular
- [x] mapa premium
- [x] mapa diesel
