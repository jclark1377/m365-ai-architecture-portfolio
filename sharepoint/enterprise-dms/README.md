# SharePoint Enterprise Document Management
[Back to portfolio](../../README.md)

**Artifact type:** Generalized reference design and migration runbook.

## Information architecture
Organize sites around durable ownership and access boundaries. Use libraries for document collections with shared lifecycle requirements; use metadata for classification and discovery.

| Field | Purpose |
| --- | --- |
| Document type | Policy, procedure, working document, or record |
| Business function | Owning function and navigation context |
| Document owner | Accountable role for review and lifecycle |
| Lifecycle status | Draft, review, approved, or retired |
| Review date | Next scheduled content review |
| Classification | Organization-approved sensitivity category |

Prefer managed groups over individual grants. Document exceptions, external sharing decisions, retention requirements, and the review cadence with the responsible owners.

## Migration runbook
1. **Discover:** Inventory sources, sizes, file types, permissions, versions, dependencies, and retention constraints.
2. **Map:** Agree destination sites, libraries, metadata, ownership, and access mappings.
3. **Remediate:** Resolve unsupported items and duplicates; obtain owner approval before excluding content.
4. **Pilot:** Migrate representative content and validate counts, samples, metadata, permissions, and links.
5. **Cut over:** Agree the change window, source freeze, final delta, reconciliation, and user communications.
6. **Stabilize:** Triage exceptions, obtain owner acceptance, and retain the approved recovery option until closure.

## Acceptance and recovery
Require reconciliation of expected and migrated items, documented exceptions, user access tests, and owner sign-off. Before cutover, agree rollback triggers, the source reopening procedure, and how to reconcile changes made at the destination. Archive or retire sources only after explicit acceptance and retention review.

Related: [AI knowledge readiness](../../copilot-ai/README.md) · [Governance](../../governance/README.md)
