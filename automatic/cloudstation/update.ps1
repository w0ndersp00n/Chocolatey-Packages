import-module au

$releases = 'https://www.synology.com/nl-nl/releaseNote/CloudStationDrive'

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

    $version = $download_page.ParsedHtml.getElementsByTagName('h1')[0].innerHTML

    $re  = $version -match "[0-9.-]*$"
    $version = $Matches[0]
    
    $url = "https://global.download.synology.com/download/Tools/CloudStationDrive/"+$version+"/Windows/Installer/Synology%20Cloud%20Station%20Drive-"+$version+".msi"

    return @{ URL = $url; Version = $version.Replace("-",".") }
}

update
