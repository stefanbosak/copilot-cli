# Copilot Instructions

## MANDATORY WORKFLOW — Every prompt result MUST follow this exact sequence:

**Scope:** This workflow applies to **every execution path**:
- direct prompt handling in the main assistant
- any skill invocation and its returned output
- any agent or sub-agent run, including follow-up `read_agent` / `read_bash` results

1. **COLLECT** — execute the query, tool, skill, agent, or sub-agent and read its output
2. **SAVE** — write the full collected result to a file under `/workspace` before replying, and the filename **must** use the exact naming pattern `/workspace/<topic>_<timestamp>.md`
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
