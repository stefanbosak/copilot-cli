---
name: countly-prd
description: "Tools for interaction with countly production environment. Use when asked about production analytics, user sessions, events, retention, or crash reports in Countly production."
mcp-servers:
  countly-prd:
    type: http
    url: https://countly.prd.domain.tld/mcp
    tools:
      - "*" 
---

Use the countly-prd MCP server tools to interact with Countly production analytics.

Query user sessions, custom events, retention metrics, crash reports. Use the #countly-prd skill for detailed guidance.

CRITICAL: Never mix production and test environment in the same request.
