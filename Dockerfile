# Non-hardened alternative
#FROM debian:stable-slim

# Hardened
FROM dhi.io/debian-base:trixie-debian13-dev

# Build arguments
ARG TARGETARCH
ARG TARGETOS

ARG CONTAINER_USER=user
ARG CONTAINER_GROUP=user

ARG CONTAINER_USER_ID=1000
ARG CONTAINER_GROUP_ID=1000

ARG WORKSPACE_ROOT_DIR="/home/${CONTAINER_USER}"

ARG COPILOT_CLI_RELEASE_VERSION="latest"

WORKDIR "${WORKSPACE_ROOT_DIR}"

# OCI Standard Labels
# https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL org.opencontainers.image.description="GitHub Copilot CLI container and tooling"

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    bash \
    bash-completion \
    bc \
    ca-certificates \
    curl \
    dnsutils \
    git \
    gzip \
    iproute2 \
    iputils-ping \
    jq \
    kmod \
    lsof \
    openssh-client \
    pigz \
    procps \
    psmisc \
    ripgrep \
    rsync \
    socat \
    unzip \
    wget \
    whois \
  && apt-get clean \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*

COPY "./tools.yaml" "/usr/local/bin/tools.yaml"

RUN if ! getent passwd ${CONTAINER_USER_ID} > /dev/null 2>&1; then \
        groupadd --gid ${CONTAINER_GROUP_ID} "${CONTAINER_GROUP}" && \
        useradd --gid ${CONTAINER_GROUP_ID} --groups "${CONTAINER_GROUP}" -M -d "${WORKSPACE_ROOT_DIR}" --uid ${CONTAINER_USER_ID} "${CONTAINER_USER}" -s "/bin/bash" && \
        chown -R "${CONTAINER_USER}:${CONTAINER_GROUP}" "${WORKSPACE_ROOT_DIR}"; \
    else \
        rm -fr "${WORKSPACE_ROOT_DIR}" && \
        mkdir -p "${WORKSPACE_ROOT_DIR}" && \
        usermod -d "${WORKSPACE_ROOT_DIR}" -c "${CONTAINER_USER}" "debian" && \
        groupmod -n "${CONTAINER_USER}" "debian" && \
        usermod -l "${CONTAINER_USER}" "debian" && \
        chown -R "${CONTAINER_USER}:${CONTAINER_GROUP}" "${WORKSPACE_ROOT_DIR}"; \
    fi \
  && mkdir -p /workspace \
  && chown "${CONTAINER_USER}:${CONTAINER_GROUP}" /workspace \
  # Install development tools and configure Docker-in-Docker
  && if [ "${TARGETARCH}" = "amd64" ]; then \
  TOOLBOX_VERSION=$(git ls-remote --refs --sort='version:refname' \
      --tags "https://github.com/googleapis/genai-toolbox" \
      | grep -vE 'alpha|beta|rc|dev|None|list|nightly|\{' | cut -d'/' -f3 \
      | tail -n 1) \
  && curl -fsSL -o "/usr/local/bin/toolbox" \
      "https://storage.googleapis.com/genai-toolbox/${TOOLBOX_VERSION}/${TARGETOS}/${TARGETARCH}/toolbox" \
  && chmod +x "/usr/local/bin/toolbox"; \
  fi \
  && curl -fsSL "https://raw.githubusercontent.com/github/copilot-cli/refs/heads/main/install.sh" \
     | VERSION="${COPILOT_CLI_RELEASE_VERSION}" bash \
  # Install uv (Python package manager)
  && curl -LsSf "https://astral.sh/uv/install.sh" \
      | UV_INSTALL_DIR=/usr/local/bin bash \
  # Install bun (all-in-one JS toolkit)
  && curl -fsSL "https://bun.com/install" \
      | BUN_INSTALL=/usr/local bash \
  # Install mdflow
  && BUN_INSTALL=/usr/local bun install --global mdflow \
  # Install Docker-in-Docker (pre-release)
  # Note: DinD via QEMU on ARM64 not supported
  # (ARM64 requires ARM64 kernel from host, not available on AMD64 host)
  && curl -fsSL "https://test.docker.com" | sh \
  && if ! getent group docker > /dev/null 2>&1; then \
       groupadd -g 999 docker; \
     fi \
  && usermod -aG docker "${CONTAINER_USER}"

# Switch to non-root user
USER "${CONTAINER_USER}"

RUN cp /etc/skel/.bashrc "${HOME}"

WORKDIR /workspace

CMD ["copilot"]
