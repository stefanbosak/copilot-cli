# Documentation Search Skill

## Metadata
- **Skill Name**: doc-search
- **Trigger Tag**: `#ref`
- **MCP Server**: Custom documentation server
- **Category**: Information Retrieval

## Description
Search through documentation repositories, GitHub repos, and private resources before providing code recommendations. Ensures recommendations are based on official documentation and established patterns.

## Capabilities
- Search public documentation (official docs, GitHub repos)
- Search private documentation (internal repos, PDFs)
- Retrieve code examples from documentation
- Access API references and guides

## Activation
Include `#ref` tag in your prompt to activate this skill.

## Usage Examples

### Basic Usage
```
#ref How to implement OAuth in Express.js?
```

### Combined with Web Search
```
#fetch #ref Latest TypeScript features and usage patterns
```

### Framework-Specific Queries
```
#ref React hooks lifecycle best practices
```

## Configuration
Use `ref` defined in `mcp-config.json`.

## Environment Variables
Use environment variables defined in `.env`.

## Best Practices
- Always use before providing framework-specific code
- Combine with #fetch for latest documentation updates
- Verify documentation version matches your project
- Use for API references and integration guides

## Limitations
- Documentation must be indexed/accessible
- Private docs require proper authentication
- Search quality depends on documentation structure
