# Power Automate integration
[Power Apps portfolio](README.md)

These are **recommended integration contracts** informed by documented project work. They are not exported definitions or proof of production deployment.

## Request persistence and event boundaries

1. Power Apps validates and saves the request.
2. Processing starts from an intentional event: a SharePoint trigger or a documented app-to-flow call after successful save. Avoid enabling both for the same side effect.
3. The flow loads the current item and validates permissions, required values, status, and routing.
4. The flow executes only the action appropriate to that event.
5. It records an outcome and exposes a safe status to the requester.
6. Failures enter a monitored exception process with bounded retries.

For engagement letters, the exact production trigger and downstream actions were not supplied. For recognition, approval and publication are distinct stages. For tax intake, creation, assignment, and completion need distinct conditions and messages.

## Recipient contract

A creation event can legitimately occur before assignment. Define an approved triage recipient or another business-approved route for that condition. An assignment event requires a valid assignee. A completion event uses the approved requester/contact rule.

Validate that the resolved recipient is nonempty before sending. If it is missing, record a routing exception rather than guessing or silently dropping the message. The reviewed tax-intake payload contained a null recipient; later evidence also showed an invalid action reference. Both cases belong in regression testing.

Ensure every expression refers to an action that actually exists and is accessible in the flow's branch/scope. After renaming or replacing a retrieval action, check its consumers before running the flow.

## Data shaping

For a synthetic multi-choice array such as `[{"Value":"Category A"},{"Value":"Category B"}]`, use a Select action in text mode to extract each `Value`, then join the resulting strings for display:

```text
join(body('SelectCategoryValues'), ', ')
```

This expression assumes that the named Select action exists and returns strings. Confirm the real connector payload before adapting it. Handle empty arrays explicitly.

Keep the original typed selection for writes. A comma-separated display string is not a substitute for a multi-choice array. For a Person field, use the intended display-name property for presentation, and an authorized identity property for routing. Do not inject an entire person object into an email.

Encode user content for the output format. Plain text, email HTML, and Teams message payloads have different requirements. Do not publish private review comments to a recognition channel.

## Approval, publication, and retries

For recognition, a recorded approval permits a publication attempt; it does not establish that a message was posted. Track publication separately and define a stable event key.

A read-then-write status check alone is not an atomic duplicate guard. Choose serialization, concurrency-aware writes, or a durable unique-key claim appropriate to the workload. Test two near-simultaneous events.

External message delivery and a SharePoint state update are not one transaction. If posting succeeds but the outcome write fails, an automatic retry can duplicate the message. Retain the returned message reference privately when available, reconcile ambiguous attempts, and require operator review when delivery is uncertain.

## Ownership and support

Use approved connection ownership, least-privilege permissions, monitored failures, and a named support role. Keep recipients, destinations, and routing configuration environment-specific. Limit access to run history, which can contain sensitive input and output. See [ALM and operations](alm-and-operations.md).
