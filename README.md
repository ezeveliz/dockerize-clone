# Dockerize

Ambiente de desarrollo basado en Docker para [Arbil](https://arbil.com.ar/)

### Prerequisitos

* Preferentemente el OS Host debe ser un derivado de Debian(por las instrucciones del script).
* Instalar: [docker](https://docs.docker.com/engine/install/ubuntu/) siguiendo los pasos de postInstall para poder ejecutar sin necesitar elevar los privilegios, [docker-compose](https://docs.docker.com/compose/install/), certutil(sudo apt install libnss3-tools)
* Instalar: [gh](https://github.com/cli/cli/blob/trunk/docs/install_linux.md) para autenticarse con las credenciales de github de manera segura.
* Ejecutar ```gh auth login``` para autenticarse, elegir las siguientes opciones a medida que se piden: Github.com, HTTPS, Y, Login with a web browser

### Instrucciones
* Editar el archivo [hosts](https://linuxize.com/post/how-to-edit-your-hosts-file/) agregando el dominio ```backend.demo.test``` al final de la línea de localhost(127.0.0.1)
* Para iniciar, clonar este repo, ingresar al directorio y ejecutar: ``` ./demo install-script ```, al ejecutarlo se imprimen un par de instrucciones extra.
* Cerrar TODAS las terminales abiertas, volverlas a abrir y continuar con el paso siguiente.
* Luego de realizar lo solicitado por el paso anterior ejecutar: ``` demo init ```
  (si no se hizo ya), este paso inicial puede demorar varios minutos, ya que debe inicializar el repositorio de desarrollo, bajar y compilar todas las imágenes del sistema y generar e instalar los certificados SSL. En el medio se le pedirá su contraseña de superusuario. Al finalizar le indicará la URL de acceso. 

  Si al ejecutar este paso surge un error como el siguiente:
  ```
  Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock
  ```
  reiniciar la PC y volver a ejecutar el mismo comando.
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