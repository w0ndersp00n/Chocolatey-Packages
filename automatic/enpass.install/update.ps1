import-module au

$releases = 'https://www.enpass.io/release-notes/windowspc/'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases
    $version = $download_page.ParsedHtml.documentElement.getElementsByTagName('h2')[0].innerHTML

    $re  = $version -match "\d+(\.\d+)+"

	$version = $Matches[0]
    $versionUrl = $Matches[0].Replace(".","-")

    $url = "https://dl.sinew.in/windows/setup/"+$versionUrl+"/Enpass_"+$version+"_Setup.exe"

    return @{ URL = $url; Version = $version.Replace("-",".") }
}

update
