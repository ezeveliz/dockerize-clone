## Comandos: 

* docker ps
  * Lista de contenedores corriendo

* docker image ls
  * Lista de imagenes instaladas
* docker image rm image:tag
  * Elimina la imagen image:tag

* docker run --rm -it ubuntu:20.04 bash
  * docker run: instancia y ejecuta una imagen, la descarga si no estaba presente
  * --rm: cuando se termina el proceso a ejecutar elimina el contenedor
  * -it: hace que la ejecución sea interactiva, se pueden meter comandos desde la consola, para que la ejecucion pase al fondo(background), usar -d
  * ubuntu:20.04: imagen a usar y su tag correspondiente
  * bash: proceso a correr en el contenedor

* docker commit -a "Eze Veliz" -m "Nginx installed" <container-id-here> mynginx:latest
  * Luego de hacerle cambios a un contenedor lo puedo commitear a mi instancia de docker, transformandolo en una nueva imagen que luego puedo utilizar


## Extra

* images -> clase Image
* container -> instancia de clase Image