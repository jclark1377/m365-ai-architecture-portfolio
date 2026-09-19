# Migration lifecycle
[Case study](README.md)

| Stage | Activity | Evidence or release gate |
| --- | --- | --- |
| Discover | Enumerate actual source folders and business files | Confirm the root; an unexpectedly empty result is investigated |
| Map | Assign approved source roots to destination libraries | Unmapped content stays on hold |
| Provision | Apply site/library configuration and authorized remediation | Check required owners, hub association, and libraries |
| Validate | Read destination state independently | Readiness failures block execution |
| Dry run | Calculate paths beneath each property root | Planned counts, errors, and destination collisions reported |
| Pilot | Execute a bounded migration in the established runtime | Retain source; monitor job and per-file exceptions |
| Preserve metadata | Restore dates and resolve Author/Editor where possible | Track unresolved identities separately |
| Reconcile | Re-enumerate and compare relative paths | Missing, extra, and processing-error counts |
| Accept | Review metadata, identities, versions, access, and content | Business acceptance is separate from the runbook PASS |
| Expand | Release subsequent approved batches | Only after pilot review; keep recovery and change controls |

## Recorded sequence
The hotel migration processed 1,305 files with a matching destination count and zero missing/extra files. Subsequent routing into final DMS libraries had its own readiness checks and dry run: 13 ready routes, 1,305 planned, zero moved. These are separate stages, not two completed migrations.

Commercial readiness initially found owner and hub failures. Remediation was followed by a clean final validation. A later dry run planned 18,349 files without moving content. The first proposed production batch was 1,148 files; the reviewed record does not contain its completed production summary.

## Metadata and version handling
The supplied runbook restores Created and Modified and attempts destination-user resolution for Author and Editor. It reports unresolved user fields separately. Its metadata checks compare timestamps and, when resolved, display-name values. Unresolved identities are not equivalent to verified identity preservation.

Version-history preservation was a stated migration requirement. The supplied runbook does not enumerate and compare every historical version. Do not infer complete version preservation from its file count or metadata summary. Before expanding a production rollout, validate version counts and representative version contents, along with access and content integrity.

## Acceptance improvements identified during review
These are recommended refinements, not claims about the completed production run:

- Distinguish not-found from authorization, throttling, and other lookup errors.
- Make validation-only paths strictly read-only; the supplied runbook resolves the target folder before its validation-only branch.
- Separate file reconciliation, metadata validation, identity exceptions, and version-validation states.
- Record explicit exclusions. The supplied comparison filters platform Forms content and migration-pilot folders; it is a scoped business-file comparison.
- Keep sources recoverable until owner acceptance and a defined destination-change reconciliation procedure.

The offline samples model stricter failure reporting without attempting to replace the production migration engine.
