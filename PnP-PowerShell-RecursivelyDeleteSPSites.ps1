Import-Module SharePointPnPPowerShellOnline
Connect-PnPOnline –Url "URL OF YOUR SITE COLLECTION" –Credentials (Get-Credential)

function RemoveSPWebRecursively($web) {
    $subwebs = Get-pnpSubWebs -web $web 

    foreach($subweb in $subwebs) { RemoveSPWebRecursively($subweb) }
    Write-Host "Deleting " $web.Title
    Write-Host $web.Id
    Remove-PnPWeb -Identity $web.Id  -Force
}

$web = Get-PnPWeb
RemoveSPWebRecursively $web