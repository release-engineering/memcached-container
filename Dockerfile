FROM fedora:33

LABEL org.opencontainers.image.title="memcached" \
      org.opencontainers.image.description="memcached in a container, suitable for running on OpenShift" \
      org.opencontainers.image.vendor="Red Hat EXD Software Production" \
      org.opencontainers.image.authors="C3I Guild <exd-guild-c3i@redhat.com>" \
      org.opencontainers.image.licenses="BSD-3-Clause" \
      org.opencontainers.image.url="https://github.com/release-engineering/memcached-container" \
      org.opencontainers.image.documentation="https://github.com/release-engineering/memcached-container" \
      distribution-scope="public"

RUN dnf -y install memcached && dnf clean all
COPY start-memcached.sh /usr/local/bin/start-memcached.sh
RUN chmod 755 /usr/local/bin/start-memcached.sh

EXPOSE 11211

CMD  ["/usr/local/bin/start-memcached.sh"]
