$ErrorActionPreference = 'Stop'

$packageName = 'cloudstation'
$url         = 'https://global.download.synology.com/download/Tools/CloudStationDrive/4.3.3-4469/Windows/Installer/Synology%20Cloud%20Station%20Drive-4.3.3-4469.msi'
$checksum    = 'CDAB62232B9151C2236282617445E487592FF830AC647A4F307548CA62B875D7'

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'msi'
  url                    = $url
  silentArgs             = '/quiet'
  checksum               = $checksum
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}
Install-ChocolateyPackage @packageArgs
