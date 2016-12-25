$ErrorActionPreference = 'Stop'

$packageName = 'cloudstation'
$url         = 'https://global.download.synology.com/download/Tools/CloudStationDrive/4.2.1-4374/Windows/Installer/Synology%20Cloud%20Station%20Drive-4.2.1-4374.msi'
$checksum    = 'F9F6C7EAEC68B30E127FBDFA9E2996D706CCBA930A9FD75613E0B6C78B376ACA'

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
