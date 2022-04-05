# Dockerize

Ambiente de desarrollo basado en Docker para [Arbil](https://arbil.com.ar/)

### Prerequisitos

* Preferentemente el OS Host debe ser un derivado de Debian(por las instrucciones del script).
* Leer [esto](https://docs.github.com/en/get-started/getting-started-with-git/about-remote-repositories), indica como ingresar y cachear las credenciales para el repo de desarrollo, prestar especial énfasis en la sección sobre HTTPS, ya que es el método utilizado en el script.
* Instalar: docker, docker-compose, certutil

### Instrucciones
* Editar el archivo [hosts](https://linuxize.com/post/how-to-edit-your-hosts-file/) agregando el dominio demo.backend.test al final de la línea de localhost(127.0.0.1)
* Para iniciar, clonar este repo, ingresar al directorio y ejecutar:
 ``` ./demo install-script ```
* Luego de realizar lo solicitado por el paso anterior ejecutar:
  ``` demo init ```
  (si no se hizo ya), este paso inicial puede demorar varios minutos, ya que debe inicializar el repositorio de desarrollo, bajar y compilar todas las imágenes del sistema y generar e instalar los certificados SSL. En el medio se le pedirán las credenciales para acceder al repo de desarrollo y su contraseña de superusuario. Al finalizar le indicará la URL de acceso.
* Finalmente el directorio de desarrollo se encuentra en /src/arbil

### Comandos más importantes
* ```demo init``` Inicializa el sistema, clona el repo de desarrollo y descarga las imágenes de los contenedores
* ```demo stop``` Apaga el sistema 
* ```demo start``` Inicia el sistema
* ```demo npm run production``` Compila los assets de JS y SASS
* ```demo npm run watch``` Compila los assets de JS y SASS a medida que se van modificando
* ```demo``` Lista todos los comandos disponibles en el script

### Sistema resultante

![Diagrama de red](./assets/Arbil%20Network%20Diagram.png "Diagrama de red")

El sistema está compuesto por 4 servicios:
* Un servidor de nginx al cual se puede acceder mediante https://demo.backend.test:443, el puerto 80 está habilitado, pero solo redirige al puerto 443 mediante un código de redirección 301
* Un servidor de PHP-FPM 8.1 el cual es el encargado de procesar los requests recibidos desde nginx a través del puerto 9000
* Un servidor redis, usado como cache y mantenimiento de sesiones de PHP
* Un servidor postgre 12.1, base de datos de la aplicación(la misma se expone al exterior a través del puerto 5433, para poder acceder a la misma desde ciertas aplicaciones)

Thx to this [tutorial :heart:](https://github.com/osteel/docker-tutorial) 