---
name: graylog-prd
description: "Tools for interaction with graylog production environment. Use when asked about log analysis, searching logs, or graylog in the production environment."
mcp-servers:
  graylog-prd:
    type: http
    url: https://graylog.prd.domain.tld/api/mcp
    headers:
      Authorization: "Basic ${GRAYLOG_PRD_TOKEN}"
    tools:
      - "*" 
---

Use the graylog-prd MCP server tools to search and analyze logs in the Graylog production environment.

Search logs, create streams, manage alerts. Use the #graylog-prd skill for detailed guidance.
