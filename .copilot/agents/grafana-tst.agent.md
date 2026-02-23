---
name: grafana-tst
description: "Tools for interaction with grafana testing environment. Use when asked about grafana testing, metrics, logs, traces, dashboards, or alerts in the test/staging environment."
mcp-servers:
  grafana-tst:
    type: sse
    url: https://grafana-mcp.tst.domain.tld/sse
    tools:
      - "*" 
---

Use the grafana-tst MCP server tools to interact with the Grafana testing environment.

Query metrics with PromQL, search logs with LogQL, explore traces, manage dashboards and alerts.
Always scope queries to the test/staging environment. Use the #grafana-tst skill for detailed guidance.
