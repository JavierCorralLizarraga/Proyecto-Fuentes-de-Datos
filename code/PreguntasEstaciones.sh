#!/bin/bash

# recuerda el -i (inplace) en todas

# 2. Con  sed  cambiar a minúsculas el contenido del atributo  name  (sin crear otro archivo)
#sed 's/[A-Z]/\L&/g' estaciones.csv

# 3. Con  sed  elimina los acentos del contenido del atributo  name  (sin crear otro archivo)
sed 'y/ÁÉÍÓÚáéíóú/AEIOUaeiou/' estaciones.csv

# 4. Con  sed  elimina signos de puntuación del atributo  name  (sin crear otro archivo)


# 5. Con  AWK  averigua ¿De cuántas estaciones diferentes tienes geolocalización?

