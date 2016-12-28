$ErrorActionPreference = 'Stop'

$pp = Get-PackageParameters

$params = ""
$params += if ($pp.STANDARD) { '/STANDARD' } else { '' }
$params += if ($pp.NOMENU) { '/NOMENU' } else { '' }
$params += if ($pp.NODESK) { '/NODESK' } else { '' }

$packageName = 'shrewsoftvpn'
$url         = 'https://www.shrew.net/download/vpn/vpn-client-2.2.2-release.exe'
$checksum    = '573B26315D49AB55E10EC39AA092F43FF0A061F3472AD99D3F5F106DADD18C3D'

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'EXE'
  url                    = $url
  silentArgs             = '/S $params'
  checksum               = $checksum
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}

$arguments = @{}

Install-ChocolateyPackage @packageArgs