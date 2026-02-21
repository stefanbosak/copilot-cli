---
name: grafana-prd
description: "Tools for interaction with grafana production environment"
---

# Grafana Production Environment Skill

## Metadata
- **Skill Name**: grafana-prd
- **Trigger Tag**: `#grafana-prd`
- **MCP Server**: Grafana MCP Server (Production)
- **Category**: Monitoring (Production Environment)

## Description
Access Grafana production environment for live metrics, dashboards, and monitoring data. Used for production monitoring, incident response, and performance analysis.

## Capabilities
- Query Prometheus metrics from production
- Access production dashboards
- Retrieve production alerts and notifications
- Analyze production performance and incidents

## Activation
Include `#grafana-prd` tag in your prompt to activate this skill.

## Usage Examples

### Live Metrics
```
#grafana-prd Show current CPU usage for production API
```

### Incident Analysis
```
#grafana-prd #fetch Analyze error spike in last hour
```

### Performance Review
```
#grafana-prd Compare response times week-over-week
```

## Configuration
MCP server is defined as `grafana-prd` in `mcp-config.json`.

## Environment Variables
Use environment variables defined in `.env`.

## Best Practices
- Use for production monitoring and incident response
- Never mix with #grafana-tst in same query
- Verify production environment before querying
- Handle production data with care
- Use read-only tokens when possible

## Limitations
- Production environment - use responsibly
- May have rate limits
- Requires proper authentication and authorization
- Environment must be available

## Environment Isolation
**CRITICAL**: Never use #grafana-prd and #grafana-tst in the same request. Choose one environment per query.
