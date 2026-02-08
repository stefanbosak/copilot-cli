# Non-hardened alternative
# FROM node:trixie-slim

# Hardened Node.js (current) [2026-Jan]
# FROM dhi.io/node:25-debian13-dev

# Hardened Node.js (LTS) [2026-Jan]
FROM dhi.io/node:24-debian13-dev

# Build arguments
ARG TARGETARCH
ARG TARGETOS

# OCI Standard Labels
# https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL org.opencontainers.image.authors="Stefan Bosak" \
      org.opencontainers.image.url="https://github.com/stefanbosak/copilot-cli" \
      org.opencontainers.image.source="https://github.com/stefanbosak/copilot-cli" \
      org.opencontainers.image.title="GitHub Copilot CLI container" \
      org.opencontainers.image.description="Debian-based GitHub Copilot CLI container"

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    bash \
    bash-completion \
    bc \
    ca-certificates \
    curl \
    dnsutils \
    gh \
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
    python3-venv \
    ripgrep \
    rsync \
    socat \
    unzip \
    vim \
    wget \
    whois \
  && apt-get clean \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*

# Install development tools and configure Docker-in-Docker
RUN if [ "${TARGETARCH}" = "amd64" ]; then \
  TOOLBOX_VERSION=$(git ls-remote --refs --sort='version:refname' \
      --tags "https://github.com/googleapis/genai-toolbox" \
      | grep -vE 'alpha|beta|rc|dev|None|list|nightly|\{' | cut -d'/' -f3 \
      | tail -n 1) \
  && curl -sSL -o "/usr/local/bin/toolbox" \
      "https://storage.googleapis.com/genai-toolbox/${TOOLBOX_VERSION}/${TARGETOS}/${TARGETARCH}/toolbox" \
  && chmod +x "/usr/local/bin/toolbox"; \
  fi \
  # Install GitHub Copilot CLI (prerelease), Sequential Thinking MCP server, mdflow
  && npm install -g --no-audit --no-fund @github/copilot@prerelease @modelcontextprotocol/server-sequential-thinking mdflow \
  # Install uv (Python package manager)
  && curl -LsSf https://astral.sh/uv/install.sh \
      | UV_INSTALL_DIR=/usr/local/bin sh \
  # Install Docker-in-Docker
  # Note: DinD via QEMU on ARM64 not supported
  # (ARM64 requires ARM64 kernel from host, not available on AMD64 host)
  && curl -fsSL https://get.docker.com | sh \
  && if ! getent group docker > /dev/null 2>&1; then \
       groupadd -g 999 docker; \
     fi \
  && usermod -aG docker "node"

# Configure bash shell for subsequent RUN commands
SHELL ["/usr/bin/bash", "-c"]

# Create symlinks for tools and setup user environment
RUN COPILOT_PATH="/opt/nodejs/node-v${NODE_VERSION}/bin/copilot" \
  && ln -s "${COPILOT_PATH}" /usr/local/bin/copilot \
  && MCP_SERVER_SEQUENTIAL_THINKING_PATH="/opt/nodejs/node-v${NODE_VERSION}/bin/mcp-server-sequential-thinking" \
  && ln -s "${MCP_SERVER_SEQUENTIAL_THINKING_PATH}" /usr/local/bin/mcp-server-sequential-thinking \
  && MDFLOW_PATH="/opt/nodejs/node-v${NODE_VERSION}/bin/mdflow" \
  && ln -s "${MDFLOW_PATH}" /usr/local/bin/mdflow

# Switch to non-root user
USER node

# Install bun (all-in-one JS toolkit)
RUN cp /etc/skel/.bashrc "${HOME}" \
    && curl -fsSL https://bun.com/install | bash \
    && echo 'export PATH=${HOME}/.bun/bin:${PATH}' >> "${HOME}/.bashrc"

WORKDIR /workspace

CMD ["copilot"]
