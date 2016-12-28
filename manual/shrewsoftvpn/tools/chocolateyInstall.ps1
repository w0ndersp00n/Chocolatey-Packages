$ErrorActionPreference = 'Stop'

$packageName = 'shrewsoftvpn'
$url         = 'https://www.shrew.net/download/vpn/vpn-client-2.2.2-release.exe'
$checksum    = '573B26315D49AB55E10EC39AA092F43FF0A061F3472AD99D3F5F106DADD18C3D'

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

$arguments = @{}

$packageParameters = $env:chocolateyPackageParameters

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

    # https://www.shrew.net/static/help-2.2.x/html/Shrew%20Soft%20VPN%20Client%20Administrators%20Guide.html?UsingtheVPNClient1.html
    $customArguments = @{}

    if ($arguments.ContainsKey("STANDARD")) {
        Write-Host "Install the Standard Edition instead of the Professional edition."
        $customArguments.Add("STANDARD")
    }

    if ($arguments.ContainsKey("NOMENU")) {
        Write-Host "The standard start menu shortcuts will not be installed."
        $customArguments.Add("NOMENU")
    }

    if ($arguments.ContainsKey("NODESK")) {
        Write-Host "The standard desktop menu shortcuts will not be installed."
        $customArguments.Add("NODESK")
    }

} else {
    Write-Debug "No Package Parameters Passed in"
}

if ($customArguments.Count) { 
    $packageArgs.silentArgs += " " + (($customArguments.GetEnumerator() | % { "$($_.Name)=$($_.Value)" } ) -join " /")
}

Install-ChocolateyPackage @packageArgs