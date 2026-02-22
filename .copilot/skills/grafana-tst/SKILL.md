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
Access Grafana test/staging environment for observability data. Covers metrics (Prometheus), logs (Loki), traces (Tempo), profiling (Pyroscope), incident management, OnCall schedules, Sift investigations, alerting, and dashboard management. Use for development, testing, and staging workflows.

## Capabilities

### Metrics (Prometheus)
- Query PromQL against test Prometheus datasources
- List metric names, label names, label values, and metadata
- Query histograms and percentiles

### Logs (Loki)
- Execute LogQL queries for test log retrieval
- List log label names and values
- Query log patterns and statistics
- Stream log data with filtering and parsing

### Traces (Tempo)
- Find slow requests in test environment
- Analyze distributed traces

### Profiling (Pyroscope)
- Fetch CPU, memory, goroutine profiles for test services
- List profile types and label values per service

### Incidents & OnCall
- Create, list, and get incident details
- Add timeline notes to incidents
- List OnCall schedules, teams, users
- Get current on-call users for a schedule

### Sift Investigations
- Create and retrieve automated investigations
- Find error patterns in logs
- Find slow requests across services

### Alerting
- List, get, create, update, delete alert rules
- List contact points and notification policies
- List alert groups from OnCall

### Dashboards
- Search, get, create, update dashboards
- Get panel queries and dashboard summaries
- Generate deeplinks to dashboards or panels
- Render panel/dashboard images (PNG)
- Create and manage annotations

### Datasources
- List, get datasources by name or UID

## Activation
Include `#grafana-tst` tag in your prompt to activate this skill.

## Usage Examples

### Test Metrics
```
#grafana-tst Show CPU usage for test-api service in staging
```

### Log Investigation
```
#grafana-tst Search Loki logs for errors in auth service last 1 hour
```

### Dashboard Editing
```
#grafana-tst Add a new panel to the staging overview dashboard
```

### Alert Testing
```
#grafana-tst Create a test alert rule for high memory usage
```

### Trace Analysis
```
#grafana-tst Find slow requests for checkout service in test environment
```

## Configuration
MCP server is defined as `grafana-tst` in `mcp-config.json`.

## Environment Variables
Use environment variables defined in `.env`.

## Best Practices
- Use `list_datasources` first to find correct datasource UIDs before querying
- Use `list_prometheus_metric_names` before writing PromQL
- Use `list_loki_label_names` / `list_loki_label_values` before writing LogQL
- Use `query_loki_stats` to check log volume before fetching entries
- Use `get_dashboard_summary` instead of `get_dashboard_by_uid` for large dashboards
- Never mix with `#grafana-prd` in the same request

## Limitations
- Test environment only — data does not reflect production
- Different data retention policies than production
- Write operations (create/update alerts, incidents) require appropriate permissions
- Image rendering requires Grafana Image Renderer service

## Environment Isolation
**CRITICAL**: Never use `#grafana-tst` and `#grafana-prd` in the same request. Choose one environment per query.
