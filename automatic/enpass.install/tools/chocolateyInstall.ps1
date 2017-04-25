$ErrorActionPreference = 'Stop'

$packageName = 'Enpass'
$url         = 'https://dl.sinew.in/windows/setup/5-5-3/Enpass_Setup.exe'
$checksum    = 'cf9813d203a7660481eac723acdf0959860fc53eea6943097a4de7dd6c29cc33'

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
