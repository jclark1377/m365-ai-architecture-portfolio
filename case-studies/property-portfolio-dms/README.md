# Property portfolio SharePoint DMS
[Back to portfolio](../../README.md)

**Role:** Microsoft 365 architecture and automation delivery — Jonathan “Jay” Clark  
**Context:** Hospitality and commercial real estate; customer and property identities withheld.  
**Evidence cutoff:** September 18, 2026.

## Business problem
A legacy folder hierarchy needed to become a governed SharePoint document environment across hotel, commercial, and management-company contexts. Moving files alone would not establish usable destinations, trustworthy metadata, or a repeatable rollout process.

Jay developed provisioning and validation workflows, mapped source content to destination libraries, operated migration automation, and used reconciliation reports to expose exceptions before expanding the rollout.

## Delivery at a glance
| Workstream | Recorded state |
| --- | --- |
| Hotel pilot production migration | 1,305 files processed; source/target counts match; zero missing, extra, or processing errors |
| Metadata handling | 1,305 reported passes; zero reported reviews; 22 unresolved historical user-field occurrences |
| Hotel post-migration routing | 13 routes ready; 1,305 files planned in a separate routing dry run; zero moved |
| Commercial provisioning/readiness | Owners and hub association remediated; final readiness true with zero failures |
| Commercial migration planning | 18,349 files evaluated and planned with zero dry-run errors |
| Commercial production rollout | First batch prepared; no completed Commercial production result in the reviewed record |
| Power Apps provisioning control center | Planned design; implementation and deployment not evidenced |

## Design decisions
- Separate provisioning, readiness validation, migration execution, and reconciliation so that a successful creation step cannot stand in for migration acceptance.
- Use a hub-oriented information architecture with property sites and Commercial property libraries.
- Preserve the hierarchy below each mapped property root instead of recreating an unnecessary outer property folder.
- Use Azure Automation managed identity in the migration runbook, with explicit source and target connections.
- Restore Created and Modified metadata; attempt Author and Editor resolution and report historical-user exceptions.
- Retain a separate path-based reconciliation result, metadata result, and identity-exception count.
- Hold content without an approved destination outside migration scope.

## Explore the implementation
- [Solution architecture and tradeoffs](architecture.md)
- [Migration lifecycle and acceptance gates](migration-lifecycle.md)
- [Provisioning and readiness](provisioning.md)
- [Outcomes, metric definitions, and evidence limits](outcomes.md)
- [Planned Power Apps control center](provisioning-control-center.md)
- [Runnable offline samples and managed-identity excerpt](automation/README.md)
- [Skills and resume bullets](skills.md)
- [Governance and lessons learned](governance-and-lessons.md)

Public artifacts retain the engineering decisions and aggregate results while excluding customer configuration, document names, historical users, production templates, and raw logs.
