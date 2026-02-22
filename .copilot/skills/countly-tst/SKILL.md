---
name: countly-tst
description: "Tools for interaction with countly testing environment"
---

# Countly Test Environment Skill

## Metadata
- **Skill Name**: countly-tst
- **Trigger Tag**: `#countly-tst`
- **MCP Server**: Countly MCP Server (Test)
- **Category**: Product Analytics (Test Environment)

## Description
Access Countly test/staging environment for product analytics, user behavior tracking, crash reporting, and application performance monitoring. Use for validating analytics instrumentation, testing event tracking, and debugging analytics flows before production release.

## Capabilities
- Analyze test/staging user sessions (counts, durations, frequency)
- Track and validate custom event data (event counts, segmentation, funnels)
- Monitor retention metrics in test environment
- Investigate crash reports and error traces from test builds
- Analyze user journeys and navigation flows in test apps
- Monitor test application performance
- Segment users by demographics, device, OS, app version
- Verify analytics instrumentation is working correctly

## Activation
Include `#countly-tst` tag in your prompt to activate this skill.

## Usage Examples

### Validate Event Tracking
```
#countly-tst Verify that the "add_to_cart" event is being tracked correctly in staging
```

### Trace Analysis
```
#countly-tst Show request traces for test API endpoint
```

### Crash Debugging
```
#countly-tst Show crash reports from the latest test build
```

### Performance Monitoring
```
#countly-tst #fetch Analyze response times in staging app
```

### User Flow Validation
```
#countly-tst Show user flows through onboarding in test environment
```

## Configuration
MCP server is defined as `countly-tst` in `mcp-config.json`.

## Environment Variables
Use environment variables defined in `.env`.

## Best Practices
- Use to verify analytics instrumentation before production releases
- Compare event structures with production (`#countly-prd`) to catch discrepancies
- Use for QA and testing analytics workflows
- Never mix with `#countly-prd` in the same request

## Limitations
- Test environment only — data does not reflect real user behavior
- Different data retention policies than production
- Test event volumes are much lower than production
- Environment must be configured and available

## Environment Isolation
**CRITICAL**: Never use `#countly-tst` and `#countly-prd` in the same request. Choose one environment per query.
