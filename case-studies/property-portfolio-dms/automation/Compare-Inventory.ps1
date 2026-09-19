<#
.SYNOPSIS
Compares scoped offline relative-path inventories, independently of metadata.
.NOTES
Path equality does not prove identical bytes, access, identities, or versions.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$SourcePath,
    [Parameter(Mandatory)][string]$TargetPath
)
$ErrorActionPreference = 'Stop'
$source = @(Import-Csv -LiteralPath $SourcePath)
$target = @(Import-Csv -LiteralPath $TargetPath)
if ($source.Count -eq 0) { throw 'An empty source requires explicit investigation.' }
foreach ($rows in @(@{ Rows = $source }, @{ Rows = $target })) {
    $seen = @{}
    foreach ($row in $rows.Rows) {
        $path = $row.RelativePath
        if ([string]::IsNullOrWhiteSpace($path) -or
            $path -match '^/|\\|//|(^|/)\.\.?(/|$)') { throw 'Invalid relative path.' }
        if ($seen.ContainsKey($path)) { throw 'Duplicate relative path.' }
        $seen[$path] = $true
    }
}
$sourcePaths = @($source | ForEach-Object { $_.RelativePath })
$targetPaths = @($target | ForEach-Object { $_.RelativePath })
$missing = @($sourcePaths | Where-Object { $_ -notin $targetPaths })
$extra = @($targetPaths | Where-Object { $_ -notin $sourcePaths })
[pscustomobject]@{
    SourceFiles = $source.Count
    TargetFiles = $target.Count
    MissingFiles = $missing.Count
    ExtraFiles = $extra.Count
    MissingPaths = $missing
    ExtraPaths = $extra
    FileReconciliation = $(if ($missing.Count -eq 0 -and $extra.Count -eq 0) { 'PASS' } else { 'REVIEW' })
    MetadataValidation = 'NOT_EVALUATED'
    VersionValidation = 'NOT_EVALUATED'
}
