# TCC Core MCP
### Governed tools and enterprise knowledge for AI experiences
[Back to portfolio](../../README.md)

**Status:** Proposed reference architecture. Documentation only; no runnable server is included.

## Business problem
Enterprise assistants need useful knowledge and actions without creating an unrestricted route into business systems. TCC Core MCP proposes a reusable boundary for approved tools, permission-aware retrieval, and auditable workflow requests.

## Proposed scope
- Discover relevant documents from approved SharePoint knowledge collections.
- Retrieve authorized document excerpts with source references.
- Submit narrowly scoped workflow requests after human confirmation.
- Record tool name, decision, status, timestamp, and correlation identifier without logging document bodies or credentials.

## Request flow
1. The client authenticates through a validated identity flow.
2. The service validates the caller, tool entitlement, input schema, and allowed resource scope.
3. A retrieval adapter checks effective source permissions before returning any excerpt. If permission validation fails, return no content.
4. The client receives bounded results and citations; retrieved text is treated as data, never execution instructions.
5. A write request requires authorization and confirmation bound to the exact action, target, and parameters. Retries use an idempotency key.
6. Operational events are recorded with sensitive values removed.

MCP is the tool interface; authorization enforcement remains a separate implementation responsibility. Client support and transport choices are implementation decisions to validate.

## Proposed tool contracts
These names describe an intended interface, not implemented tools.

| Tool | Input | Output | Control |
| --- | --- | --- | --- |
| `search_knowledge` | Query, approved collection alias, bounded result limit | Authorized titles, excerpt references, relevance metadata | Filter before exposing content or metadata |
| `get_document_excerpt` | Opaque document reference, section | Authorized excerpt, source citation, version | Recheck access; enforce size limits |
| `request_workflow` | Approved workflow alias, validated fields, confirmation reference, idempotency key | Request reference and status | Verify approval and scope; reject duplicate execution |

Aliases resolve through server-managed configuration. The caller cannot supply arbitrary service endpoints or expand its own access scope.

## Validation scenarios
| Scenario | Expected behavior |
| --- | --- |
| A user requests a restricted document | No title, excerpt, citation, or existence leak |
| Source permissions are unavailable or stale | Deny retrieval until authorization can be established |
| A retrieved page asks the agent to bypass policy | Treat the instruction as untrusted content |
| A write has no valid confirmation | Reject before execution |
| An approved request is retried | Return the existing result without creating a duplicate |
| A connector times out | Return a bounded error and correlation reference |
| A tool response contains sensitive data | Apply approved minimization rules before disclosure |

## Implementation path
1. Define a synthetic knowledge collection and read-only tool schemas.
2. Implement identity propagation, source authorization, and redacted telemetry.
3. Test retrieval, denied access, injection attempts, and service failure.
4. Pilot a single approved workflow with confirmation and replay protection.
5. Publish deployment instructions and measured evaluation evidence.

Related: [Architecture](../../architecture/README.md) · [AI evaluation](../../copilot-ai/README.md) · [Governance](../../governance/README.md)
