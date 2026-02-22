---
name: web-search
description: "Tools for web search"
---

# Web Search Skill

## Metadata
- **Skill Name**: web-search
- **Trigger Tag**: `#fetch`
- **MCP Server**: fetch (web search MCP server)
- **Category**: Information Retrieval

> **Note**: This skill is activated with `#fetch`, not `#web-search`. The directory name is `web-search` but the trigger tag is `#fetch`.

## Description
Query the web for current, up-to-date information. Use when the question involves recent events, new releases, current status, or any information that may have changed since the model's training cutoff. Returns AI-synthesized answers with citations.

## Capabilities
- Search the web for current information and news
- Find latest software releases, changelogs, and announcements
- Look up current statistics, prices, or status
- Retrieve content from specific URLs
- Synthesize information from multiple web sources with citations

## Activation
Include `#fetch` tag in your prompt to activate this skill.

## Usage Examples

### Latest Release Info
```
#fetch What's the latest stable version of Node.js and its key changes?
```

### Current Status Check
```
#fetch Is there an ongoing GitHub outage?
```

### Combined with Documentation Search
```
#fetch #ref Latest React 19 features and official migration guide
```

### Combined with Environment Skills
```
#grafana-prd #fetch What does this Prometheus metric http_request_duration_seconds measure?
```

### Fetch a Specific Page
```
#fetch Read https://github.com/expressjs/express/releases and summarize recent changes
```

## Configuration
MCP server is defined as `fetch` in `mcp-config.json`.

## Environment Variables
Use environment variables defined in `.env`.

## Best Practices
- Use whenever the answer may depend on information newer than training data
- Combine with `#ref` when official documentation context is also needed
- Prefer over training data knowledge for version numbers, current APIs, and changelogs
- Avoid for purely historical or well-established, stable information

## Limitations
- Requires internet connectivity
- API rate limits may apply
- Real-time data (live prices, live metrics) is better retrieved from environment skills like `#grafana-prd`
