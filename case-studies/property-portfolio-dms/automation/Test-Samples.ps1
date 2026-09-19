# Offline checks; temporary fixtures only, removed on exit.
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$sample = Join-Path (Split-Path $PSScriptRoot -Parent) 'samples'
$temp = Join-Path ([IO.Path]::GetTempPath()) ('portfolio-samples-' + [guid]::NewGuid().ToString('N'))
$null = New-Item -ItemType Directory -Path $temp
function Assert-True($Value, $Message) { if (-not $Value) { throw $Message } }
function Assert-Throws([scriptblock]$Action, $Message) {
    $caught = $false
    try { & $Action | Out-Null } catch { $caught = $true }
    Assert-True $caught $Message
}
try {
    $plan = @(& "$PSScriptRoot/New-MigrationPlan.ps1" -InventoryPath "$sample/inventory.sample.csv" -MappingPath "$sample/mapping.sample.csv")
    Assert-True ($plan.Count -eq 2) 'Expected two planned files.'
    Assert-True ($plan[0].DestinationPath -eq '/sites/portfolio/Property-A/Operations/Example.txt') 'Incorrect root mapping.'
    $ready = & "$PSScriptRoot/Test-Readiness.ps1" -SnapshotPath "$sample/readiness.sample.json"
    Assert-True $ready.MigrationReady 'Complete snapshot should pass.'
    '[]' | Set-Content -LiteralPath "$temp/empty.json"
    $incomplete = & "$PSScriptRoot/Test-Readiness.ps1" -SnapshotPath "$temp/empty.json"
    Assert-True (-not $incomplete.MigrationReady -and $incomplete.Failures -eq 4) 'Missing checks must block readiness.'
    $comparison = & "$PSScriptRoot/Compare-Inventory.ps1" -SourcePath "$sample/source.sample.csv" -TargetPath "$sample/target.sample.csv"
    Assert-True ($comparison.FileReconciliation -eq 'PASS') 'Matching paths should pass.'
    @('RelativePath','Operations/Example.txt','Other/Unexpected.txt') | Set-Content -LiteralPath "$temp/different.csv"
    $different = & "$PSScriptRoot/Compare-Inventory.ps1" -SourcePath "$sample/source.sample.csv" -TargetPath "$temp/different.csv"
    Assert-True ($different.MissingFiles -eq 1 -and $different.ExtraFiles -eq 1) 'Equal counts must not hide path differences.'
    @('Property,SourcePath','Property-A,/sites/legacy/Documents/Property-AB/Example.txt') | Set-Content -LiteralPath "$temp/outside.csv"
    Assert-Throws { & "$PSScriptRoot/New-MigrationPlan.ps1" -InventoryPath "$temp/outside.csv" -MappingPath "$sample/mapping.sample.csv" } 'Root-prefix collision must fail.'
    @('Property,SourcePath','Property-A,/sites/legacy/Documents/Property-A/../Example.txt') | Set-Content -LiteralPath "$temp/traversal.csv"
    Assert-Throws { & "$PSScriptRoot/New-MigrationPlan.ps1" -InventoryPath "$temp/traversal.csv" -MappingPath "$sample/mapping.sample.csv" } 'Traversal must fail.'
    $duplicate = @(Import-Csv "$sample/inventory.sample.csv")
    @($duplicate[0], $duplicate[0]) | Export-Csv "$temp/duplicate.csv" -NoTypeInformation
    Assert-Throws { & "$PSScriptRoot/New-MigrationPlan.ps1" -InventoryPath "$temp/duplicate.csv" -MappingPath "$sample/mapping.sample.csv" } 'Duplicate destinations must fail.'
    $provision = @(& "$PSScriptRoot/New-ProvisioningPlan.ps1" -RequiredLibraries 'Operations','Finance' -ExistingLibraries 'Operations')
    Assert-True ($provision[0].PlannedAction -eq 'VALIDATE_EXISTING' -and $provision[1].PlannedAction -eq 'CREATE_THEN_VALIDATE') 'Provisioning decisions incorrect.'
    Write-Output 'PASS: offline mapping, readiness, reconciliation, provisioning, and rejection checks.'
}
finally {
    $resolved = [IO.Path]::GetFullPath($temp)
    $tempRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\','/') + [IO.Path]::DirectorySeparatorChar
    if ($resolved.StartsWith($tempRoot, [StringComparison]::OrdinalIgnoreCase) -and
        [IO.Path]::GetFileName($resolved).StartsWith('portfolio-samples-')) {
        Remove-Item -LiteralPath $resolved -Recurse -Force
    }
}
