#!/usr/bin/env bash

# La linea de arriba encuentra y ejecuta bash para despues continuar con lo de abajo

# Me aseguro que el directorio de composer exista y que sea modificable
# -d: indica si existe el archivo y el mismo es un directorio
if [ ! -d /.composer ]; then
    mkdir /.composer
fi

chmod -R ugo+rw /.composer

# $#: numero de parametros ingresados
# -gt: greater than
if [ $# -gt 0 ]; then

  # Si pase algun parametro( y posibles flags al docker run...) lo ejecuto
  exec "$@"
else

  # Si no pase ningun parametro ejecuto supervisord directamente
  /usr/bin/supervisord
fi