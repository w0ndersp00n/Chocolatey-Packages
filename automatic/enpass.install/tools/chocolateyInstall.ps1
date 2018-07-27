$ErrorActionPreference = 'Stop'

$packageName = 'Enpass'
$url         = 'https://dl.sinew.in/windows/setup/5-6-9/Enpass_5.6.9_Setup.exe'
$checksum    = 'a203627c478ddf5f6de05a33d43ffb0eaefe8ba96afea966a89485cf4d7fd608'

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'EXE'
  url                    = $url
  silentArgs             = '/S'
  checksum               = $checksum
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}
Install-ChocolateyPackage @packageArgs
