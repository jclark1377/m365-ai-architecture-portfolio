# Power Platform
[Back to portfolio](../README.md)

**Reference scenario:** Governed business intake and approval using Power Apps, Power Automate, and an approved data store.

## Workflow design
1. Capture a request with required fields, validation, and a unique request reference.
2. Route by approved business rules to the accountable reviewer.
3. Record approval or rejection with timestamp and reviewer identity.
4. Execute the approved operation through a scoped connection.
5. Notify the requester and retain the decision trail according to policy.

Model explicit states: Draft → Submitted → In review → Approved or Rejected → Completed or Failed. An approval is not evidence that execution succeeded.

## Reliability
- Use idempotency checks before side effects.
- Bound retries and route exhausted failures to a monitored exception queue.
- Revalidate state before execution to prevent stale approvals or duplicate processing.
- Define an escalation path for overdue reviews and disabled connection owners.
- Minimize personal data in notifications and run-history access.

## Release and operation
Separate development, test, and production. Package flows and apps in solutions where supported; externalize configuration through environment variables and connection references. Apply connector data policies and least-privilege access.

Require test evidence for rejection, duplicate submission, timeout, and failed execution. Assign a service owner, review connection health, and document rollback or compensating actions before release.

Related: [TCC Core MCP workflow boundary](../mcp/tcc-core-mcp/README.md) · [Governance](../governance/README.md)
