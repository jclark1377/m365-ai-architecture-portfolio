# DEV → UAT → PROD and operations
[Power Apps portfolio](README.md)

**Documented platform experience:** migration of 162 flows to centralized governance, Solutions, and connection references is reported in the existing portfolio.

**Reference delivery approach below:** a recommended implementation plan for these apps. App-specific release histories and completed UAT sign-offs were not provided.

## Environment strategy

| Stage | Build and configuration | Exit evidence |
| --- | --- | --- |
| DEV | Develop solution-aware components in an unmanaged solution where supported; use synthetic data and development connections | Requirements mapped to controls, schema version, peer review, local scenario results |
| UAT | Import the managed build artifact where supported; bind UAT connections and configuration; use dedicated lists and notification destinations | Business acceptance, access tests, failure/retry tests, regression results |
| PROD | Promote the approved artifact; bind approved production settings; restrict editing and confirm ownership | Release record, smoke test, monitoring, support handoff and recovery plan |

Use managed solution artifacts for downstream environments where the component supports that lifecycle. Do not presume that a SharePoint-customized form has the same packaging and promotion behavior as a standalone solution-aware canvas app: identify the app type and verify its supported deployment path before planning the release. [Microsoft solution concepts](https://learn.microsoft.com/en-us/power-platform/alm/solution-concepts-alm)

## Configuration and external dependencies

Connection references identify which connection a component uses; environment variables provide configurable values. A SharePoint connection does not itself choose the correct site and list. Bind and verify the required data-source environment variables and other settings at deployment. [Microsoft environment-variable guidance](https://learn.microsoft.com/en-us/power-apps/maker/data-platform/environmentvariables)

Treat SharePoint columns, views, permissions, versioning, and data as separately provisioned dependencies. A solution import is not proof that those lists or their data were migrated.

The private release inventory should record app/flow versions, schema version, configuration names, connector policies, connection owner, support owner, and rollback prerequisites. Public documentation must not contain live values.

## Release gates

1. Confirm app type, supported packaging, dependencies, licensing, connector policy, and environment access.
2. Provision and validate target SharePoint schema and permissions.
3. Import the approved version; bind connection references and environment values.
4. Verify destinations before enabling notification-producing flows.
5. Test with representative business roles and synthetic records.
6. Confirm save, routing, errors, and a downstream success outcome.
7. Record business acceptance and enable production processing through the approved release process.

Use a distinct UAT destination so tests cannot send real business notifications. An app share does not automatically establish all required data access.

## Recovery and operations

Retain the previous approved artifact and documented configuration. Select a supported rollback or forward-fix procedure for the component and release; do not assume uninstalling a managed solution is safe or that importing an older version is always supported. Assess schema/data compatibility before restoring application versions.

Application rollback does not retract emails or Teams posts and does not reverse business decisions. Record compensating actions separately. Pause affected triggers during incident recovery where appropriate and reconcile pending/ambiguous events before resuming.

Monitor connection health, failed runs, aged requests, unresolved routing exceptions, and repeated processing keys. Define support ownership, periodic access reviews, and what evidence an operator needs to distinguish an app save failure from a downstream processing failure.
