# Governance & Operational Controls
[Back to portfolio](../README.md)

## Control ownership
| Area | Baseline design control | Accountable role |
| --- | --- | --- |
| Identity | Least privilege, scoped access, periodic review | Identity owner |
| Information | Classification, retention, approved sharing | Data owner |
| Automation | Approved connectors, environment separation, release evidence | Platform owner |
| AI | Authorized sources, evaluation, escalation, action confirmation | AI service owner |
| Operations | Redacted telemetry, alerts, incident and recovery procedures | Service owner |

Assign actual owners and approval criteria during discovery. These are design controls, not a certification or compliance attestation.

## Public artifact review
Before publishing any addition:
- Replace customer and employee identities with synthetic examples.
- Remove credentials, tokens, tenant and subscription identifiers, private endpoints, and internal hostnames.
- Review screenshots, file metadata, exports, logs, and document history.
- Confirm that diagrams do not disclose confidential topology or security details.
- Publish measured outcomes only when evidence and publication permission exist.

## Change and incident handling
Record the change purpose, affected data and users, approval, validation, and recovery plan. For a suspected exposure, stop the affected access path, preserve appropriate evidence, involve the responsible owner, and follow the organization's incident process. Rotate exposed credentials through the approved process; deleting a repository file alone does not remove its history.

Related: [Architecture delivery gates](../architecture/README.md) · [Case-study evidence](../case-studies/README.md)
