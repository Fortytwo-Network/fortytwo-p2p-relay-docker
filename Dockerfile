# INDEX-DIGEST sha256:936abff852736f951dab72d91a1b6337cf04217b2a77a5eaadc7c0f2f1ec1758
FROM debian:12-slim


RUN apt-get update && apt-get install -y \
    ca-certificates \
    libssl3 \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

ENV RELAY_EXEC="/workspace/relay"

COPY scripts/install.sh . 
RUN chmod +x install.sh && sh ./install.sh

COPY scripts/cmd.sh . 
CMD ["/bin/sh", "/workspace/cmd.sh"]
