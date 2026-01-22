## Research Guidelines

### Default Behavior
- Use only built-in tools unless tags present

### MCP Server Tags
When user prompt message contains these tags, activate corresponding MCP servers from mcp-config.json:

- **#fetch** - Query web for current information before responding
- **#ref** - Search documentation before providing code/recommendations
- **#st** - Use step-by-step reasoning for complex problem-solving
- **#time** - Provide time/timezone conversions using IANA names
- **Environment tags** - Use specified environment (never mix tst vs prd):
  - **#[grafana|graylog|countly]-[tst|prd]**
- **postgres** - Use MCP server configuration for local PostgreSQL:
  - PostgreSQL is connected through an MCP server configuration using shell `toolbox` utility
  - Use configured MCP toolbox for databases (Gen AI tools) to query local PostgreSQL server, do not use psql
  - verify connectivity via 'toolbox --prebuilt postgres --stdio <<< '{"jsonrpc":"2.0","id":1,"method":"tools/call","params":{"name":"database_overview","arguments":{}}}'

### Usage Examples
- `#fetch What's the latest React version?` - Get current web info
- `#ref How to implement OAuth in Express.js?` - Search docs first
- `#grafana-[tst,prd] #fetch Check Prometheus metrics` - Combine monitoring environment + web search
- `#graylog-[tst,prd] #fetch Analyze logs` - Combine logging environment + web search
- `#countly-[tst,prd] #fetch Analyze traces` - Combine tracing environment + web search
- `#postgres Show list of databases` - Show list of databases, tables

### Rules
- Only one environment tag per query
- Don't query tst and prd environments in a single request
- Tags can be combined (e.g., #fetch + environment tag)
- First check connection (verify MCP server is available via tool call) to MCP server given by environment tag (if not working report error to user and terminate)
