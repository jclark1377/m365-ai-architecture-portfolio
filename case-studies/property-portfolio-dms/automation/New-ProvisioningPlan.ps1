<#
.SYNOPSIS
Demonstrates create-if-missing planning without live provisioning.
.NOTES
Derived from reviewed desired-state and validation separation.
Existence alone does not validate configuration or permissions.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string[]]$RequiredLibraries,
    [AllowEmptyCollection()][string[]]$ExistingLibraries = @()
)
$ErrorActionPreference = 'Stop'
if ($RequiredLibraries.Count -eq 0) { throw 'Required libraries cannot be empty.' }
$seen = @{}
foreach ($library in $RequiredLibraries) {
    if ([string]::IsNullOrWhiteSpace($library) -or $seen.ContainsKey($library)) {
        throw 'Required library names must be nonempty and unique.'
    }
    $seen[$library] = $true
    [pscustomobject]@{
        Library = $library
        PlannedAction = $(if ($library -in $ExistingLibraries) { 'VALIDATE_EXISTING' } else { 'CREATE_THEN_VALIDATE' })
        Applied = $false
    }
}
