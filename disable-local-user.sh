#! /bin/bash
# Root only.
if [[ ${UID} -ne 0 ]]
then
	echo "Debes ser root para ejecutar este script."
	exit 1
else
	# User assignació.
	USER="${2}"
	#chage -E0 $USER

#if [[ $1 != -d ]] || [[ $1 != -r ]] || [[ $1 != -a ]]
#then
#echo "Debe introducir un parametro correcto.
#		Usage: Disable_user.sh [-d,-r,-a].
#		-d -> Borrar usuario.
#		-r -> Borrar usuario y home.
#		-a -> Comprimir archivos."	   
#fi
	case $1 in		

		-d)
			#Esborra user.
			userdel ${USER}
		
			#Usuari esborrat o no.
			if [[ "${?}" -ne 0 ]]
			then
				echo "El usuario '${USER}' no ha sido borrado."
				exit 1
			
			else
				echo "El usuario '${USER}' ha sido borrado."
			fi
			;;
		-r)
			#Esborra el home.
			#getent passwd "${USER}" | cut -d: -f6 > directorio.txt
			userdel -r ${USER}
			;;

		-a)
			#Compressió user.
			tar -cvf $USER.tar  /home/$USER
			;;
	esac
fi

