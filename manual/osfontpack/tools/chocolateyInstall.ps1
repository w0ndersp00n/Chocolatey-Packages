$ErrorActionPreference = 'Stop'

$packageName = 'osfontpack'
$url         = 'https://github.com/texhex/OSFontPack/releases/download/v1.4.0/OSFontPack.exe'
$checksum    = '73c4c7e2497b4f913ef069ead41f1241655dcaa8f5d82c179409bc1ee176413c'

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'EXE'
  url                    = $url
  silentArgs             = '/TYPE=full /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /CLOSEAPPLICATIONS /NORESTARTAPPLICATIONS'
  checksum               = $checksum
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}
Install-ChocolateyPackage @packageArgs
