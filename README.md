<div align="center">

# 🤖 GitHub Copilot CLI

**Sandboxed Docker Container for GitHub Copilot CLI with MCP Support**

![Build Status](https://github.com/stefanbosak/copilot-cli/actions/workflows/docker-image-prepare-amd64-arm64.yml/badge.svg)
[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue?logo=github)](https://github.com/github/copilot-cli)
[![Documentation](https://img.shields.io/badge/Docs-GitHub-green?logo=github)](https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli)
[![MCP](https://img.shields.io/badge/MCP-Servers-orange)](https://mcpservers.org/)

</div>

---

## 📋 Overview

This repository provides a fully <span style="color: #0969da;">**containerized**</span> [GitHub Copilot CLI](https://github.com/github/copilot-cli) environment with integrated <span style="color: #8250df;">**MCP server**</span> support using <span style="color: #1a7f37;">**Docker-in-Docker**</span> architecture.

### 📚 Resources

- 📖 [Official Documentation](https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli)
- 🤖 [Supported AI Models](https://docs.github.com/en/copilot/reference/ai-models/supported-models#model-retirement-history)
  - **Recommended**:
    - <span style="color: #8250df;">**Claude Sonet-4.5**</span> - [Documentation](https://www.anthropic.com/claude/sonnet)
    - <span style="color: #a371f7;">**Claude Opus-4.5**</span> - [Documentation](https://www.anthropic.com/claude/opus)

### ⚠️ Important Notices

> [!NOTE]
> All files in this repository are well-commented with relevant implementation details.

> [!IMPORTANT]
> Always review and understand the code before executing any commands.

> [!CAUTION]
> Users are solely responsible for any modifications or execution of code from this repository.


## 🔌 MCP Servers

### <span style="color: #0969da;">🗄️ Database & Storage</span>

#### **postgres** - <span style="color: #0969da;">PostgreSQL Integration</span>
- **Type:** <span style="color: #1a7f37;">Local</span>
- **Command:** `/usr/local/bin/toolbox --prebuilt postgres --stdio`
- **Environment:**
  - `POSTGRES_HOST`
  - `POSTGRES_PORT`
  - `POSTGRES_DATABASE`
  - `POSTGRES_USER`
  - `POSTGRES_PASSWORD`
- **Documentation:** [MCP Toolbox for Databases](https://github.com/googleapis/genai-toolbox)
- ⚠️ **Note:** <span style="color: #d73a49;">ARM64 architecture not currently supported</span>

---

### <span style="color: #8250df;">🧠 AI & Reasoning</span>

#### **sequentialthinking** - <span style="color: #8250df;">Step-by-Step Reasoning</span>
- **Type:** <span style="color: #1a7f37;">Local</span>
- **Command:** `/usr/local/bin/mcp-server-sequential-thinking`
- **Benefits:** <span style="color: #1a7f37;">Reduces token consumption by 5-55%</span>
- **Documentation:** [Sequential Thinking MCP Server](https://github.com/modelcontextprotocol/servers/tree/main/src/sequentialthinking)

#### **ref** - <span style="color: #8250df;">Documentation Search</span>
- **Type:** <span style="color: #0969da;">HTTP</span>
- **URL:** `https://api.ref.tools/mcp`
- **Authentication:** <span style="color: #d73a49;">Requires `REF_API_KEY`</span>
- **Benefits:** <span style="color: #1a7f37;">Essential for efficient context retrieval</span>
- **Documentation:** [Ref.tools](https://ref.tools/)

---

### <span style="color: #1a7f37;">🌐 Utilities</span>

#### **fetch** - <span style="color: #1a7f37;">Web Fetching</span>
- **Type:** <span style="color: #1a7f37;">Local (Docker)</span>
- **Command:** `docker run --rm -i --network=host mcp/fetch`
- **Documentation:** [Fetch MCP Server](https://github.com/modelcontextprotocol/servers/tree/main/src/fetch)

#### **time** - <span style="color: #1a7f37;">Time & Timezone</span>
- **Type:** <span style="color: #1a7f37;">Local (Docker)</span>
- **Command:** `docker run --rm -i --network=host -e LOCAL_TIMEZONE mcp/time`
- **Documentation:** [Time MCP Server](https://github.com/modelcontextprotocol/servers/tree/main/src/time)

---

### <span style="color: #d73a49;">📊 Monitoring & Logging</span>

#### **grafana-tst** - <span style="color: #d73a49;">Grafana</span> <span style="color: #8250df;">(Test)</span>
- **Type:** <span style="color: #0969da;">SSE</span>
- **URL:** `https://grafana-mcp.tst.domain.tld/sse`
- **Documentation:** [Grafana MCP Server](https://github.com/grafana/mcp-grafana)

#### **grafana-prd** - <span style="color: #d73a49;">Grafana</span> <span style="color: #1a7f37;">(Production)</span>
- **Type:** <span style="color: #0969da;">SSE</span>
- **URL:** `https://grafana-mcp.prd.domain.tld/sse`
- **Documentation:** [Grafana MCP Server](https://github.com/grafana/mcp-grafana)

#### **graylog-tst** - <span style="color: #d73a49;">Graylog</span> <span style="color: #8250df;">(Test)</span>
- **Type:** <span style="color: #0969da;">HTTP</span>
- **URL:** `https://graylog.tst.domain.tld/api/mcp`
- **Authentication:** <span style="color: #d73a49;">Authorization header required</span>
- **Documentation:** [Graylog MCP Documentation](https://go2docs.graylog.org/current/setting_up_graylog/model_context_protocol__mcp__tools.htm)

#### **graylog-prd** - <span style="color: #d73a49;">Graylog</span> <span style="color: #1a7f37;">(Production)</span>
- **Type:** <span style="color: #0969da;">HTTP</span>
- **URL:** `https://graylog.papayapos.sk/api/mcp`
- **Authentication:** <span style="color: #d73a49;">Authorization header required</span>
- **Documentation:** [Graylog MCP Documentation](https://go2docs.graylog.org/current/setting_up_graylog/model_context_protocol__mcp__tools.htm)


## 📁 Repository Structure

### <span style="color: #8250df;">Configuration Files</span>
| File | Description |
|------|-------------|
| [`config.json`](./copilot/config.json) | <span style="color: #0969da;">GitHub Copilot CLI configuration</span> |
| [`.env`](./copilot/.env) | <span style="color: #1a7f37;">Environment variables</span> |
| [`copilot-instruction.md`](./copilot/copilot-instruction.md) | Basic instruction file |
| [`mcp-config.json`](./copilot/mcp-config.json) | <span style="color: #8250df;">MCP servers configuration</span> |

### <span style="color: #0969da;">Docker & Build</span>
| File | Description |
|------|-------------|
| [`Dockerfile`](./Dockerfile) | <span style="color: #0969da;">Container image configuration</span> |
| [`copilot-build.sh`](./copilot-build.sh) | <span style="color: #1a7f37;">Build automation script</span> |
| [`copilot.sh`](./copilot.sh) | <span style="color: #1a7f37;">Execution wrapper script</span> |

### <span style="color: #d73a49;">Dependencies</span>
| File | Description |
|------|-------------|
| [`deadsnakes.gpg`](./deadsnakes.gpg) | GPG key for deadsnakes PPA |
| [`deadsnakes.list`](./deadsnakes.list) | APT source list for Python repository |


## 🐳 Container Images

### <span style="color: #0969da;">Available Registries</span>

| Registry | Network Support | Pull Command |
|----------|----------------|--------------|
| [**GitHub CR**](https://github.com/stefanbosak/copilot-cli/pkgs/container/copilot-cli) | <span style="color: #8250df;">IPv4 only</span> | `docker pull ghcr.io/stefanbosak/copilot-cli:initial` |
| [**Docker Hub**](https://hub.docker.com/r/developmententity/copilot-cli) | <span style="color: #1a7f37;">IPv4 & IPv6</span> | `docker pull developmententity/copilot-cli:initial` |

---

<div align="center">

<span style="color: #8250df;">**Made with ❤️ to improve efficiency**</span>

</div>
