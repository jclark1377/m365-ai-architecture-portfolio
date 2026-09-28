# Evidence-index verification — September 28, 2026

[Verification guide](verification-guide.md)

**Scope:** Public portfolio documentation and existing synthetic DMS samples. No production system was accessed by these checks.

| Check | Observed result |
| --- | --- |
| Runtime | PowerShell 7.6.5 on Windows |
| PowerShell syntax | All six DMS sample files parsed without errors |
| Offline sample suite | PASS: mapping, readiness, reconciliation, provisioning and rejection checks |

The executable suite is [Test-Samples.ps1](../case-studies/property-portfolio-dms/automation/Test-Samples.ps1). Its fixtures are synthetic. This run provides no new evidence of production volumes, identity resolution, metadata preservation or business acceptance.

The workflow added with this update makes the same sample checks available in GitHub Actions. Consult the actual workflow run for hosted status; the local result above is not a claim that hosted CI has passed.
