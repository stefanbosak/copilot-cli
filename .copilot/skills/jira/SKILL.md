---
name: jira
description: "Tools for interaction with jira production cloud environment"
---

# JIRA Environment Skill

## Metadata
- **Skill Name**: jira
- **Trigger Tag**: `#jira`
- **MCP Server**: jira MCP Server
- **Category**: Project Management

## Description
Access Jira Cloud to read and manage issues, epics, sprints, boards, projects, and worklogs. Use for any task involving Jira tickets, sprint planning, status updates, linking issues, or reporting.

## Capabilities
- Search issues with JQL (Jira Query Language)
- Get, create, update, and delete issues
- Transition issue status (e.g., To Do → In Progress → Done)
- Add comments and worklogs to issues
- Manage epics and link issues to epics
- Create and link issues (Blocks, Relates to, Duplicate, etc.)
- List and search projects
- Get and manage agile boards and sprints
- Batch create multiple issues at once
- Download issue attachments
- Get changelogs and history for issues
- Manage fix versions / releases

## Activation
Include `#jira` tag in your prompt to activate this skill.

## Usage Examples

### Search Issues with JQL
```
#jira Find all open bugs assigned to me in project MYAPP
```

### Sprint Overview
```
#jira Show all issues in the current active sprint for board 42
```

### Create an Issue
```
#jira Create a bug in project MYAPP: "Login fails on Safari" assigned to john@example.com
```

### Transition Status
```
#jira Move MYAPP-123 to In Progress
```

### Add Comment
```
#jira Add comment to MYAPP-456: "Fixed in PR #89, pending review"
```

### Epic Management
```
#jira Show all stories linked to epic MYAPP-10
```

### Log Work
```
#jira Log 2h 30m on MYAPP-789 with comment "Implemented feature"
```

## JQL Reference
Common JQL patterns:
- `assignee = currentUser() AND status != Done`
- `project = PROJ AND issuetype = Bug AND priority = High`
- `sprint in openSprints() AND status = "In Progress"`
- `updated >= -7d AND project = PROJ`
- `parent = PROJ-123` (issues in an epic)

## Configuration
MCP server is defined as `jira` in `mcp-config.json`.

## Environment Variables
Use environment variables defined in `.env`.

## Best Practices
- Use JQL for precise searches across large projects
- Always fetch available transitions before transitioning an issue
- Use `jira_batch_create_issues` when creating multiple issues at once
- Use `jira_get_issue` with `fields='*all'` to see custom fields

## Limitations
- Jira Cloud only (not Server/Data Center for all endpoints)
- Write operations (create/update/delete) require appropriate permissions
- Custom field IDs vary per Jira instance (use `jira_search_fields` to discover them)
