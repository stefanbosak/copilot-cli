---
name: graylog-tst
description: "Tools for interaction with graylog testing environment"
---

# Graylog Test Environment Skill

## Metadata
- **Skill Name**: graylog-tst
- **Trigger Tag**: `#graylog-tst`
- **MCP Server**: Graylog MCP Server (Test)
- **Category**: Log Management (Test Environment)

## Description
Access Graylog test environment for log analysis, search, and aggregation. Used for development and testing log analysis workflows.

## Capabilities
- Search and filter test environment logs
- Analyze log patterns and errors
- Aggregate log metrics
- Debug test environment issues

## Activation
Include `#graylog-tst` tag in your prompt to activate this skill.

## Usage Examples

### Log Search
```
#graylog-tst Search for authentication errors in last hour
```

### Combined Analysis
```
#graylog-tst #fetch Analyze error patterns in test logs
```

### Pattern Analysis
```
#graylog-tst Show top 10 error types in staging environment
```

## Configuration
MCP server is defined as `graylog-tst` in `mcp-config.json`.

## Environment Variables
Use environment variables defined in `.env`.

## Best Practices
- Use for test/staging environment log analysis
- Never mix with #graylog-prd in same query
- Verify test environment connectivity first
- Use for development and debugging

## Limitations
- Test environment only - not for production logs
- Different retention policies than production
- Test data may not match production patterns
- Environment must be available and configured

## Environment Isolation
**CRITICAL**: Never use #graylog-tst and #graylog-prd in the same request. Choose one environment per query.
