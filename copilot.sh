#!/bin/bash
#
# GitHub Copilot CLI runner wrapper
#

#
# Docker container GitHub Copilot CLI wrapper
#
copilot() {
  # extract Docker GID from the system
  export DOCKER_GID=$(getent group docker | cut -d: -f3)

  docker run -it --rm \
    --group-add "${DOCKER_GID}" \
    --env-file "${HOME}/.copilot/.env" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "${HOME}/.copilot:/home/node/.copilot" \
    -v "${HOME}/workspace:/workspace" \
    -v "${HOME}/.docker:/home/node/.docker:ro" \
    -v "${HOME}/.docker/mcp:/home/node/.docker/mcp" \
    -w "/workspace" \
    ghcr.io/stefanbosak/copilot-cli:initial \
    copilot --no-auto-update --allow-all-tools "$@"
}

# run
copilot "${@}"
