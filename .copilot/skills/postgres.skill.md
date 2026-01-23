# PostgreSQL Database Skill

## Metadata
- **Skill Name**: postgres
- **Trigger Tag**: `#postgres`
- **MCP Server**: PostgreSQL via toolbox utility
- **Category**: Database Access

## Description
Access local PostgreSQL database through MCP server using the `toolbox` utility. Provides database query, schema inspection, and data analysis capabilities without direct psql access.

## Capabilities
- Query database tables and views
- Inspect database schema and structure
- List databases and tables
- Execute SELECT queries for data analysis
- Database overview and statistics

## Activation
Include `#postgres` tag in your prompt to activate this skill.

## Usage Examples

### Database Overview
```
#postgres Show list of databases
```

### Schema Inspection
```
#postgres List all tables in current database
```

### Data Query
```
#postgres Show recent user registrations from users table
```

### Analysis
```
#postgres Analyze order patterns by status
```

## Configuration
**IMPORTANT**: PostgreSQL is connected through MCP server using the `toolbox` utility, NOT direct psql connection.

Use `postgres` defined in `mcp-config.json`.

## Environment variables
Use environment variables defined in `.env`.

## Connectivity Verification

## Best Practices
- Always verify connection before queries (rule requirement)
- Use for local database access only
- Do NOT use direct psql - always use MCP toolbox
- Use for schema inspection and data analysis
- Prefer read-only queries when possible

## Limitations
- Local PostgreSQL only
- Requires toolbox utility installed
- MCP server must be configured
- Query complexity may be limited
- Write operations should be used cautiously

## Security Considerations
- Uses toolbox utility for secure access
- Credentials managed by MCP server configuration
- Avoid exposing sensitive data in queries
- Use proper connection verification before queries

## Error Handling
If connection fails:
1. Verify toolbox utility is installed
2. Check MCP server configuration
3. Verify PostgreSQL is running locally
4. Report error to user and terminate (per rules)
