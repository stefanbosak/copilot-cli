---
name: web-search
description: "Tools for web search"
---

# Web Search Skill

## Metadata
- **Skill Name**: web-search
- **Trigger Tag**: `#fetch`
- **MCP Server**: @modelcontextprotocol/server-brave-search or similar
- **Category**: Information Retrieval

## Description
Query the web for current, up-to-date information before responding to user queries. Essential for questions about recent events, new technologies, or frequently updated information.

## Capabilities
- Retrieve latest information from the web
- Get current news, events, and developments
- Find recent technology updates and releases
- Access real-time data and statistics

## Activation
Include `#fetch` tag in your prompt to activate this skill.

## Usage Examples

### Basic Usage
```
#fetch What's the latest React version?
```

### Combined with Other Skills
```
#fetch #ref Latest best practices for JWT authentication
```

### Environment-Specific Queries
```
#grafana-prd #fetch Check current Prometheus metrics
```

## Configuration
MCP server is defined as `fetch` in `mcp-config.json`.

## Environment Variables
Use environment variables defined in `.env`.

## Best Practices
- Use for queries requiring current information
- Combine with #ref when documentation context is also needed
- Verify information freshness when critical
- Avoid for historical or well-established information

## Limitations
- Requires internet connectivity
- API rate limits may apply
- Results quality depends on search engine API
