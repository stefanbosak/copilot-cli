---
name: graylog-prd
description: >
  Graylog production environment specialist for log search, aggregation, and analysis.
  Use when asked to: search logs, find errors, query streams, analyze log patterns,
  investigate failures, check log volumes in the production environment.
  Trigger keywords: graylog-prd.
  Do NOT use for testing environment logs (use graylog-tst instead).
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

# Graylog Production Environment

Search, aggregate, and analyze logs from the **production** Graylog instance.

## When to Use

- Searching for errors, warnings, or specific log messages in production
- Analyzing log patterns, volumes, or trends in the production environment

## When NOT to Use

- Testing logs -> use graylog-tst instead
- Non-log observability (metrics, traces) -> use grafana-prd instead

## Examples

```
graylog-prd find authentication errors in the last hour
graylog-prd show top 10 error types grouped by service in production
graylog-prd what streams are available in production environment
```
