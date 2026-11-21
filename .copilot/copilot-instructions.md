# Copilot Instructions

## MANDATORY WORKFLOW — Every prompt result MUST follow this exact sequence:

**Scope:** This workflow applies to **every execution path**:
- direct prompt handling in the main assistant
- any skill invocation and its returned output
- any agent or sub-agent run, including follow-up `read_agent` / `read_bash` results

1. **COLLECT** — execute the query, tool, skill, agent, or sub-agent and read its output
2. **SAVE** — write the full collected result to a file under `/workspace` before replying, and the filename **must** use the exact naming pattern `/workspace/copilot_<topic>_<timestamp>.md`
3. **REPLY** — summarise for the user, referencing the saved file path

> NEVER reply to the user before the /workspace file exists.
> NEVER skip or defer the save step — it must happen in the SAME TURN as the collect step, regardless of whether the output came from a direct tool call, a skill, or an agent/sub-agent.
> NEVER save to `/workspace` using a filename that does not match `<topic>_<timestamp>.md`.

## NEVER:
- Reply with results without first saving them to /workspace
- Save output using a filename that does not follow `<topic>_<timestamp>.md`
- Return skill, agent, or sub-agent output to the user without first saving it to /workspace
- Skip read_agent / read_bash after a system_notification or inline agent result
- Split Collect / Save / Reply across multiple turns — do all three in one turn


## Python

> **REQUIRED AND MANDATORY — NO EXCEPTIONS:** NEVER search for, locate, or probe for a Python binary (no `which python`, `command -v python`, `ls /usr/bin/python*`, `find` for python, `python --version` checks, etc.). ALWAYS run `uv python install <version>` to get the needed Python version, then use `uv run`. This rule must be followed every time, in every execution path (main assistant, skills, agents, sub-agents).

- Never look up the python binary; instead always use `uv python install <version>` to install the required python version.
- Always use `uv` for all Python tasks. Never use `pip`, `pip3`, `virtualenv`, `venv`, or `python -m pip`.
- Use `uv venv` to create virtual environments.
- Use `uv add <package>` to add dependencies (updates pyproject.toml).
- Use `uv run <script>` to execute Python scripts.
- Use `uvx <tool>` to run one-off tools (ruff, black, pytest, etc.) without installing globally.
- Use `uv sync` instead of `pip install -r requirements.txt`.
- Do not generate requirements.txt workflows; use pyproject.toml + uv.lock.


## JavaScript/TypeScript
- Always use `bun` for all JS/TS tasks. Never use `node`, `npm`, `npx`, or `yarn`.
- Use `bun install` instead of `npm install`.
- Use `bun add <package>` to add dependencies.
- Use `bun run <script>` to execute scripts.
- Use `bunx <tool>` instead of `npx`.
