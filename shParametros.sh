#!/bin/bash 
#archivo sh para modificar archivos de texto plano


#dar la bienvenida
echo "Bienvenido que desea hacer?"
echo -e "*crear\n *escribir\n *mover\n *eliminar\n"

#comprobar que se ingreso un parametro
if [ -z "$1" ]; then
	echo "Vuelve a ingresar ./shParametros.sh {parametro}"
	exit

#elif si se ingresa el parametro "crear"
elif [ $1 = "crear" ]; then
	echo "indique donde desea crear el directorio"
	read location
	echo "ingresa un nombre al directorio"
	read directory
	if [ -d "$location" ]; then
		echo "Creando directorio en /$location"
		mkdir ~/$location/$directory
		echo "directorio creado con exicto"
		exit
	else
		echo "El parametro no corresponde a un directorio"
		exit
	fi

#elif si se ingresa el parametro "escribir"
elif [ $1 = "escribir" ]; then
	echo "indique el nombre del archivo a modificar"
	read file
	find . -name $file | while read line; do
		xdg-open $line
	done

#elif si se ingresa el parametro "mover"
elif [ $1 = "mover" ]; then
	echo "indique el nombre del archivo/directorio a mover"
	read name_move
	echo "donde lo desea mover?"
	read directory_move
	if [ -d "$directory_move" ]; then
		find . -name $name_move | while read link; do
			mv $link $directory_move
		done
	fi
	
#elif si se ingresa el parametro "eliminar"
elif [ $1 = "eliminar" ]; then
	echo -e "[==ADVERTENCIA==] tenga cuidado con lo el archivo que coloque\n
tendra que ser especifico en la ubucacion del archivo\n"
	echo "ingrese donde se encuentra el archivo a eliminar"
	read remove
	echo "ingrese el nombre del archivo al eliminar"
	read remove_name
	if [ -d "$remove" ]; then
		cd $remove
		rm $remove_name
	fi
fi

