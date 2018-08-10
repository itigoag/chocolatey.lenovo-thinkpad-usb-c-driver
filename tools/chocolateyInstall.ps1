# skeleton install

# Globale Settings
$ErrorActionPreference = 'Stop';
$PackageParameters = Get-PackageParameters

$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$binDir     = "$($toolsDir)\..\bin"

# Sets a default value if there are no parameters with value.
if (!$PackageParameters['AUTOSTART']) {
    $PackageParameters['AUTOSTART'] = 'false'
}

# Package Arguments
## Zip download and unpacking
$zipArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = ''
    url64bit       = ''
    unzipLocation  = $binDir
    checksum       = ''
    checksumType   = ''
    checksum64     = ''
    checksumType64 = ''
}

## Download and install Exe or MSI.
$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = ''
	url            = ''
    url64          = ''
    checksum       = ''
    checksumType   = ''
    checksum64     = ''
    checksumType64 = ''
	silentArgs     = ''
    ValidExitCodes = @(0, 1000, 1101)
}

## Install Exe or MSI from local.
$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = ''
    file           = "$($binDir)\"
    checksum       = ''
    checksumType   = ''
    checksum64     = ''
    checksumType64 = ''
	silentArgs     = ''
    ValidExitCodes = @(0, 1000, 1101)
}

## Zip download and unpacking
Install-ChocolateyZipPackage @zipArgs

## Download and install Exe or MSI.
Install-ChocolateyPackage @packageArgs

## Install Exe or MSI from local.
Install-ChocolateyInstallPackage @packageArgs

# Custome Settings from Package
## Remove files and folders
if (Get-Item -Path "<Path>" -ErrorAction SilentlyContinue) {
    Remove-Item `
        -Path "<Path>" `
        -Recurse
    Write-Output `
        -InputObject "Remove Shortcut <Path>"
}

# Updated registry entries
Set-ItemProperty `
	-Path "<RegistryPath>" `
    -Name ""
    -Value
Write-Output `
    -InputObject "<description>"
