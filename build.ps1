# Packs each mod into build/<name>.scs (local/standard layout).
# manifest.sii + icon.jpg at archive root — required for in-game Mod Manager icon.
#
# Steam Workshop build (versions.sii + universal/) is commented out below.
# Uncomment the Workshop section when publishing to Steam via SCS Workshop Uploader.
$ErrorActionPreference = "Stop"

$root = $PSScriptRoot
$buildDir = Join-Path $root "build"
# $workshopDir = Join-Path $buildDir "workshop"

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

function New-ScsArchive {
    param(
        [System.IO.FileInfo[]]$Files,
        [string]$SourceRoot,
        [string]$OutputPath
    )

    if (Test-Path $OutputPath) {
        Remove-Item $OutputPath -Force
    }

    $zip = [System.IO.Compression.ZipFile]::Open($OutputPath, [System.IO.Compression.ZipArchiveMode]::Create)

    try {
        foreach ($file in $Files) {
            if ($null -eq $file) { continue }
            $relativePath = $file.FullName.Substring($SourceRoot.Length + 1).Replace("\", "/")
            $entry = $zip.CreateEntry($relativePath, [System.IO.Compression.CompressionLevel]::NoCompression)
            $entryStream = $entry.Open()
            try {
                $fileStream = [System.IO.File]::OpenRead($file.FullName)
                try {
                    $fileStream.CopyTo($entryStream)
                }
                finally {
                    $fileStream.Close()
                }
            }
            finally {
                $entryStream.Close()
            }
        }
    }
    finally {
        $zip.Dispose()
    }
}

function Get-UniversalDir {
    param([string]$ModDir)

    $universal = Join-Path $ModDir "universal"
    if (-not (Test-Path (Join-Path $universal "manifest.sii"))) {
        throw "universal/manifest.sii not found in '$ModDir'"
    }
    if (-not (Test-Path (Join-Path $universal "icon.jpg"))) {
        throw "universal/icon.jpg not found in '$ModDir'"
    }
    return $universal
}

function Get-LocalPackageFiles {
    param([string]$ModDir)

    $universal = Get-UniversalDir -ModDir $ModDir
    return @{
        SourceRoot = $universal
        Files      = @(Get-ChildItem -Path $universal -Recurse -File)
    }
}

# --- Steam Workshop (SCS Workshop Uploader) — uncomment when publishing to Steam ---
#
# function Copy-WorkshopFolder {
#     param(
#         [string]$ModDir,
#         [string]$OutputDir
#     )
#
#     if (Test-Path $OutputDir) {
#         Remove-Item $OutputDir -Recurse -Force
#     }
#     New-Item -ItemType Directory -Path $OutputDir | Out-Null
#
#     Copy-Item (Join-Path $ModDir "versions.sii") $OutputDir
#     Copy-Item (Join-Path $ModDir "universal") (Join-Path $OutputDir "universal") -Recurse
# }
# --- end Steam Workshop ---

if (-not (Test-Path $buildDir)) {
    New-Item -ItemType Directory -Path $buildDir | Out-Null
}
# if (-not (Test-Path $workshopDir)) {
#     New-Item -ItemType Directory -Path $workshopDir | Out-Null
# }

$modFolders = @(
    "1.5 Cash & XP",
    "2X Cash & XP",
    "2X Cash",
    "2X XP"
)

foreach ($modName in $modFolders) {
    $modDir = Join-Path $root $modName

    try {
        $local = Get-LocalPackageFiles -ModDir $modDir
    }
    catch {
        Write-Warning "Skipping '$modName' - $($_.Exception.Message)"
        continue
    }

    $outputScs = Join-Path $buildDir "$modName.scs"
    New-ScsArchive -Files $local.Files -SourceRoot $local.SourceRoot -OutputPath $outputScs
    Write-Host "Packed: $outputScs"

    # --- Steam Workshop — uncomment when publishing to Steam ---
    # $outputWorkshop = Join-Path $workshopDir $modName
    # Copy-WorkshopFolder -ModDir $modDir -OutputDir $outputWorkshop
    # Write-Host "Workshop folder: $outputWorkshop"
}

Write-Host "Done. $($modFolders.Count) mods packed to build/"
