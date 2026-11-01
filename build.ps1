param(
    [string]$Compiler = '',
    [string]$ReferenceDirectory = ''
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$Root = $PSScriptRoot
if (-not $Compiler) {
    foreach ($candidate in @(
        (Join-Path $env:WINDIR 'Microsoft.NET\Framework64\v4.0.30319\csc.exe'),
        (Join-Path $env:WINDIR 'Microsoft.NET\Framework\v4.0.30319\csc.exe')
    )) {
        if (Test-Path -LiteralPath $candidate -PathType Leaf) { $Compiler = $candidate; break }
    }
}
if (-not $Compiler -or -not (Test-Path -LiteralPath $Compiler -PathType Leaf)) {
    throw 'Windows csc.exe was not found. Supply -Compiler with an explicit compiler path.'
}
if (-not $ReferenceDirectory) {
    $candidates = @()
    if (${env:ProgramFiles(x86)}) {
        $candidates += Join-Path ${env:ProgramFiles(x86)} 'Reference Assemblies\Microsoft\Framework\.NETFramework\v4.8'
    }
    if ($env:ProgramFiles) {
        $candidates += Join-Path $env:ProgramFiles 'Reference Assemblies\Microsoft\Framework\.NETFramework\v4.8'
    }
    foreach ($candidate in $candidates) {
        if (Test-Path -LiteralPath (Join-Path $candidate 'mscorlib.dll') -PathType Leaf) { $ReferenceDirectory = $candidate; break }
    }
}
if (-not $ReferenceDirectory) {
    throw 'Install the Microsoft .NET Framework 4.8 Developer Pack or supply -ReferenceDirectory. No files are downloaded by this script.'
}
$ReferenceDirectory = (Resolve-Path -LiteralPath $ReferenceDirectory).Path
$refs = @('mscorlib','System','System.Core','System.Drawing','System.Windows.Forms','System.Web.Extensions')
foreach ($ref in $refs) {
    if (-not (Test-Path -LiteralPath (Join-Path $ReferenceDirectory ($ref + '.dll')) -PathType Leaf)) { throw ('Missing reference assembly: ' + $ref) }
}
$outDir = Join-Path $Root 'build\IGM'
New-Item -ItemType Directory -Path $outDir -Force | Out-Null
$outExe = Join-Path $outDir 'IGM_Companion.exe'
$argsToCsc = @('/nologo','/noconfig','/nostdlib+','/target:winexe','/platform:x64','/optimize+','/debug-','/codepage:65001',
    ('/out:' + $outExe),
    ('/win32icon:' + (Join-Path $Root 'runtime\IGM_Companion.ico')),
    ('/resource:' + (Join-Path $Root 'src\glyphs.png') + ',IGM.Glyphs'))
foreach ($ref in $refs) { $argsToCsc += '/reference:' + (Join-Path $ReferenceDirectory ($ref + '.dll')) }
foreach ($file in @('Core.cs','ImperialCore.cs','Interface.cs')) { $argsToCsc += Join-Path $Root ('src\' + $file) }
& $Compiler @argsToCsc
if ($LASTEXITCODE -ne 0) { throw ('C# compilation failed: ' + $LASTEXITCODE) }
Get-ChildItem -LiteralPath (Join-Path $Root 'runtime') | Copy-Item -Destination $outDir -Recurse -Force
Get-FileHash -LiteralPath $outExe -Algorithm SHA256 | Format-List
Write-Output ('Build finished in ' + $outDir + '. No game files were installed or changed.')
