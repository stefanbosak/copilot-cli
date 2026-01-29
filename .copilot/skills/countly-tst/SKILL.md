# Countly Test Environment Skill

## Metadata
- **Skill Name**: countly-tst
- **Trigger Tag**: `#countly-tst`
- **MCP Server**: Countly MCP Server (Test)
- **Category**: Analytics & Tracing (Test Environment)

## Description
Access Countly test environment for analytics, user behavior tracking, and application performance monitoring in test/staging environments.

## Capabilities
- Analyze test environment traces
- Track test user behavior patterns
- Monitor test application performance
- Debug test environment analytics

## Activation
Include `#countly-tst` tag in your prompt to activate this skill.

## Usage Examples

### Trace Analysis
```
#countly-tst Show request traces for test API endpoint
```

### Performance Monitoring
```
#countly-tst #fetch Analyze response times in staging
```

### User Behavior
```
#countly-tst Track user flows in test mobile app
```

## Configuration
Use `countly-tst` defined in `mcp-config.json`.

## Environment Variables
Use environment variables defined in `.env`.

## Best Practices
- Use for test/staging analytics and tracing
- Never mix with #countly-prd in same query
- Verify test environment before queries
- Use for development and testing workflows

## Limitations
- Test environment only - not production data
- Different data retention than production
- Test patterns may differ from production
- Environment must be configured and available

## Environment Isolation
**CRITICAL**: Never use #countly-tst and #countly-prd in the same request. Choose one environment per query.
