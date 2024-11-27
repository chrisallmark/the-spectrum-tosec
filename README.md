![ZX Spectrum TOSEC Util](THESPECTRUM.png)

<p align="center">ZX Spectrum TOSEC Utility Script</p>

<hr/>

A shell script to convert the [TOSEC](https://archive.org/details/zx_spectrum_tosec_set_september_2023) collection of ZX Spectrum games into a structure suitable for use with [The Spectrum](https://retrogames.biz/products/thespectrum/) games console.

## Running The Script

- Clone this repo or copy the most appropriate `zx-spectrum-tosec-util` script for your OS
- Download the latest from [TOSEC](https://archive.org/details/zx_spectrum_tosec_set_september_2023) [Games.zip](https://archive.org/download/zx_spectrum_tosec_set_september_2023/Games.zip) and unzip it into the same folder as the script

### Linux

#### BASH Shell:
```
chmod +x zx-spectrum-tosec-util.bash
./zx-spectrum-tosec-util.bash
```

#### Z Shell:
```
chmod +x zx-spectrum-tosec-util.zsh
./zx-spectrum-tosec-util.zsh
```

### Windows

#### Powershell:

Run (⊞+R) `powershell.exe -ExecutionPolicy Bypass`
```
.\zx-spectrum-tosec-util.ps1
```

---

This will move the game files with supported extensions (tap, tzx, pzx, rom, szx, z80, sna, m3u) into a compatible folder structure under `/THESPECTRUM` directory. As The Spectrum only supports up to 256 files per folder the games are split alphabetically (#, A...Z) and numerically (A0...A3).

[NOTE!] In order to increase compatibility this utilty also downloads the original Spectrum ROMs from [FBZX](https://github.com/rastersoft/fbzx) into a `/THESPECTRUM/roms` folder.

Copy THESPECTRUM folder to a suitable USB, plug in to [The Spectrum](https://www.youtube.com/watch?v=EnfQ13nFJYc) & enjoy!
