#!/bin/bash
shopt -s nullglob
folder=""
folder_ext=""
for i in Games/*/; do
    if [[ "${i:0:1}" != "!" ]]; then
        file=$(basename "$i")
        letter=$(echo "${file:0:1}" | tr '[:digit:]' '#' | tr '[:lower:]' '[:upper:]')
        if [[ "$folder" != "$letter" ]]
        then
            count=0
            folder=$letter
        fi
        folder_ext=$((count++ / 256))
        mkdir -p THESPECTRUM/$folder$folder_ext/$file
        for f in "$i"*.{tap,tzx,pzx,rom,szx,z80,sna,m3u}; do
            cp "$f" THESPECTRUM/$folder$folder_ext/$file
        done
   fi
done
mkdir -p THESPECTRUM/roms
cd THESPECTRUM/roms
curl -O https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/128-0.rom
curl -O https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/128-1.rom
curl -O https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/48.rom
curl -O https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/plus3-0.rom
curl -O https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/plus3-1.rom
curl -O https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/plus3-2.rom
curl -O https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/plus3-3.rom
