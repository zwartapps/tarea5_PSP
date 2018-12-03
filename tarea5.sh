#!/bin/bash
echo "cfgs" > gpg_password.txt #Creamos un archivo con la clave
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