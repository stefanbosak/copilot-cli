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

  # construct container image string
  export CONTAINER_IMAGE_REGISTRY="ghcr.io" # docker.io
  export CONTAINER_IMAGE_NAMESPACE="stefanbosak" # developmententity
  export CONTAINER_IMAGE_NAME="copilot-cli"
  export CONTAINER_IMAGE_TAG="initial"
  export CONTAINER_IMAGE="${CONTAINER_IMAGE_REGISTRY}/${CONTAINER_IMAGE_NAMESPACE}/${CONTAINER_IMAGE_NAME}:${CONTAINER_IMAGE_TAG}"

  # check prerequisite - Docker
  if [ -z "$(which docker)" ]; then
      echo "Docker is missing, terminating..."
      exit 1
  fi

  # check prerequisite - cosign
  if [ ! -z "$(which cosign)" ]; then
    export CONTAINER_IMAGE_DIGEST=$(docker buildx imagetools inspect "${CONTAINER_IMAGE}" --format '{{json .}}' | jq -r '.manifest.digest')

    cosign verify \
      --certificate-identity-regexp="https://github\.com/${CONTAINER_IMAGE_NAMESPACE}/${CONTAINER_IMAGE_NAME}/\.github/workflows/.*" \
      --certificate-oidc-issuer="https://token.actions.githubusercontent.com" \
      "${CONTAINER_IMAGE}@${CONTAINER_IMAGE_DIGEST}" > /dev/null 2>&1

    if [ ${?} -ne 0 ]; then
      echo "Signature for container image ${CONTAINER_IMAGE} is not valid, terminating..."
      exit 1
    fi
  fi

  # pull up-to-date image and start copilot
  docker run --quiet --rm -it --pull=always --cpus=4 --memory=1G \
    --group-add "${DOCKER_GID}" \
    --env-file "${HOME}/.copilot/.env" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "${HOME}/.copilot:/home/user/.copilot" \
    -v "${HOME}/workspace:/workspace" \
    -v "${HOME}/.docker:/home/user/.docker:ro" \
    -v "${HOME}/.docker/mcp:/home/user/.docker/mcp" \
    -w "/workspace" \
    "${CONTAINER_IMAGE}" \
    copilot --no-auto-update --allow-all-tools --allow-all-urls --silent "$@"
}

# run
copilot "${@}"
