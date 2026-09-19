<#
.SYNOPSIS
Builds an offline plan using the relative-path mapping pattern from reviewed work.
.NOTES
Does not connect, copy, create folders, or modify a tenant.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$InventoryPath,
    [Parameter(Mandatory)][string]$MappingPath
)
$ErrorActionPreference = 'Stop'
$inventory = @(Import-Csv -LiteralPath $InventoryPath)
$mapping = @(Import-Csv -LiteralPath $MappingPath)
if ($inventory.Count -eq 0 -or $mapping.Count -eq 0) {
    throw 'Inventory and approved mapping must be nonempty.'
}
$seen = @{}
foreach ($item in $inventory) {
    $matches = @($mapping | Where-Object { $_.Property -eq $item.Property })
    if ($matches.Count -ne 1) { throw 'Each property needs exactly one approved mapping.' }
    $map = $matches[0]
    $root = $map.SourceRoot.TrimEnd('/') + '/'
    if (-not $item.SourcePath.StartsWith($root, [StringComparison]::OrdinalIgnoreCase)) {
        throw 'Source path is outside its approved root.'
    }
    $relative = $item.SourcePath.Substring($root.Length)
    if ([string]::IsNullOrWhiteSpace($relative) -or
        $relative -match '(^|/)\.\.?(/|$)|\\|//|[?#%]') {
        throw 'Ambiguous relative path; this sample accepts decoded simple paths only.'
    }
    if ($map.TargetRoot -notmatch '^/[^?#%\\]+$' -or
        $map.TargetRoot -match '(^|/)\.\.?(/|$)|//') {
        throw 'Invalid target root.'
    }
    $destination = $map.TargetRoot.TrimEnd('/') + '/' + $relative
    if ($seen.ContainsKey($destination)) { throw 'Duplicate destination mapping.' }
    $seen[$destination] = $true
    [pscustomobject]@{
        Property = $item.Property
        RelativePath = $relative
        DestinationPath = $destination
        Status = 'PLANNED'
    }
}
