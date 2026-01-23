# Graylog Production Environment Skill

## Metadata
- **Skill Name**: graylog-prd
- **Trigger Tag**: `#graylog-prd`
- **MCP Server**: Graylog MCP Server (Production)
- **Category**: Log Management (Production Environment)

## Description
Access Graylog production environment for live log analysis, incident investigation, and production debugging. Critical for production incident response and troubleshooting.

## Capabilities
- Search production logs in real-time
- Analyze production error patterns
- Investigate production incidents
- Track production system behavior

## Activation
Include `#graylog-prd` tag in your prompt to activate this skill.

## Usage Examples

### Incident Investigation
```
#graylog-prd Search for errors related to payment processing
```

### Real-time Analysis
```
#graylog-prd #fetch Analyze current error spike in production
```

### System Monitoring
```
#graylog-prd Show authentication failures in last 24 hours
```

## Configuration
Use `grafana-prd` defined in `mcp-config.json`.

## Environment Variables
Use environment variables defined in `.env`.

## Best Practices
- Use for production incident response
- Never mix with #graylog-tst in same query
- Verify environment connection before queries
- Handle production logs responsibly
- Use read-only access when possible

## Limitations
- Production environment - use with care
- May have rate limits
- Requires proper authentication
- Large queries may impact performance

## Environment Isolation
**CRITICAL**: Never use #graylog-prd and #graylog-tst in the same request. Choose one environment per query.
