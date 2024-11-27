Set-StrictMode -Version Latest
$folder = ""
$folder_ext = 0
Get-ChildItem -Directory -Path "Games" | ForEach-Object {
    $file = $_.Name
    $letter = $file.Substring(0, 1).ToUpper()
    if ($folder -ne $letter) {
        $count = 0
        $folder = $letter
    }
    $folder_ext = [math]::Floor($count / 256)
    $count++
    $targetDir = "THESPECTRUM\$folder$folder_ext\$file"
    New-Item -ItemType Directory -Force -Path $targetDir
    Get-ChildItem -Path "$($_.FullName)\*" -Include *.tap, *.tzx, *.pzx, *.rom, *.szx, *.z80, *.sna, *.m3u | ForEach-Object {
        Copy-Item -LiteralPath $_.FullName -Destination $targetDir
    }
}
$romsDir = "THESPECTRUM\roms"
New-Item -ItemType Directory -Force -Path $romsDir
Set-Location -Path $romsDir
$urls = @(
    "https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/128-0.rom",
    "https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/128-1.rom",
    "https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/48.rom",
    "https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/plus3-0.rom",
    "https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/plus3-1.rom",
    "https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/plus3-2.rom",
    "https://github.com/rastersoft/fbzx/raw/refs/heads/master/data/spectrum-roms/plus3-3.rom"
)
foreach ($url in $urls) {
    Invoke-WebRequest -Uri $url -OutFile (Split-Path -Leaf $url)
}
