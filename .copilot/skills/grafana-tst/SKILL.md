---
name: grafana-tst
description: "Tools for interaction with grafana testing environment"
---

# Grafana Test Environment Skill

## Metadata
- **Skill Name**: grafana-tst
- **Trigger Tag**: `#grafana-tst`
- **MCP Server**: Grafana MCP Server (Test)
- **Category**: Monitoring (Test Environment)

## Description
Access Grafana test environment for metrics, dashboards, and monitoring data. Used for development, testing, and staging environment monitoring.

## Capabilities
- Query Prometheus metrics from test environment
- Access test dashboards
- Retrieve test alerts and notifications
- Analyze test environment performance

## Activation
Include `#grafana-tst` tag in your prompt to activate this skill.

## Usage Examples

### Metrics Query
```
#grafana-tst Show CPU usage for test-api service
```

### Combined with Web Search
```
#grafana-tst #fetch Check Prometheus metrics and compare with best practices
```

### Dashboard Analysis
```
#grafana-tst Analyze error rates in testing environment
```

## Configuration
MCP server is defined as `grafana-tst` in `mcp-config.json`.

## Environment Variables
Use environment variables defined in `.env`.

## Best Practices
- Use for test/staging environment monitoring only
- Never mix with #grafana-prd in same query
- Verify test environment before querying
- Use for development and testing workflows

## Limitations
- Test environment only - not for production data
- May have different retention policies than production
- Test data may not reflect production patterns
- Environment must be available and configured

## Environment Isolation
**CRITICAL**: Never use #grafana-tst and #grafana-prd in the same request. Choose one environment per query.
