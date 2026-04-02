<div align="center">

# 🤖 GitHub Copilot CLI

**Containerized GitHub Copilot CLI (Hardened)**

[![build_status_badge](../../actions/workflows/docker-image-native-multiplatform-pipeline.yml/badge.svg?branch=main)](.github/workflows/docker-image-native-multiplatform-pipeline.yml)
[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue?logo=github)](https://github.com/github/copilot-cli)
[![Documentation](https://img.shields.io/badge/Docs-GitHub-green?logo=github)](https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli)
[![MCP](https://img.shields.io/badge/MCP-Servers-orange)](https://mcpservers.org/)

</div>

---

## 📦 Latest Build

<!-- VERSION_INFO_START -->
| Component | Version |
|-----------|---------|
| **GitHub Copilot CLI** | [`1.0.16-1`](https://github.com/github/copilot-cli/releases/tag/v1.0.16-1) |

> 🔄 Last updated: 2026-04-02T01:41:03Z · [Build #70](https://github.com/stefanbosak/copilot-cli/actions/runs/23879403835)
<!-- VERSION_INFO_END -->

---

## 📋 Overview

This repository provides a fully automated preparation of <span style="color: #0969da;">**containerized**</span> [GitHub Copilot CLI](https://github.com/github/copilot-cli) environment with integrated <span style="color: #8250df;">**MCP server**</span> support using <span style="color: #1a7f37;">**Docker-in-Docker**</span> architecture.

### About solution
- Sandboxing environment for AI scope (reduced possible negative impact via isolation)
- Automated packaging of current tool versions (optimized maintenance effort via automation)
- Strong focus on security (mitigated security issues and vulnerabilities through hardening)
- Simplification of the initial run-up (see: [Container runner script](./copilot.sh), [GitHub Copilot setup](./.copilot/config.json), [Environment configuration](./.copilot/.env))

- **Container image is:**
  - keyless-signed via cosign using GitHub OIDC certificate issuer (trusted verifiable source)
  - automatically built when a new pre-release of GitHub Copilot CLI is detected (scheduled monitoring - every hour)

### 📚 Resources

- 📖 [Official Documentation](https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli)
- 📖 [AI models database](https://models.dev)
- 🤖 [Supported AI Models](https://docs.github.com/en/copilot/reference/ai-models/supported-models#model-retirement-history)
  - **Recommended models**:
    - <span style="color: #8250df;">**Anthropic Claude Sonnet**</span> - [Documentation](https://www.anthropic.com/claude/sonnet): Low, Medium, High
    - <span style="color: #a371f7;">**Anthripic Claude Opus**</span> - [Documentation](https://www.anthropic.com/claude/opus): Normal (Low, Medium, High), Fast (Low, Medium, High)
    - <span style="color: #a371f7;">**OpenAI GPT 5.4**</span> - [Documentation](https://openai.com/index/introducing-gpt-5-4/): Low, Medium, High, Extra High
  - **Effective Prompting**:
    - Save output to prevent data loss (reduce costs)
    - Iteratively processing excessively long messages (drop error rate ~<10%)
    - XML tags ensure structural clarity (compliance increase to ~>98 %)
    - Validate continuously (maintain ~>95% accuracy)
    - Instruct what to avoid, not what to do (significantly reduce hallucination by ~>60 %)
    - Contextualize personas (~<15 % improvement using personas)

### GitHub IP prefixes, subdomains for whitelisting

``curl -s https://api.github.com/meta``

### ⚠️ Important Notices

> [!NOTE]
> All files in this repository are well-commented with relevant implementation details.

> [!IMPORTANT]
> Always review and understand the code before executing any commands.

> [!CAUTION]
> Users are solely responsible for any modifications or execution of code from this repository.

## 🛠️ Utilities
- [uv](https://github.com/astral-sh/uv) - An extremely fast Python package installer and resolver
- [bun](https://github.com/oven-sh/bun) - All-in-one JavaScript runtime and toolkit for faster development
- [mdflow](https://github.com/johnlindquist/mdflow) - Markdown-based workflow automation tool for streamlined task execution

## 🔌 MCP Servers

> [!NOTE]
> Use custom agents with agent isolation to configure on-demand MCP servers.

### <span style="color: #8250df;">🧠 Reasoning, documentation</span>

#### **sequentialthinking** - <span style="color: #8250df;">Step-by-Step Reasoning</span>
- [configuration](.copilot/mcp-config.json)
- **Benefits:** <span style="color: #1a7f37;">Reduces token consumption by 5-55%</span>
- **Documentation:** [Sequential Thinking MCP Server](https://github.com/modelcontextprotocol/servers/tree/main/src/sequentialthinking)

#### **ref** - <span style="color: #8250df;">Documentation Search</span>
- [configuration](.copilot/mcp-config.json)
- **Benefits:** <span style="color: #1a7f37;">Essential for efficient context retrieval</span>
- **Documentation:** [Ref.tools](https://ref.tools/)

---

### <span style="color: #1a7f37;">🌐 Utilities</span>

#### **fetch** - <span style="color: #1a7f37;">Web Search</span>
- [configuration](.copilot/mcp-config.json)
- **Documentation:** [Fetch MCP Server](https://github.com/modelcontextprotocol/servers/tree/main/src/fetch)

#### **time** - <span style="color: #1a7f37;">Time & Timezone</span>
- [configuration](.copilot/mcp-config.json)
- **Documentation:** [Time MCP Server](https://github.com/modelcontextprotocol/servers/tree/main/src/time)

---

### <span style="color: #0969da;">🗄️ Database & Storage</span>

#### **postgres** - <span style="color: #0969da;">PostgreSQL Integration</span>
- [configuration](.copilot/agents/postgres.agent.md)
- **Documentation:** [MCP Toolbox for Databases](https://github.com/googleapis/genai-toolbox)
- ⚠️ **Note:** <span style="color: #d73a49;">Linux ARM64 architecture currently not supported ([issue](https://github.com/googleapis/genai-toolbox/issues/2754))</span>

---

### <span style="color: #d73a49;">📊 Monitoring & Logging</span>

#### **grafana-tst** - <span style="color: #d73a49;">Grafana</span> <span style="color: #8250df;">(Test)</span>
- [configuration](.copilot/agents/grafana-tst.agent.md)
- **Documentation:** [Grafana MCP Server](https://github.com/grafana/mcp-grafana)

#### **grafana-prd** - <span style="color: #d73a49;">Grafana</span> <span style="color: #1a7f37;">(Production)</span>
- [configuration](.copilot/agents/grafana-prd.agent.md)
- **Documentation:** [Grafana MCP Server](https://github.com/grafana/mcp-grafana)

#### **graylog-tst** - <span style="color: #d73a49;">Graylog</span> <span style="color: #8250df;">(Test)</span>
- [configuration](.copilot/agents/graylog-tst.agent.md)
- **Authentication:** <span style="color: #d73a49;">Authorization header required</span>
- **Documentation:** [Graylog MCP Documentation](https://go2docs.graylog.org/current/setting_up_graylog/model_context_protocol__mcp__tools.htm)

#### **graylog-prd** - <span style="color: #d73a49;">Graylog</span> <span style="color: #1a7f37;">(Production)</span>
- [configuration](.copilot/agents/graylog-prd.agent.md)
- **Authentication:** <span style="color: #d73a49;">Authorization header required</span>
- **Documentation:** [Graylog MCP Documentation](https://go2docs.graylog.org/current/setting_up_graylog/model_context_protocol__mcp__tools.htm)


## 📁 Repository Structure

### <span style="color: #8250df;">Configuration Files</span>
| File | Description | Note |
|------|-------------|------|
| [`config.json`](./.copilot/config.json) | <span style="color: #0969da;">GitHub Copilot CLI configuration</span> | |
| [`.env`](./.copilot/.env) | <span style="color: #1a7f37;">Environment variables</span> | |
| [`copilot-instructions.md`](./.copilot/copilot-instructions.md) | Basic instruction file | [docs](https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-repository-instructions) |
| [`mcp-config.json`](./.copilot/mcp-config.json) | <span style="color: #8250df;">MCP servers configuration</span> | |

### <span style="color: #8250df;">Copilot capabilities subdirectories</span>
| Directory | Purpose | Example Use Case | Documentation | Additional reference |
|-----------|---------|------------------|---------------|----------------------|
| [`instructions`](./.copilot/instructions) | Context-aware guidelines with `applyTo` patterns and priority levels. | Coding standards, linting rules, team conventions. `.copilot/instructions/{name}.instructions.md` | [docs](https://docs.github.com/en/copilot/tutorials/customization-library/custom-instructions/your-first-custom-instructions) | [README.instructions](https://github.com/github/awesome-copilot/blob/main/docs/README.instructions.md) |
| [`skills`](./.copilot/skills) | Reusable actions in `SKILL.md` (can use plugins). | DB migrations, code reviews, API tests, deployments. `.copilot/skills/{name}` | [docs](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills), [specs](https://github.com/agentskills/agentskills/blob/main/docs/specification.mdx) | [README.skills](https://github.com/github/awesome-copilot/blob/main/docs/README.skills.md), [VS Code](https://code.visualstudio.com/docs/copilot/customization/agent-skills) |
| [`agents`](./.copilot/agents) | Specialized AI assistants with custom skills (markdown/JSON). | Code reviewer, docs writer, DevOps automation, security auditor. `.copilot/agents/` | [docs](https://docs.github.com/en/copilot/how-tos/use-copilot-agents/coding-agent/create-custom-agents) | [README.agents](https://github.com/github/awesome-copilot/blob/main/docs/README.agents.md), [Building agents](https://techcommunity.microsoft.com/blog/azuredevcommunityblog/building-agents-with-github-copilot-sdk-a-practical-guide-to-automated-tech-upda/4488948), [Writing agents](https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/), [agents.md](https://agents.md/) |
| [`prompts`](./.copilot/prompts) | Template-based prompts with parameters (`.prompt.md`). | Feature templates, bug fix flows, review checklists. `.copilot/prompts/` | [docs](https://docs.github.com/en/copilot/tutorials/customization-library/prompt-files/your-first-prompt-file) | [README.prompts](https://github.com/github/awesome-copilot/blob/main/docs/README.prompts.md) |
| [`commands`](./.copilot/commands) | Slash commands for deterministic actions without natural language. | `/explain`` - Quick shell, AI tasks | [blog](https://github.blog/ai-and-ml/github-copilot/a-cheat-sheet-to-slash-commands-in-github-copilot-cli/) | |
| [`plugins`](./.copilot/plugins) | MCP server integrations with `plugin.json`, agents, skills subdirs. | Linear tracking, PostgreSQL access, Slack notifications. `.copilot/plugins/{name}/` | [extensions](https://docs.github.com/en/copilot/how-tos/use-copilot-extensions) | [MS Dev Blog](https://developer.microsoft.com/blog/introducing-awesome-github-copilot-customizations-repo) |
| [`collections`](./.copilot/collections) | Grouped sets of related Copilot customizations. | Collection for automation. `.copilot/collections/{name}` | | [README.collections](https://github.com/github/awesome-copilot/blob/main/docs/README.collections.md) |
| [`hooks`](./.copilot/hooks) | Copilot agent event-driven automated workflow | `.copilot/hooks/{name}` | | [README.hooks](https://github.com/github/awesome-copilot/blob/main/docs/README.hooks.md) |
| **workflows** | Workflow orchestration for multi-step operations (agentic workflows). | Release prep, deployment verification, quality gates. (only in `.github`) | | [README.workflows](https://github.com/github/awesome-copilot/blob/main/docs/README.workflows.md) |

### <span style="color: #0969da;">Docker & Build</span>
| File | Description |
|------|-------------|
| [`Dockerfile`](./Dockerfile) | <span style="color: #0969da;">Recipe for building container images</span> |
| [`copilot-build.sh`](./copilot-build.sh) | <span style="color: #1a7f37;">Standalone container local build script</span> |
| [`copilot.sh`](./copilot.sh) | <span style="color: #1a7f37;">GitHub Copilot container runner script</span> |
| [`act.sh`](./act.sh) | <span style="color: #1a7f37;">[Act](https://github.com/nektos/act) tool wrapper script</span> |
| [`docker-image-native-multiplatform-pipeline.yml`](.github/workflows/docker-image-native-multiplatform-pipeline.yml) | <span style="color: #1a7f37;">GitHub Action pipeline workflow for native build (triggered on repository_dispatch)</span> |
| [`docker-image-emulated-multiplatform-pipeline.yml`](.github/workflows/docker-image-emulated-multiplatform-pipeline.yml) | <span style="color: #1a7f37;">GitHub Action pipeline workflow for emulated (QEMU ARM64) build</span> |
| [`monitor-copilot-cli-prerelease.yml`](.github/workflows/monitor-copilot-cli-prerelease.yml) | <span style="color: #1a7f37;"> GitHub Action workflow for monitoring of newest GitHub Copilot CLI pre-release version</span> |

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
