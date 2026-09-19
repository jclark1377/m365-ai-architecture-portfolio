# Sanitized automation samples
[Case study](../README.md)

These examples are newly generalized from the reviewed work. They preserve mapping, readiness, reconciliation, and explicit-connection patterns without publishing customer code or templates.

## Run offline
From the repository root, in PowerShell:

```powershell
$case = './case-studies/property-portfolio-dms'
& "$case/automation/New-ProvisioningPlan.ps1" -RequiredLibraries 'Operations','Finance' -ExistingLibraries 'Operations'
& "$case/automation/Test-Readiness.ps1" -SnapshotPath "$case/samples/readiness.sample.json"
& "$case/automation/New-MigrationPlan.ps1" -InventoryPath "$case/samples/inventory.sample.csv" -MappingPath "$case/samples/mapping.sample.csv"
& "$case/automation/Compare-Inventory.ps1" -SourcePath "$case/samples/source.sample.csv" -TargetPath "$case/samples/target.sample.csv"
& "$case/automation/Test-Samples.ps1"
```

Expected sample results: one existing-library validation and one create-then-validate plan; readiness true; two planned files; two matching inventory paths with zero missing/extra. These tiny fixtures are synthetic and do not reproduce the recorded production volumes.

| Script | Boundary |
| --- | --- |
| New-ProvisioningPlan | Plans library actions; applies nothing |
| Test-Readiness | Evaluates supplied observations; does not collect tenant state |
| New-MigrationPlan | Maps simple decoded source paths and rejects collisions |
| Compare-Inventory | Compares scoped relative paths; no metadata or version claims |
| ManagedIdentity-Connection.example | Defines an opt-in live connection function; no invocation on load |
| Test-Samples | Offline positive and failure-path checks |

The planner is deliberately bounded: it does not implement URL encoding, tenant inventory collection, conflict lookup, permissions, copy jobs, retries, or version handling. It is an employer-reviewable example, not a migration engine.

## Connection excerpt
The separate managed-identity function reflects the supplied runbook's explicit source and destination connections. Use only within an appropriately configured environment. [Official PnP connection documentation](https://pnp.github.io/powershell/cmdlets/Connect-PnPOnline.html) describes supported hosts and authentication options.

No live SharePoint call is needed for the offline examples or tests. Live integration has not been tested for this portfolio release.

## Data provenance
All files ending in `.sample.csv` or `.sample.json` are synthetic. [recorded-metrics.csv](../samples/recorded-metrics.csv) is an aggregate transcription from execution output; see [interpretation and limitations](../outcomes.md).
