@echo off
setlocal enabledelayedexpansion

set "folder="
set "folder_ext="

for /d %%i in (Games\*) do (
    set "file=%%~nxi"
    set "letter=!file:~0,1!"
    for /f "delims=0123456789" %%j in ("!letter!") do set "letter=%%j"
    set "letter=!letter:~0,1!"
    for %%j in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
        if /i "!letter!"=="%%j" set "letter=!letter:~0,1!"
    )
    if not "!folder!"=="!letter!" (
        set /a count=0
        set "folder=!letter!"
        set "folder_ext="
    )
    set /a folder_ext=!count! / 256
    set /a count+=1
    if !folder_ext! lss 10 (set "folder_ext=0!folder_ext!")
    if !folder_ext! lss 100 (set "folder_ext=0!folder_ext!")
    mkdir "THESPECTRUM\!folder!!folder_ext!\!file!" 2>nul
    for %%f in (%%i*.tap %%i*.tzx %%i*.pzx %%i*.rom %%i*.szx %%i*.z80 %%i*.sna %%i*.m3u) do (
        copy "%%f" "THESPECTRUM\!folder!!folder_ext!\!file!"
    )
)

mkdir "THESPECTRUM\roms" 2>nul
cd "THESPECTRUM\roms"
curl -O https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/128-0.rom
curl -O https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/128-1.rom
curl -O https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/48.rom
curl -O https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/plus3-0.rom
curl -O https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/plus3-1.rom
curl -O https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/plus3-2.rom
curl -O https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/plus3-3.rom

endlocal
