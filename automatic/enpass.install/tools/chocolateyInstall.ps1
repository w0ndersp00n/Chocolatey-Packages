$ErrorActionPreference = 'Stop'

$packageName = 'Enpass'
$url         = 'https://dl.sinew.in/windows/setup/5-6-0-0/Enpass_5.6.0_Setup.exe'
$checksum    = '937b3ea2331bc96289fbf6ec9c3a2259c1c6e44657ec57a1e70d0248da27d8c2'

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
