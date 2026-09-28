# Verify the public engineering samples

[Evidence portfolio](README.md) · [DMS sample boundaries](../case-studies/property-portfolio-dms/automation/README.md)

## Run locally

From the repository root in PowerShell 7:

```powershell
& ./case-studies/property-portfolio-dms/automation/Test-Samples.ps1
```

Expected final output:

```text
PASS: offline mapping, readiness, reconciliation, provisioning, and rejection checks.
```

The suite uses synthetic fixtures and temporary files. It does not connect to SharePoint or modify a tenant. Read the scripts before execution; the suite removes only its own temporary fixture directory when finished.

## What the checks establish

| Scenario | Expected result |
| --- | --- |
| Two mapped synthetic files | Correct destination hierarchy and two plan entries |
| Complete readiness snapshot | MigrationReady true |
| Missing readiness observations | Readiness blocked with four failures |
| Matching relative paths | File reconciliation PASS |
| Equal counts but different paths | One missing and one extra file detected |
| Sibling-root prefix collision | Rejected |
| Parent traversal | Rejected |
| Duplicate destination | Rejected |
| Existing versus absent library | Validate-existing versus create-then-validate planning |

This establishes behavior of the public sample at the tested revision. It does not establish successful production migration, byte-level integrity, full version preservation, effective access, or business acceptance.

## Automated verification

The [portfolio checks workflow](../.github/workflows/portfolio-checks.yml) parses the public PowerShell files and runs this suite on pushes and pull requests. View [GitHub Actions runs](https://github.com/jclark1377/m365-ai-architecture-portfolio/actions/workflows/portfolio-checks.yml) for the actual status and commit associated with each run. Workflow configuration alone is not a passing result.

The [local verification record](validation-2026-09-28.md) documents the checks performed while adding this evidence index.
