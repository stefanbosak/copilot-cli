#!/bin/bash
#
# GitHub Copilot CLI runner wrapper
#

#
# Docker container GitHub Copilot CLI wrapper
#
copilot() {
  docker run -it --rm \
    # GitHub Copilot CLI environment variables
    --env-file "${HOME}/.copilot/.env" \
    # Docker in Docker socket mapping
    -v /var/run/docker.sock:/var/run/docker.sock \
    # GitHub Copilot CLI configuration storage
    -v "${HOME}/.copilot:/home/node/.copilot" \
    # workspace used by GitHub Copilot CLI
    -v "${HOME}/workspace:/workspace" \
    # Docker configuration storage
    -v "${HOME}/.docker:/home/node/.docker:ro" \
    # Docker MCP toolkit (optional)
    -v "${HOME}/.docker/mcp:/home/node/.docker/mcp" \
    # set workspace directory
    -w "/workspace" \
    ghcr.io/stefanbosak/copilot-cli:initial \
    # GitHub Copilot CLI arguments
    copilot --no-auto-update --allow-all-tools "$@"
}

# run
copilot "${@}"
