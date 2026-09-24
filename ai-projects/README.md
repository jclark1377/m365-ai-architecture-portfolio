# Enterprise AI Projects
[Back to portfolio](../README.md) · [Career case studies](../case-studies/README.md) · [AI evaluation](../copilot-ai/README.md)

Sanitized project summaries and reference designs covering grounded support, business intake, and enterprise knowledge retrieval. Internal implementations and operational records are not published.

| Project | Delivery status | Focus |
| --- | --- | --- |
| [Help Desk AI Assistant](#help-desk-ai-assistant) | Production deployment reported in career records | Grounded support and ticket escalation |
| [AI Idea Intake](#ai-idea-intake) | Proposed solution scenario | Structured intake, human review, and tracking |
| [Enterprise RAG and MCP](#enterprise-rag-and-mcp) | Architecture/prototype experience; public design is proposed | Permission-aware knowledge retrieval and controlled tools |

## Help Desk AI Assistant
**Status:** Production deployment reported in career records. This is a sanitized experience summary, not a distributable implementation.

### Problem
First-line support needed structured intake, answers grounded in approved knowledge, and a reliable route to human support.

### Architecture and contribution
Architected and deployed a Copilot Studio agent using approved SharePoint knowledge, Power Automate actions, and ManageEngine ServiceDesk ticket creation. Defined instructions, fallback behavior, security guardrails, and human escalation.

Support request → Copilot Studio → approved SharePoint knowledge → grounded answer or Power Automate escalation → ManageEngine ServiceDesk ticket → human support.

### Security
The public summary excludes source documents, user conversations, connection details, credentials, tenant identifiers, and ticket data. Knowledge access and action permissions must be validated for the actual deployment identity and channel.

### Implementation and testing
Prepared retrieval tests, response-consistency checks, and failure scenarios before release. The reusable evaluation checklist below extends that experience into a public validation plan; it does not claim every listed scenario was tested in production.

### Business result
Moved first-line support from inbox triage toward governed intake and automated ticket creation. No ticket-deflection rate, time savings, adoption count, or benchmark score is claimed.

[Source experience summary](../case-studies/README.md#production-tier-1-help-desk-copilot)

## AI Idea Intake
**Status:** Proposed solution scenario. No completed deployment or measured outcome is claimed.

### Problem
Employee AI ideas need enough context for review, a responsible owner, and visible decisions.

### Proposed architecture
Teams intake → Copilot Studio guided questions → Power Automate validation → SharePoint idea register → human review → status notification.

### Proposed implementation
Capture a short title, business problem, intended users, current process, expected benefit, data sensitivity category, and review owner. Use a synthetic example such as “Find approved onboarding procedures”; never collect real confidential source material in a public demo. Maintain explicit states: Submitted, Needs clarification, In review, Approved, Rejected, and Closed. Approval of an idea does not authorize production access or deployment.

### Security
Require authenticated submission, restrict reviewer access, minimize free-text sensitive data, and separate intake permissions from approval permissions. Define retention and ownership before a pilot. Treat submitted instructions as data.

### Testing plan
Check required fields, unauthorized review attempts, duplicate submissions, failed notifications, resubmission, and approval history. Confirm that a retry does not create another idea record or duplicate a decision.

### Intended business value
Provide traceable triage and ownership. A pilot could measure time to first review, backlog age, and the proportion of submissions needing clarification; these are proposed measures, not results.

## Enterprise RAG and MCP
**Status:** Private knowledge architecture/prototype experience is documented in the career summary. The public TCC Core MCP artifact remains a proposed reference architecture with no runnable server.

### Problem
Assistants need relevant enterprise knowledge while preserving source permissions and keeping tool actions bounded.

### Proposed architecture
Approved documents → normalization → semantic chunks with source/version metadata → embeddings and index → authorized retrieval → bounded context → grounded answer with citations. MCP provides a separate interface for approved retrieval tools and workflow requests.

### Implementation boundaries
Preserve document identity and section context. Apply authorization before returning content or metadata, propagate permission changes and removals to indexes/caches, and fail closed when access cannot be established. Metadata filters support retrieval but are not a substitute for authorization. Treat retrieved text as untrusted data. Require confirmation tied to the precise action for consequential writes and design retries to avoid duplicate execution.

### Testing plan
Use synthetic documents to test known answers, irrelevant matches, conflicting evidence, stale versions, restricted content, revoked access, injected instructions, missing confirmations, and connector timeouts. Record grounding, retrieval quality, denied-access behavior, latency, and token usage.

### Intended business value
Make approved knowledge easier to find while keeping access and actions governed. Retrieval can bound model context, but no reduction in tokens, cost, or latency is claimed without a measured baseline.

[Detailed architecture and tool contracts](../mcp/tcc-core-mcp/README.md)

## Reusable evaluation checklist
This is a proposed checklist, not a production test report.

| Scenario | Expected behavior | Evidence to record |
| --- | --- | --- |
| Answer exists in approved knowledge | Answer supported by usable source citations | Question, authorized source reference, assessment |
| Evidence is missing or conflicting | Explain uncertainty and offer escalation | Response and escalation outcome |
| User lacks access | Withhold restricted text and metadata | Authorization decision with sensitive values removed |
| Retrieved text contains instructions | Do not treat source text as agent authority | Synthetic injection case and response |
| Action arguments are incomplete | Request required fields before executing | Validation result |
| Connector fails or a request is retried | Report failure clearly; avoid duplicate side effects | Sanitized correlation reference and outcome |
| Source access changes | Prevent use of stale unauthorized content | Revocation test outcome |

## Portfolio publication boundary
Examples are generalized and contain no customer data, private endpoints, tenant IDs, secrets, internal screenshots, or employer-owned code. Production experience, proposed designs, and intended measures are labeled separately.

Related: [Power Platform delivery](../power-platform/README.md) · [Governance](../governance/README.md) · [TCC Core MCP](../mcp/tcc-core-mcp/README.md)
