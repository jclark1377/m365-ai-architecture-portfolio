# Testing and troubleshooting
[Power Apps portfolio](README.md)

This is a **proposed acceptance and regression matrix**, not a completed test report. The published review checked documentation and source claims; the apps were not executed in a tenant.

## Acceptance matrix

| Area | Scenario | Expected evidence |
| --- | --- | --- |
| Engagement app | Required preparer empty | Validation blocks submission and identifies the field |
| Engagement app | Valid person selected, saved, reopened | Same authorized identity persists and displays |
| Engagement app | Newly added member | Membership and connector output checked; selection/save verified |
| Engagement app | Directory returns more than one page | Required population reachable; no silent truncation |
| Engagement app | Missing mail or connector failure | Clear recoverable error; no wrong identity saved |
| Engagement app | Existing preparer removed from group | Documented retain/reassign policy applied |
| Engagement app | Navigate all screens with incomplete values | All required sections validated; no lost input |
| All apps | List access denied or network interrupted | No false success; user input retained |
| All apps | Double click / concurrent events | Duplicate processing controlled and observable |
| Recognition | Approve | One approved post; publication result recorded |
| Recognition | Reject with comments | Private feedback; no public recognition post |
| Recognition | Long text, special characters, recipient mention | Readable output and correct mention in target Teams client |
| Recognition | Post succeeds but status update fails | Ambiguous delivery reconciled before retry |
| Tax intake | Create without assignee | Approved triage route or explicit exception; no false assignment claim |
| Tax intake | Assign/reassign and complete | Correct event-specific recipient and message |
| Tax intake | Zero, one, multiple categories | Correct typed storage and readable display |
| Tax intake | Person field in notification | Scalar display value; no serialized identity object |
| Tax intake | Removed/renamed retrieval action | Dependency validation catches broken expressions |
| Release | Promote to UAT | Correct lists/connections/destinations; no production side effects |
| Security | Requester attempts direct decision/status edit | Data/service permissions enforce authorized transitions |

Record the release, scenario, expected/actual result, role, sanitized evidence reference, defect, and retest outcome. Keep real IDs, identities, record content, and diagnostic payloads in the approved private evidence system.

## Observed issues and diagnostic method

### Group member absent from a preparer picker

**Observed:** source configuration used a group-backed ComboBox; the user reported a newly added member missing.

**Method:** verify the configured group and membership, inspect connector results, identify any local collection/cache, re-evaluate the data load, and check record shape and pagination. Distinguish a directory/connector result from a control-display problem. Do not assume republishing changes group membership.

**Status:** final successful visibility and save were not established.

### Empty recipient in tax notification

**Observed:** the email action received a null recipient and failed.

**Method:** inspect the event timing and person-field shape; define creation-versus-assignment routing; validate the resolved recipient before send. Retest both assigned and unassigned creation.

**Status:** correction and acceptance remain open.

### Invalid retrieval-action reference

**Observed:** a later flow validation message reported an invalid reference to a retrieval action.

**Method:** confirm action name, scope, and ordering; replace stale dynamic references; validate all consuming expressions.

**Status:** no later successful end-to-end run was reviewed.

### Person object printed as message text

**Observed:** a tax notification body contained a serialized person object.

**Method:** use the correct scalar property; separately validate routing and presentation; inspect a safe test output.

**Status:** revised output requires confirmation.

### Teams attribution and mention placement

**Observed:** recognition-workflow feedback requested changes to apparent post author and mention placement.

**Method:** verify connector posting mode, distinguish authenticated sender from nomination attribution, and test the rendered mention and full message.

**Status:** later presentation changes remain in testing.
