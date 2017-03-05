Import-Module SharePointPnPPowerShellOnline
Connect-PnPOnline –Url "URL OF YOU SITE COLL" –Credentials (Get-Credential)

function RemoveSPWebRecursively($web) {
    $subwebs = Get-pnpSubWebs -web $web 

    foreach($subweb in $subwebs) {
        if ($subweb.Title -ne "Client Sierra") {
            RemoveSPWebRecursively($subweb)
        }
    }
    Write-Host "Deleting " $web.Title
    Write-Host $web.Id
    Remove-PnPWeb -Identity $web.Id  -Force
}

$web = Get-PnPWeb
RemoveSPWebRecursively $web