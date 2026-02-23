---
name: postgres
description: "Tools for interaction with postgres sandbox environment. Use when asked to query, analyze, or manage the PostgreSQL sandbox database."
mcp-servers:
  postgres:
    type: local
    command: /usr/local/bin/toolbox
    args:
      - --stdio
      - --tools-file
      - /usr/local/bin/tools.yaml
    env:
      POSTGRES_HOST: "${POSTGRES_HOST}"
      POSTGRES_PORT: "${POSTGRES_PORT}"
      POSTGRES_DATABASE: "${POSTGRES_DATABASE}"
      POSTGRES_USER: "${POSTGRES_USER}"
      POSTGRES_PASSWORD: "${POSTGRES_PASSWORD}"
    tools:
      - "*" 
---

Use the postgres MCP server tools to interact with the PostgreSQL sandbox database.

Run SQL queries, inspect schemas, analyze data. Use the #postgres skill for detailed guidance.
