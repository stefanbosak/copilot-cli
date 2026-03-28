# Copilot Workspace Instructions

## Output Persistence (MANDATORY)

**Every response that produces output, results, code, scripts, reports, analysis, or data MUST be persisted to disk under `/workspace`.**

Rules that apply in ALL modes (prompt, plan, autopilot):

1. **Never display-only** — do not produce output solely in the terminal. Always write it to a file.
2. **Save to `/workspace`** — use a descriptive subdirecties and filenames based on the task or query (e.g., `/workspace/outputs/analysis-2024-03.md`, `/workspace/scripts/deploy.sh`).
3. **Create subdirectories** as needed to keep output organized.
4. **After writing**, confirm the file path(s) saved to the user.
5. **Conversational replies** (clarifications, short answers, status messages) are exempt — only substantive output must be persisted.

### Examples of output that MUST be saved:
- Code snippets, scripts, programs
- Reports, summaries, analysis results
- Configuration files, plans, proposals
- Data transformations, query results
- Diagrams, documentation, changelogs
