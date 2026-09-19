<#
.SYNOPSIS
Connection excerpt adapted from the supplied migration runbook.
.NOTES
Dot-sourcing defines the function only. Calling it connects to supplied sites.
Requires compatible PnP.PowerShell, a supported Azure host, and configured
identity permissions. No permission grants or copy operations here.
#>
function Connect-MigrationEndpoints {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][uri]$SourceSite,
        [Parameter(Mandatory)][uri]$TargetSite
    )
    foreach ($site in @($SourceSite, $TargetSite)) {
        if ($site.Scheme -ne 'https' -or [string]::IsNullOrWhiteSpace($site.Host)) {
            throw 'An HTTPS site endpoint is required.'
        }
    }
    $null = Get-Command Connect-PnPOnline -ErrorAction Stop
    $source = Connect-PnPOnline -Url $SourceSite.AbsoluteUri -ManagedIdentity -ReturnConnection -ErrorAction Stop
    $target = Connect-PnPOnline -Url $TargetSite.AbsoluteUri -ManagedIdentity -ReturnConnection -ErrorAction Stop
    [pscustomobject]@{ Source = $source; Target = $target }
}
