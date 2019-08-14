# lenovo-thinkpad-usb-c-driver install

# Globale Settings
$ErrorActionPreference = 'Stop';

$toolsDir               = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$PackageParameters      = Get-PackageParameters
$urlPackage = 'https://download.lenovo.com/pccbbs/mobiles/thinkpad_thunderbolt-3_dock_and_usb-c_dock_driver_v10017.exe'
$checksumPackage = '20b8881050fdf6ec5d594b57dc169878bf7fa5d2095dc29c480355806e8b23bfe16a2fbdccec6f1ab872ce925880c6cd59db11116ae8bf7ae68c612401d3c948'
$checksumTypePackage    = 'SHA512'

Import-Module -Name "$($toolsDir)\helpers.ps1"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = $urlPackage
    checksum       = $checksumPackage
    checksumType   = $checksumTypePackage
    silentArgs     = '/verysilent /norestart'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
