$ErrorActionPreference = 'Stop'

$packageName = 'cloudstation'
$url         = 'https://global.download.synology.com/download/Tools/CloudStationDrive/4.2.5-4396/Windows/Installer/Synology%20Cloud%20Station%20Drive-4.2.5-4396.msi'
$checksum    = 'c913624f1636c62a15652836770654c5151766c91bc7f199af3f3467a0893b5c'

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
