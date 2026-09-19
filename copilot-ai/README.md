# Copilot Studio, AI & RAG
[Back to portfolio](../README.md)

**Artifact type:** Proposed delivery and evaluation pattern.

## Knowledge-to-answer flow
Curate approved sources → validate access → retrieve relevant passages → generate a grounded answer → expose usable citations → collect feedback.

For Copilot Studio, define the agent's audience, supported tasks, approved knowledge sources, allowed actions, and escalation route. Validate the selected channel and identity model in the target environment before connecting business data.

## Knowledge readiness
- Name a content owner and review stale, duplicated, or conflicting material.
- Preserve document identity, version, and section context during ingestion.
- Enforce source permissions before retrieval content reaches the model.
- Propagate removals and permission changes into indexes and caches.
- Abstain when evidence is missing or contradictory.

## Evaluation plan
Build a synthetic or publication-approved question set covering factual lookup, ambiguous requests, missing answers, restricted documents, and malicious instructions embedded in content.

| Dimension | Evidence to collect |
| --- | --- |
| Grounding | Whether cited passages support the answer |
| Retrieval | Whether expected authorized sources were found |
| Access control | Whether restricted content and metadata were withheld |
| Action safety | Whether missing approval or invalid arguments blocked execution |
| Experience | Completion rate, escalation reasons, and user feedback |
| Operations | Latency, failure rate, and cost per evaluated request |

Agree acceptance thresholds before the pilot. This portfolio does not claim benchmark scores or measured production outcomes.

Related: [TCC Core MCP](../mcp/tcc-core-mcp/README.md) · [Enterprise DMS](../sharepoint/enterprise-dms/README.md)
