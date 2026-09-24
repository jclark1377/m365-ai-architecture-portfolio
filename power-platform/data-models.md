# SharePoint data models
[Power Apps portfolio](README.md)

These are **synthetic, minimal schemas for explaining the design**. Names, statuses, and added operational fields are illustrative. They are not list exports, exact internal names, or a complete representation of any employer schema.

## Audit Engagement Letter requests

| Example column | SharePoint type | Purpose and control |
| --- | --- | --- |
| Title | Single line of text | Human-readable request label; avoid confidential details in notifications |
| RequestReference | Single line of text, unique | Stable business correlation; generated through an agreed process |
| Preparer | Person, single value | Required assignment; group-backed selection demonstrated in reviewed app configuration |
| RequestStatus | Choice | Illustrative Draft, Submitted, Processing, Completed, Failed states |
| RequestNotes | Multiple lines of plain text | Request context; limit access and avoid copying into broad notifications |
| SubmittedAt | Date and time | Business submission timestamp, distinct from item creation |
| ProcessingKey | Single line of text | Correlates processing attempts without exposing flow identifiers |
| ProcessingOutcome | Choice | Separate Pending, Succeeded, Failed outcome |
| Created / Modified / Author / Editor | Built-in fields | Basic record provenance; not a substitute for a complete business audit trail |

The preparer behavior is observed. Other fields are recommended examples. A SharePoint Person field stores a structured identity, not only a display name. Verify field cardinality and existing-record defaults against the actual connector schema.

## Employee recognition

| Example column | Type | Purpose and control |
| --- | --- | --- |
| Title | Single line of text | Neutral nomination label |
| Nominee | Person, single value | Recognition recipient |
| RecognitionText | Multiple lines of plain text | Required narrative; encode for its output context |
| Decision | Choice | Pending, Approved, Rejected |
| ReviewComments | Multiple lines of plain text | Restricted decision feedback |
| PublicationStatus | Choice | NotReady, Pending, Published, Failed |
| PublishedAt | Date and time | Confirmed publication timestamp |
| PublicationKey | Single line of text | Duplicate-detection correlation |
| Author / Created | Built-in fields | Submission provenance |

Approval state must not be writable by an untrusted requester through direct list access. Hiding a Power Apps control is not authorization. Choose list/item permissions or a separately protected decision store according to scale and governance requirements.

## Tax-service intake

| Example column | Type | Purpose and control |
| --- | --- | --- |
| Title | Single line of text | Neutral request label |
| Contact | Person, single value | Business contact; use scalar properties in messages |
| Assignee | Person, single value | May be absent at creation; require before an assignment notification |
| ServiceCategories | Choice, multiple values | Store typed selections; derive display text separately |
| Urgency | Choice | Business-defined priority; do not invent response-time commitments |
| RequestNotes | Multiple lines of plain text | Restricted request context |
| Status | Choice | Illustrative New, Assigned, InProgress, Completed states |
| CompletedAt | Date and time | Completion event tracking |
| LastNotifiedState | Single line of text | Optional event guard; not by itself an atomic delivery guarantee |

## Relationships and operational constraints

Each request/nomination is a parent item. If stronger history is required, use a restricted event list keyed to the parent reference, with event type, previous/new state, actor, time, and processing outcome. This is an optional reference extension, not a claim about existing implementations.

Define column validation, required fields, list versioning, retention, ownership, and least-privilege access before rollout. Index fields used for operational filtering and validate query delegation with representative data volumes. Provision schema separately in each environment and record its version alongside the app/flow release.

SharePoint is an appropriate design candidate where Microsoft 365 lists and permissions meet requirements. Complex relational transactions or finer-grained authorization may justify another data platform; no such migration is claimed here.
