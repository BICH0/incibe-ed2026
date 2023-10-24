#!/bin/bash
workdir=$1
if [[ -z $workdir ]]
then
	workdir="$HOME/Downloads/"
fi
dificultades=("iniciacion" "intermedio" "avanzado")
for difficulty in ${dificultades[@]}
do
	downloads=$(find $workdir -type f -name "${difficulty}*.7z" | rev | cut -f1 -d"/" | rev | cut -c$((${#difficulty}+1))- | cut -f1,3 -d"-" | sort -n)
	echo "--- "$difficulty" ---"
	lastnum=0
	for download in $downloads
	do
		lastnum=$(($lastnum+1))
		while [[ $(echo $download | cut -f1 -d"-") != $lastnum ]]
		do
			echo -e "\e[0;33m${lastnum}-???\e[0m"
			lastnum=$(($lastnum + 1))
		done
		echo $download
	done
	echo " "
done
