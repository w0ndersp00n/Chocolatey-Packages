$ErrorActionPreference = 'Stop'

$packageName = 'mavensmate'
$url         = 'https://github.com/joeferraro/MavensMate-Desktop/releases/download/v0.0.11-beta.7/MavensMate-Desktop-Setup-0.0.11-beta.7-ia32.exe'
$checksum    = '3444EAAC15AB53B16F9C17B74D699F5B17635BF83D6E0AF66148F32A2E70F6E7'

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'EXE'
  url                    = $url
  silentArgs             = ''
  checksum               = $checksum
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}

Install-ChocolateyPackage @packageArgs