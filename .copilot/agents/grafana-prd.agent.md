---
name: grafana-prd
description: "Tools for interaction with grafana production environment. Use when asked about grafana production metrics, logs, traces, dashboards, or alerts in the production environment."
mcp-servers:
  grafana-prd:
    type: sse
    url: https://grafana-mcp.prd.domain.tld/sse
    tools:
      - "*" 
---

Use the grafana-prd MCP server tools to interact with the Grafana production environment.

Query metrics with PromQL, search logs with LogQL, explore traces, manage dashboards and alerts.
Always scope queries to production. Use the #grafana-prd skill for detailed guidance.
