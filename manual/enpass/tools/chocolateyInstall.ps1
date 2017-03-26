$ErrorActionPreference = 'Stop'

$packageName = 'Enpass'
$url         = 'https://dl.sinew.in/windows/setup/5-5-2/Enpass_Setup.exe  '
$checksum    = '5597E662D363C0D31B58C502E4F806DFEA2F14B6CB8E63FBA85B8A507F85ACF6'

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
