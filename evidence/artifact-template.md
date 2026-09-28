# Evidence artifact template

[Evidence portfolio](README.md)

Use one record per artifact. Replace every bracketed placeholder before publishing; keep unavailable evidence marked unavailable.

```markdown
# [Evidence ID] — [Artifact title]

Artifact type: [reported experience / reviewed implementation / historical aggregate / reproducible sample / reference design]
Project: [relative link]
Public artifact: [relative link]
Evidence date: [date of the actual observation]
Revision or run: [public commit or sanitized run alias]
Contribution: [what Jonathan personally designed, implemented, tested or operated]

## Claim and scope
[One bounded claim; identify population, exclusions and measurement period.]

## Method
[Inputs, prerequisite state, steps, expected outcome, measurement definition.]

## Observation
[Actual outcome, including failures. Use “not executed” for a proposed test.]

## Limits
[What this artifact cannot establish; unresolved exceptions; acceptance status.]

## Publication provenance
[Original, generalized, synthetic or aggregate transcription.]
[Confirm publication rights and review of identities, credentials, endpoints,
document content, screenshots, filenames and embedded metadata.]
```

A recreation must visibly say **“Recreated demonstration using non-production data.”** Keep it separate from historical execution evidence. Do not include private source links or upload raw employer/client records to the repository to establish provenance.
