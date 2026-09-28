# Claim-to-evidence register

[Evidence portfolio](README.md)

Register reviewed September 28, 2026 against the existing public repository. This date is a documentation review date, not a production recertification. IDs identify claims and do not count deployed products.

| ID | Bounded claim | Public evidence and classification | Limit / next evidence needed |
| --- | --- | --- | --- |
| DMS-001 | Developed SharePoint provisioning, migration and reconciliation workflows; a bounded hotel pilot reported 1,305 source and target files with zero missing/extra files and processing errors. | [Outcomes](../case-studies/property-portfolio-dms/outcomes.md): historical aggregate. [Automation](../case-studies/property-portfolio-dms/automation/README.md): reproducible samples. | 22 historical user-field occurrences remained unresolved. Path reconciliation does not prove byte integrity, versions, permissions or owner acceptance. The roughly 115,000-file estate is broader scope, not completed pilot volume. |
| PP-001 | Reorganized a reported estate of 162 Power Automate flows with centralized ownership, Solutions and connection references; production continuity is reported. | [Contribution and scope](../power-platform/platform-ownership.md): reported experience. | No public before/after inventory or run-history comparison. Estate size is not the count of orphaned flows recovered. Next: publication-approved aggregate inventory and bounded continuity checks. |
| APP-001 | Built engagement-letter modernization using Power Apps, SharePoint and Power Automate; reported scope is approximately 65 fields and eight screens. | [App case study](../power-platform/audit-engagement-letter/README.md): reported experience and reviewed control configuration. [Formulas](../power-platform/power-fx-examples.md): reference examples. | Scope not recounted from an export. Final picker save, complete UAT, adoption and time savings not established. Next: synthetic save/reopen demonstration with expected and actual results. |
| FLOW-001 | Delivered recognition intake, approval/rejection feedback and Teams publishing work. | [Recognition](../power-platform/employee-recognition/README.md): documented implementation and test activity. | Later presentation acceptance remains open. Next: approved synthetic approval, rejection and duplicate-event run evidence. |
| FLOW-002 | Implemented tax-request intake and assignment/completion processing, with documented payload and routing troubleshooting. | [Tax intake](../power-platform/tax-service-intake/README.md): reviewed implementation and errors. | End-to-end acceptance remains open. Next: successful and failed routing cases with sensitive fields removed. |
| AI-001 | Production Copilot Studio help desk using SharePoint knowledge and automated ticket creation is reported. | [Career record](../case-studies/README.md): reported experience. [Evaluation plan](../copilot-ai/README.md): reference design. | No public runtime transcript or evaluated success rate. Next: synthetic grounded-answer, abstention and escalation demonstration. |
| ARCH-001 | Designed a proposed governed tool layer for enterprise AI access. | [TCC Core MCP](../mcp/tcc-core-mcp/README.md): reference design. | No runnable server or production deployment claim. Next: independently authored prototype and permission-boundary tests, if implemented. |

## Resume use

Link the evidence ID to the relevant public project when describing the same bounded contribution. Preserve qualifiers such as “reported,” “pilot,” and “reference design” where they affect interpretation. Do not turn a proposed test into a passed test or an estate-size figure into a completed migration count.

## Collection priorities

1. **DMS-001:** approved reconciliation summary with scope, run date, exclusions, metadata/identity exceptions and acceptance state.
2. **APP-001 / FLOW-001 / FLOW-002:** synthetic runtime demonstrations showing input, expected behavior, actual behavior and open failures.
3. **PP-001:** approved ownership-change aggregates and before/after execution checks without account or flow identifiers.
4. **AI-001:** safe demonstration transcript with grounded answers, missing-answer handling and ticket escalation.

These are missing-evidence tasks, not promises that the underlying material is already available. Production sources remain private until publication rights and sanitization are established.
