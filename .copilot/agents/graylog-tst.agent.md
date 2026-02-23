---
name: graylog-tst
description: "Tools for interaction with graylog testing environment. Use when asked about log analysis, searching logs, or graylog in the test/staging environment."
mcp-servers:
  graylog-tst:
    type: http
    url: https://graylog.tst.domain.tld/api/mcp
    headers:
      Authorization: "Basic ${GRAYLOG_TST_TOKEN}"
    tools:
      - "*" 
---

Use the graylog-tst MCP server tools to search and analyze logs in the Graylog testing environment.

Search logs, create streams, manage alerts. Use the #graylog-tst skill for detailed guidance.
