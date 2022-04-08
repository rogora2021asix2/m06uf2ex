#!/bin/bash
clear

if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 1
fi

while [ x$username = "x" ]; do

read -p "Escriu l'usuari que vols eliminar : " username

if id -u $username >/dev/null 2>&1; then

deluser $username

echo "Usuari eliminat"

username=""

fi
done

exit 1
