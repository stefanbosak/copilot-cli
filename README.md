<div align="center">

# 🤖 GitHub Copilot CLI

**Containerized GitHub Copilot CLI (Hardened)**

[![build_status_badge](../../actions/workflows/docker-image-prepare-amd64-arm64.yml/badge.svg?branch=main)](.github/workflows/docker-image-prepare-amd64-arm64.yml)
[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue?logo=github)](https://github.com/github/copilot-cli)
[![Documentation](https://img.shields.io/badge/Docs-GitHub-green?logo=github)](https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli)
[![MCP](https://img.shields.io/badge/MCP-Servers-orange)](https://mcpservers.org/)

</div>

---

## 📋 Overview

This repository provides a fully <span style="color: #0969da;">**containerized**</span> [GitHub Copilot CLI](https://github.com/github/copilot-cli) environment with integrated <span style="color: #8250df;">**MCP server**</span> support using <span style="color: #1a7f37;">**Docker-in-Docker**</span> architecture.

### 📚 Resources

- 📖 [Official Documentation](https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli)
- 📖 [AI models database](https://models.dev)
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
| File | Description | Note |
|------|-------------|------|
| [`config.json`](./.copilot/config.json) | <span style="color: #0969da;">GitHub Copilot CLI configuration</span> | |
| [`.env`](./.copilot/.env) | <span style="color: #1a7f37;">Environment variables</span> | |
| [`copilot-instructions.md`](./.copilot/copilot-instructions.md) | Basic instruction file (available from 2025-Sep) | [docs](https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-repository-instructions) |
| [`skills`](./.copilot/skills) | Directory with skills (available from 2025-Dec-19) | [docs](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills) |
| [`mcp-config.json`](./.copilot/mcp-config.json) | <span style="color: #8250df;">MCP servers configuration</span> | |

### <span style="color: #8250df;">Copilot capabilities subdirectories</span>
| Directory | Purpose | Example Use Case | Documentation | Additional reference |
|-----------|---------|------------------|---------------|----------------------|
| **instructions** | Context-aware guidelines with `applyTo` patterns and priority levels. | Coding standards, linting rules, team conventions. `.copilot/instructions/{name}.instructions.md` | [docs](https://docs.github.com/en/copilot/tutorials/customization-library/custom-instructions/your-first-custom-instructions) | [README.instructions](https://github.com/github/awesome-copilot/blob/main/docs/README.instructions.md) |
| **skills** | Reusable multi-step workflows in `SKILL.md` with version/tags/dependencies. | DB migrations, code reviews, API tests, deployments. `~/.copilot/skills/{name}` | [docs](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills) | [README.skills](https://github.com/github/awesome-copilot/blob/main/docs/README.skills.md), [VS Code](https://code.visualstudio.com/docs/copilot/customization/agent-skills) |
| **agents** | Specialized AI assistants with custom tools/instructions (markdown/JSON). | Code reviewer, docs writer, DevOps automation, security auditor. `.copilot/agents/` | [docs](https://docs.github.com/en/copilot/how-tos/use-copilot-agents/coding-agent/create-custom-agents) | [README.agents](https://github.com/github/awesome-copilot/blob/main/docs/README.agents.md), [Building agents](https://techcommunity.microsoft.com/blog/azuredevcommunityblog/building-agents-with-github-copilot-sdk-a-practical-guide-to-automated-tech-upda/4488948), [Writing agents](https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/) |
| **prompts** | Template-based prompts with parameters (`.prompt.md`). | Feature templates, bug fix flows, review checklists. `.copilot/prompts/` | [docs](https://docs.github.com/en/copilot/tutorials/customization-library/prompt-files/your-first-prompt-file) | [README.prompts](https://github.com/github/awesome-copilot/blob/main/docs/README.prompts.md) |
| **commands** | Slash commands for deterministic actions without natural language. | `/explain`` - Quick shell, AI tasks | [blog](https://github.blog/ai-and-ml/github-copilot/a-cheat-sheet-to-slash-commands-in-github-copilot-cli/) | |
| **endgame** | Workflow orchestration for multi-step operations (agentic workflows). | Release prep, deployment verification, quality gates. | | |
| **plugins** | MCP server integrations with `plugin.json`, agents, skills subdirs. | Linear tracking, PostgreSQL access, Slack notifications. `.copilot/plugins/{name}/` | [extensions](https://docs.github.com/en/copilot/how-tos/use-copilot-extensions) | [MS Dev Blog](https://developer.microsoft.com/blog/introducing-awesome-github-copilot-customizations-repo) |
| **collections** | Bundle related resources with `.collection.md` and `includes` field. | Full-stack bundles, DevOps toolkits, testing suites. `.copilot/collections/{name}` | | [README.collections](https://github.com/github/awesome-copilot/blob/main/docs/README.collections.md) |

### <span style="color: #0969da;">Docker & Build</span>
| File | Description |
|------|-------------|
| [`Dockerfile`](./Dockerfile) | <span style="color: #0969da;">Container image configuration</span> |
| [`copilot-build.sh`](./copilot-build.sh) | <span style="color: #1a7f37;">Build automation script</span> |
| [`copilot.sh`](./copilot.sh) | <span style="color: #1a7f37;">Execution wrapper script</span> |
| [`act.sh`](./act.sh) | <span style="color: #1a7f37;">Act tool script</span> |

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

<span style="color: #8250df;">**Made with ❤️ for ⚡ efficiency and 🔒 security**</span>

</div>
