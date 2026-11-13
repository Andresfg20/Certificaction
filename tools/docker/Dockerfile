# Entorno reproducible para compilar y probar los proyectos Cangjie en Linux.
# El SDK no se descarga aquí: colócalo en .sdk/ (raíz del repo) antes de construir.
#   .sdk/cangjie-sdk-linux-x64-<versión>.tar.gz
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      binutils libc-dev libc++-dev libgcc-11-dev libstdc++-11-dev \
      ca-certificates bash \
 && rm -rf /var/lib/apt/lists/*

COPY .sdk/ /tmp/sdk/
RUN set -eux; \
    archivo="$(ls /tmp/sdk/cangjie-sdk-linux-*.tar.gz | head -1)"; \
    tar -xzf "$archivo" -C /opt; \
    rm -rf /tmp/sdk; \
    echo 'source /opt/cangjie/envsetup.sh' >> /etc/bash.bashrc

WORKDIR /workspace
SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["/bin/bash", "-c", "source /opt/cangjie/envsetup.sh && exec \"$@\"", "--"]
CMD ["bash", "scripts/probar-todo.sh"]
