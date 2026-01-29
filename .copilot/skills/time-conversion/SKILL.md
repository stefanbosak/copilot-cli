# Time Conversion Skill

## Metadata
- **Skill Name**: time-conversion
- **Trigger Tag**: `#time`
- **MCP Server**: Time/timezone conversion service
- **Category**: Utility

## Description
Provide accurate time and timezone conversions using IANA timezone names. Handles daylight saving time, time zone offsets, and global time coordination.

## Capabilities
- Convert between timezones
- Handle daylight saving time transitions
- IANA timezone database support
- Current time in multiple zones

## Activation
Include `#time` tag in your prompt to activate this skill.

## Usage Examples

### Basic Conversion
```
#time Convert 3 PM EST to Tokyo time
```

### Meeting Scheduling
```
#time What time is 10 AM New York in London, Tokyo, and Sydney?
```

### Event Planning
```
#time When is 2026-02-15 00:00 UTC in America/Los_Angeles?
```

## Configuration
Use `time` defined in `mcp-config.json`.

## Environment variables
Use environment variables defined in `.env`.

## Best Practices
- Always use IANA timezone names (Europe/Bratislava)
- Consider daylight saving time transitions
- Use for international meeting scheduling
- Verify timezone abbreviations vs IANA names

## Limitations
- Requires IANA timezone database
- Historical timezone changes may not be complete
- Future DST changes depend on timezone database updates
