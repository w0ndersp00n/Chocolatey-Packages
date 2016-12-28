$ErrorActionPreference = 'Stop'

$arguments = @{}
$packageParameters = $env:chocolateyPackageParameters

# Default the values

$standard = $false
$nomenu = $false
$nodesk = $false

# Now parse the packageParameters using good old regular expression
if ($packageParameters) {
    $match_pattern = "\/(?<option>([a-zA-Z]+)):(?<value>([`"'])?([a-zA-Z0-9- _\\:\.]+)([`"'])?)|\/(?<option>([a-zA-Z]+))"
    $option_name = 'option'
    $value_name = 'value'

    if ($packageParameters -match $match_pattern ){
        $results = $packageParameters | Select-String $match_pattern -AllMatches
        $results.matches | % {
        $arguments.Add(
            $_.Groups[$option_name].Value.Trim(),
            $_.Groups[$value_name].Value.Trim())
        }
    }
    else
    {
        Throw "Package Parameters were found but were invalid (REGEX Failure)"
    }

    if ($arguments.ContainsKey("STANDARD")) {
        Write-Host "You want to install Standard Edition"
        $standard = $true
    }
    if ($arguments.ContainsKey("NOMENU")) {
        Write-Host "You want no menu items"
        $nomenu = $true
    }
    if ($arguments.ContainsKey("NODESK")) {
        Write-Host "You want no desktop icon"
        $nodesk = $true
    }

} else {
    Write-Debug "No Package Parameters Passed in"
}

$params = ""
if ($standard) { $params += " /STANDARD" }
if ($nomenu) { $params += " /NOMENU" }
if ($nodesk) { $params += " /NODESK" }

$packageName = 'shrewsoftvpn'
$url         = 'https://www.shrew.net/download/vpn/vpn-client-2.2.2-release.exe'
$checksum    = '573B26315D49AB55E10EC39AA092F43FF0A061F3472AD99D3F5F106DADD18C3D'

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'EXE'
  url                    = $url
  silentArgs             = '/S' + $params
  checksum               = $checksum
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}

Install-ChocolateyPackage @packageArgs