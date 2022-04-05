# Dockerize

Ambiente de desarrollo basado en Docker para [Arbil](https://arbil.com.ar/)

### Prerequisitos

* Preferentemente el OS Host debe ser un derivado de Debian(por las instrucciones del script).
* Instalar: docker, docker-compose, certutil

### Instrucciones
* Editar el archivo [hosts](https://linuxize.com/post/how-to-edit-your-hosts-file/) agregando el dominio demo.backend.test al final de la línea de localhost(127.0.0.1)
* Para iniciar, clonar este repo, ingresar al directorio y ejecutar ./demo install-script desde la consola

### Sistema resultante

![Diagrama de red](./assets/Arbil%20Network%20Diagram.png "Diagrama de red")

Thx to this [tutorial :heart:](https://github.com/osteel/docker-tutorial) 