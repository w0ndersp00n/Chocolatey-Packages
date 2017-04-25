$ErrorActionPreference = 'Stop'

$packageName = 'cloudstation'
$url         = 'https://global.download.synology.com/download/Tools/CloudStationDrive/4.2.3-4385/Windows/Installer/Synology%20Cloud%20Station%20Drive-4.2.3-4385.msi'
$checksum    = '7d4b5a086d538220435eb3bd6c75f356977dd8cc0ead0367acedf311a07232fe'

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
