# tarea5_PSP
Tarea 5 del modulo Programación de Servicios y Procesos.

## Descripción
UT 5 Utilización de técnicas de programación segura

### Práctica a entregar

Crear un script en Bash que permita cifrar un documento utilizando clave simétrica. El comando para
encriptar un fichero para que no pida el password a través del prompt es:

```
echo "cfgs" > gpg_password.txt
cat gpg_password.txt | gpg -c --no-tty --cipher-algo AES256 --passphrase-fd 0 --batch -o greeting.txt.gpg
greeting.txt
rm -f greeting.txt
```

Crear un script en Bash que permita descifrar un documento utilizando la clave simétrica. El comando para
desencriptar un fichero para que no pida el password a través del promp es:
```
formacion@ubuntu:~$ cat gpg_password.txt | gpg --passphrase-fd 0 --decrypt --batch -o greeting.txt
greeting.txt.gpg
```
Para hacer esta tarea hemos optado usar el programa **Git Bash** y **Notepad++** para escribir el script.
El script nos pide si queremos encriptar o desencriptar un archivo. Al principio crea el archivo clave **gpg_pasword.txt**
que usaremos para criptar y desencriptar los archivos. El script ha quedado así:

```
#!/bin/bash
#Creamos un archivo con la clave
echo "cfgs" > gpg_password.txt 
#Menu de opciones
echo "Por favor elige una Opcion: Encriptar[E] o desencriptar [D]?"
read option

if [ $option = "E" ]; then 
echo Introduce archivo a encriptar
read archivo
cat gpg_password.txt | gpg -c --no-tty --cipher-algo AES256 --passphrase-fd 0 --batch -o $archivo.gpg $archivo
rm -f $archivo
echo "Arhivo Encriptado correctamente"
fi
	
if [ $option = "D" ]; then 
echo Introduce archivo a desencriptar
read archivo
 cat gpg_password.txt | gpg --passphrase-fd 0 --decrypt --batch -o archivo_desencriptado.txt $archivo
echo "Arhivo Desencriptado correctamente"
fi
```

Para ver su funcionamiento tenemos que tener un archivo para encriptar. creamos un archivo de texto sencillo, llamado hola.txt:

<img src="http://i64.tinypic.com/6qb02q.jpg" >

Abrimos el programa Git Bash e ejecutamos el script, elegimos que queremos encriptar e introducimos el nombre del archivo:

<img src="http://i68.tinypic.com/rhtmbm.jpg" >

Vemos que se ha creado el archivo encriptado *hola.txt.gpg* y se ha borrado el archivo original *hola.txt*

<img src="http://i64.tinypic.com/bdth5z.jpg" >

Intentamos ver el contenido del archivo encriptado:

<img src="http://i64.tinypic.com/o6n0aq.jpg" >

Ahora queremos desencriptar el archivo, ejecutamos el script de nuevo y elegimos la opcion "D" e
introducimos el nombre del archivo encriptado *hola.txt.gpg*:

<img src="http://i65.tinypic.com/28stu09.jpg" >

Abrimos el archivo nuevo *archivo_desencriptado.txt* y podemos leer su contenido:

<img src="http://i65.tinypic.com/33wbqxt.jpg" >

### Todo funciona correctamente!



