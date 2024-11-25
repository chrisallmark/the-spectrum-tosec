#!/bin/zsh
setopt +o nomatch
folder=""
folder_ext=""
for i in Games/*/; do
    if [[ "${$(basename "$i"):0:1}" != "!" ]]; then
        file=$(basename "$i")
        letter=$(echo "${file:0:1}" | tr '[:digit:]' '#' | tr '[:lower:]' '[:upper:]')
        if [[ "$folder" != "$letter" ]]
        then
            count=0
            folder=$letter
            folder_ext=""
        fi
        folder_ext=$((count++ / 256))
        mkdir -p THESPECTRUM/$folder$folder_ext/$file
        for f in $i*.{tap,tzx,pzx,rom,szx,z80,sna,m3u}; do
            cp $f THESPECTRUM/$folder$folder_ext/$file
        done
   fi
done
