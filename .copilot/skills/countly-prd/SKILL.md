# Countly Production Environment Skill

## Metadata
- **Skill Name**: countly-prd
- **Trigger Tag**: `#countly-prd`
- **MCP Server**: Countly MCP Server (Production)
- **Category**: Analytics & Tracing (Production Environment)

## Description
Access Countly production environment for live analytics, user behavior tracking, and application performance monitoring. Critical for production monitoring and user experience optimization.

## Capabilities
- Analyze production request traces
- Track real user behavior and journeys
- Monitor production application performance
- Investigate production performance issues

## Activation
Include `#countly-prd` tag in your prompt to activate this skill.

## Usage Examples

### Production Traces
```
#countly-prd Analyze slow request traces in production API
```

### User Analytics
```
#countly-prd #fetch Show user conversion funnel metrics
```

### Performance Investigation
```
#countly-prd Identify performance bottlenecks in checkout flow
```

## Configuration
Use `countly-prd` defined in `mcp-config.json`.

## Environment Variables
Use environment variables defined in `.env`.

## Best Practices
- Use for production analytics and monitoring
- Never mix with #countly-tst in same query
- Verify environment before queries
- Handle production data responsibly
- Use read-only access when possible

## Limitations
- Production environment - use with care
- May have API rate limits
- Requires proper authentication
- Large queries may impact performance

## Environment Isolation
**CRITICAL**: Never use #countly-prd and #countly-tst in the same request. Choose one environment per query.
