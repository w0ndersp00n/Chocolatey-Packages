$ErrorActionPreference = 'Stop'

$packageName = 'Enpass'
$url         = 'https://dl.sinew.in/windows/setup/5-6-5-1/Enpass_5.6.5_Setup.exe'
$checksum    = '5D85DA4551A830F0146D106D73E37514D5FD67F2EE599A696AC75BD9F8904646'

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
