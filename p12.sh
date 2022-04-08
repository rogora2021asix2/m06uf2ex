clear
##
if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 3 
fi

if [[ ! -d /mnt/cpseg ]]
then
	echo -n "El directori no existeix. Ho vols crear (s/n)?: "
	read opc
	if [[ $opc != "s" ]] && [[ $opc != "S" ]]
	then
		echo "No s'ha creat el directori."
		exit 1
	else
		mkdir /mnt/cpseg
		echo "S'ha creat el subdirectori demanat i a continuació es crearan les còpies de seguretat"
	fi
fi

cp /etc/hosts $nom_backup 
cp /etc/crontab $nom_backup2
gzip $nom backup.$(date +"%Y%m%d%H%M")

echo "S'ha copiat correctament"


exit 0
