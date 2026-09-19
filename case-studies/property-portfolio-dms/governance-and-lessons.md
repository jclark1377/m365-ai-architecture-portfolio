# Governance, confidentiality, and lessons
[Case study](README.md)

## Publication boundary
Only aggregate delivery metrics and generalized engineering patterns are public. Customer/property names, tenant domains, IDs, email addresses, resource names, internal document paths, raw logs, screenshots, templates, and credentials are excluded. Synthetic fixtures use anonymous labels and contain no customer documents.

The public scripts were rewritten for teaching and offline verification. They do not embed the customer's production implementation or its proprietary templates.

## Lessons from delivery
**Validate actual paths.** An assumed source folder returned no inventory. Discovering the real root resolved the issue; zero discovered files should not automatically mean success.

**Resolve library roots.** Display labels and storage URLs can differ. Mapping needs the actual destination root, not a URL guessed from a title.

**Published is not completed.** Provisioning jobs exposed missing commands and inaccessible asset paths. Runtime compatibility, installed modules, and deployment assets must be checked in the actual execution environment.

**Make exceptions first-class.** Historical user resolution and metadata comparison have different semantics. Report unresolved identity fields even when file reconciliation passes.

**Review validation-only behavior.** The supplied migration runbook could create a target folder before skipping copy/metadata operations. A name such as ValidationOnly is not sufficient evidence of a read-only execution path.

**Treat unknown lookup failures as failures.** A broad catch that assumes every lookup error means not-found can produce a misleading conflict-check pass.

**Check recovery boundaries.** Checkpoint-based resume can skip completed mutation stages, but partially completed stages need idempotent recovery. Revalidate destination state and reject stale configuration.

## Operational controls beyond the public sample
Establish least-privilege grants, private evidence retention, approved source freezes/delta handling, version/content/access validation, business-owner acceptance, and a source-retention/recovery plan. These are acceptance requirements and recommended controls; not all are evidenced as completed in the reviewed record.
