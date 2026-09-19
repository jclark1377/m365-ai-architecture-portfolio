<#
.SYNOPSIS
Evaluates a read-only snapshot; does not inspect or mutate a live tenant.
.NOTES
Missing, duplicate, unexpected, and failed observations block readiness.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$SnapshotPath,
    [string[]]$RequiredChecks = @('SiteConnection', 'Owners', 'HubAssociation', 'Libraries')
)
$ErrorActionPreference = 'Stop'
$checks = @(Get-Content -LiteralPath $SnapshotPath -Raw | ConvertFrom-Json)
if ($RequiredChecks.Count -eq 0) { throw 'Required checks cannot be empty.' }
$failures = @(
    foreach ($name in $RequiredChecks) {
        $found = @($checks | Where-Object { $_.Check -eq $name })
        if ($found.Count -ne 1) { "Missing or duplicate check: $name" }
        elseif ($found[0].Status -cne 'PASS') { "Failed or unknown check: $name" }
    }
    foreach ($check in $checks) {
        if ($null -ne $check -and $check.Check -notin $RequiredChecks) { 'Unexpected check in snapshot.' }
    }
)
[pscustomobject]@{
    ProvisioningReady = ($failures.Count -eq 0)
    MigrationReady = ($failures.Count -eq 0)
    Failures = $failures.Count
    ValidationErrors = $failures
    EvidenceType = 'Offline snapshot evaluation'
}
