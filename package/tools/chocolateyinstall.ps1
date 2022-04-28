# lenovo-thinkpad-usb-c-driver install

# Globale Settings
$ErrorActionPreference = 'Stop';

$toolsDir               = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$PackageParameters      = Get-PackageParameters
$urlPackage = 'https://download.lenovo.com/consumer/options/lenovo_thinkpad_thunderbolt_3_dock_and_usb_c_dock_driver_v10019.exe'
$checksumPackage = '010075499e3a7011151fb890b57ffe800234c69493180ffea71f03e716e75d66bfb25dfdc8e7b6cb3577a72fa594d5265cf9f84274efae88fe9c5aaeb5abb043'
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
