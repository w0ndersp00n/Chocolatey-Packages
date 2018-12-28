import-module au

$releases = 'https://www.enpass.io/downloads/'

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
    # $version = $download_page.ParsedHtml.documentElement.getElementsByTagName('h3')[0].innerHTML

    # $version = $Matches[0]
    # $versionUrl = $Matches[0].Replace(".","-")

    $url = $download_page.ParsedHtml.getElementById('web_windows_desktop') | ForEach-Object { $_.getElementsByTa
gName('a') } | Where-Object { $_.className -eq 'btn btn_enpass_line btn_enpass_color' } |  Select-Object -Expand href

    $version  = $url -match "\d+(\.\d+)+"

    return @{ URL = $url; Version = $version }
}

update
