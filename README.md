# GitHub Copilot CLI

This repository contains [GitHub Copilot CLI](https://github.com/github/copilot-cli) tooling covered as sandboxed Docker container.
Docker based [MCP servers](https://mcpservers.org/) are supported via Docker in Docker approach.

- [documentation](https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli)
- [supported models](https://docs.github.com/en/copilot/reference/ai-models/supported-models#model-retirement-history)


> [!NOTE]
> Every file would be reasonable well commented and relevant details can be found there.

> [!IMPORTANT]
> Check details before taking any action.

> [!CAUTION]
> User is responsible for any modification and execution of any parts from this repository.


## MCP servers

- **postgres** - PostgreSQL database integration via toolbox utility
  - Type: local
  - Command: `/usr/local/bin/toolbox --prebuilt postgres --stdio`
  - Environment variables: POSTGRES_HOST, POSTGRES_PORT, POSTGRES_DATABASE, POSTGRES_USER, POSTGRES_PASSWORD
  - [MCP Toolbox for Databases](https://github.com/googleapis/genai-toolbox)
  - Note: linux/arm64 is not currently not covered by official toolbox releases (due to this: toolbox is not part of ARM64 container image)

- **sequentialthinking** - Step-by-step reasoning and problem-solving
  - Type: local
  - Command: `/usr/local/bin/mcp-server-sequential-thinking`
  - Note: might reduce AI model tokens consumption ~5 - 55 %
  - [Sequential Thinking MCP Server](https://github.com/modelcontextprotocol/servers/tree/main/src/sequentialthinking)

- **ref** - Documentation search and reference
  - Type: http
  - URL: `https://api.ref.tools/mcp`
  - Requires: REF_API_KEY
  - Note: Similar to context7 but more efficient, this MCP is crucial
  - [Ref.tools - Context for your agent](https://ref.tools/)

- **fetch** - Web fetching capabilities
  - Type: local (Docker)
  - Command: `docker run --rm -i --network=host mcp/fetch`
  - [Fetch MCP Server](https://github.com/modelcontextprotocol/servers/tree/main/src/fetch)

- **time** - Time and timezone conversions
  - Type: local (Docker)
  - Command: `docker run --rm -i --network=host -e LOCAL_TIMEZONE mcp/time`
  - [Time MCP Server](https://github.com/modelcontextprotocol/servers/tree/main/src/time)

- **grafana-tst** - Grafana monitoring (test environment)
  - Type: sse
  - URL (example): `https://grafana-mcp.tst.domain.tld/sse`
  - [Grafana MCP server](https://github.com/grafana/mcp-grafana)

- **grafana-prd** - Grafana monitoring (production environment)
  - Type: sse
  - URL (example): `https://grafana-mcp.prd.domain.tld/sse`
  - [Grafana MCP server](https://github.com/grafana/mcp-grafana)

- **graylog-tst** - Graylog logging (test environment)
  - Type: http
  - URL (example): `https://graylog.tst.domain.tld/api/mcp`
  - Requires: Authorization header
  - [Graylog MCP scope ducumentsion](https://go2docs.graylog.org/current/setting_up_graylog/model_context_protocol__mcp__tools.htm)

- **graylog-prd** - Graylog logging (production environment)
  - Type: http
  - URL (example): `https://graylog.papayapos.sk/api/mcp`
  - Requires: Authorization header
  - [Graylog MCP scope ducumentsion](https://go2docs.graylog.org/current/setting_up_graylog/model_context_protocol__mcp__tools.htm)


## Files

- [config.json](./copilot/config.json) - GitHub Copilot CLI configuration 
- [.env](./copilot/.env) - GitHub Copilot CLI environment variables 
- [copilot-instruction.md](./copilot/copilot-instruction.md) - basic instruction file for GitHub Copilot CLI
- [mcp-config.json](./copilot/mcp-config.json) - configuration of MCP servers 
- [Dockerfile](./Dockerfile) - Docker container configuration
- [copilot-build.sh](./copilot-build.sh) - Copilot build script
- [copilot.sh](./copilot.sh) - Copilot execution script
- [deadsnakes.gpg](./deadsnakes.gpg) - GPG key for deadsnakes PPA
- [deadsnakes.list](./deadsnakes.list) - APT source list for deadsnakes repository


## Docker container image

- [GitHubCR](https://github.com/stefanbosak/copilot-cli/pkgs/container/copilot-cli) (IPv4 only): `docker pull ghcr.io/stefanbosak/copilot-cli:initial`
- [DockerHubCR](https://hub.docker.com/r/developmententity/copilot-cli) (IPv4 & IPv6): `docker pull developmententity/copilot-cli:initial`
