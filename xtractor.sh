#!/bin/bash
workdir=$1
if [[ -z $workdir ]]
then
    workdir="."
fi
for file in $(find $workdir -type f -name "*.7z")
do
    ogname=$(echo $file | rev | cut -f1 -d"/" | rev | cut -f1 -d".")
    num=$(echo $ogname | cut -f1 -d"-" | sed 's/[a-zA-Z]*//g')
    name=$num-$(echo $ogname | cut -f3 -d"-")
    folder="/tmp/"$name
    echo "+ $folder"
    if [[ -d $folder ]]
    then
        rm -rf $folder
    fi
    mkdir $folder
    7z x $file -o$folder -p4c4d3m14H4ck3r1NC1B3 -y &>/dev/null
    pushd $folder &>/dev/null
    mkdir -p ./$name/archivos
    mv ./02-Descargables/*.pdf ./$name/enunciado-$name.pdf &>/dev/null
    if [[ $? -ne 0 ]]
    then
        echo "  No se ha encontrado ningun PDF"
    fi
    mv ./02-Descargables/* ./$name/archivos/
    mv ./03-WriteUp/*.pdf ./$name/WalkTrough.pdf
    tar -czf $name.tgz -c $name
    popd &>/dev/null
    orig=$(echo $file | rev | cut -f2- -d"/")
    proute=$(echo $orig | cut -f3- -d"/"|rev)/processed
    if [[ ! -d $proute ]]
    then
        mkdir -p $proute
    fi
    dest=$proute/$(echo $orig | cut -f1 -d "/" | rev)/
    if [[ ! -d $dest ]]
    then
        mkdir -p $dest
    fi
    echo -e "\e[0;32m  + [$name.tgz] \e[0m"
    mv $folder/$name.tgz  $dest
    echo "- $folder"
    rm -rf $folder
done