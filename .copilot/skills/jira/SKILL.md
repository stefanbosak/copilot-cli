---
name: jira
description: "Tools for interaction with jira production cloud environment"
---

# JIRA Environment Skill

## Metadata
- **Skill Name**: jira
- **Trigger Tag**: `#jira`
- **MCP Server**: jira MCP Server

## Description
Access JIRA environment

## Capabilities
- Jira workitems issues, bugs

## Activation
Include `#jira` tag in your prompt to activate this skill.

## Usage Examples

### List Projects
```
#jira Show list of projects
```

## Configuration
MCP server is defined as `jira` in `mcp-config.json`.

## Environment Variables
Use environment variables defined in `.env`.

## Limitations
- Environment must be available and configured
