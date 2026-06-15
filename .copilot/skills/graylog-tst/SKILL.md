---
name: graylog-tst
description: >
  Graylog test environment specialist for log search, aggregation, and analysis.
  Use when asked to: search logs, find errors, query streams, analyze log patterns,
  investigate test run failures, debug staging issues, or check log volumes in the
  test or staging environment.
  Trigger keywords: graylog-tst.
  Do NOT use for production environment logs (use graylog-prd instead).
---

> ## CRITICAL: MANDATORY OUTPUT RULE - MUST BE FOLLOWED ON EVERY RESPONSE
>
> **Every prompt result MUST follow this exact sequence:**
> 1. **COLLECT** - execute the query / retrieve the data and read the full output
> 2. **SAVE** - write the **full result** to a file under `/workspace/<topic>_<timestamp>.md`
> 3. **REPLY** - only then reply to the user, referencing the saved file path
>
> **This rule applies to every execution path, with no exceptions** - including normal replies,
> skill outputs, agent or sub-agent outputs, errors, and empty results.
>
> **NEVER send a reply before the saved file already exists in `/workspace`.**
> **NEVER save using any filename that does not match `/workspace/<topic>_<timestamp>.md`.**
> The collect, save, and reply steps must happen in the same turn.

# Graylog Test Environment

Search, aggregate, and analyze logs from the **test/staging** Graylog instance.
Delegates to the `graylog-tst` agent which handles authentication and all MCP tooling.

## When to Use

- Searching for errors, warnings, or specific log messages in test/staging
- Investigating test run failures or deployment issues
- Analyzing log patterns, volumes, or trends in the test environment

## When NOT to Use

- Production logs → use `graylog-prd` instead
- Non-log observability (metrics, traces) → use `grafana-tst` instead

## Examples

```
graylog-tst find authentication errors in the last hour
graylog-tst show top 10 error types grouped by service in staging
graylog-tst analyze log patterns for failed test runs today
graylog-tst what streams are available in test environment
```
