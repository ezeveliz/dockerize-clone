## Comandos: 

* docker ps
  * Lista de contenedores corriendo

* docker image ls
  * Lista de imagenes instaladas
* docker image rm image:tag
  * Elimina la imagen image:tag

* docker stop <container-id-here>
  * detiene el contenedor asociado a la ID dada
* docker rm <container-id-here>
  * elimina el contenedor asociado a la ID dada, siempre y cuando no esté corriendo, para detenerlo usar el comando de arriba

* docker run --rm -it -p 8080:80 ubuntu:20.04 bash
  * docker run: instancia y ejecuta una imagen, la descarga si no estaba presente
  * --rm: cuando se termina el proceso a ejecutar elimina el contenedor
  * -it(o -i -t): hace que la ejecución sea interactiva, se pueden meter comandos desde la consola, para que la ejecucion pase al fondo(background), usar -d
  * -p 8080:80: expone el puerto 8080 en el localhost(puedo acceder al contenedor desde localhost:8080), lo que se haga en este se va a enviar al puerto interno 80 del contenedor
  * ubuntu:20.04: imagen a usar y su tag correspondiente
  * bash: proceso a correr en el contenedor

* docker commit -a "Eze Veliz" -m "Nginx installed" <container-id-here> mynginx:latest
  * Luego de hacerle cambios a un contenedor lo puedo commitear a mi instancia de docker, transformandolo en una nueva imagen que luego puedo utilizar

* docker build -t dockerize/app:latest -f docker/app/dockerfile docker/app
  * Buildeo un dockerfile, en este caso el ubicado en docker/app
  * -t dockerize/app:latest: cuando termina el buildeo(si y solo si termina sin errores) crea un nuevo tag y lo agrega a la lista de imagenes disponibles del sistema
  * -f docker/app/dockerfile: ubicacion del dockerfile
  * docker/app: contexto donde se va a encontrar lo que va a correr en el contenedor


## Extra

* images -> clase Image
* container -> instancia de clase Image