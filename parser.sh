#!/bin/bash
workdir=$1
if [[ -z $workdir ]]
then
	workdir="$HOME/Downloads/"
fi
dificultades=("iniciacion" "intermedio" "avanzado")
for difficulty in ${dificultades[@]}
do
	downloads=$(ls $workdir/${difficulty}/*.7z | tr -s " " | cut -f9 -d" " | rev | cut -f1 -d"/" | rev | cut -c$((${#difficulty}+1))- | cut -f1,3 -d"-" | sort -n)
	echo $difficulty"----"
    echo "## Dificultad: ${difficulty}  " >> ./readme.md
	for download in $downloads
	do
		file=$(find $workdir -type f -name "*$(echo $download | cut -f2 -d- | cut -f1 -d.)*.7z")
		7z e $file -o/tmp/ Enunciado.txt -r -p4c4d3m14H4ck3r1NC1B3 -y &>/dev/null
		desc=$(iconv -f ISO-8859-1 -t UTF-8  /tmp/Enunciado.txt)
		echo "+ ${download}: ${desc}"
		printf "### ${download}\n**Categoria:** $(echo $file | rev | cut -f1 -d"/" | cut -f2 -d"-" | rev)  \n **Tags:**  \n ${desc}  \n**Solucion:**  \n" >> ./readme.md
		rm /tmp/Enunciado.txt
	done
done

