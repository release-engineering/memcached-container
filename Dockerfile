FROM registry.fedoraproject.org/fedora-minimal:33

ENV MEMCACHED_VERSION="1.6.6"

LABEL name="memcached" \
      version="$MEMCACHED_VERSION" \
      vendor="Red Hat EXD Software Production" \
      license="BSD-3-Clause" \
      org.opencontainers.image.title="memcached" \
      org.opencontainers.image.version="$MEMCACHED_VERSION" \
      org.opencontainers.image.description="memcached in a container, suitable for running on OpenShift" \
      org.opencontainers.image.vendor="Red Hat EXD Software Production" \
      org.opencontainers.image.authors="C3I Guild <exd-guild-c3i@redhat.com>" \
      org.opencontainers.image.licenses="BSD-3-Clause" \
      org.opencontainers.image.url="https://github.com/release-engineering/memcached-container" \
      org.opencontainers.image.source="https://github.com/release-engineering/memcached-container" \
      org.opencontainers.image.documentation="https://github.com/release-engineering/memcached-container" \
      distribution-scope="public"

EXPOSE 11211
CMD  ["/usr/local/bin/start-memcached.sh"]

RUN microdnf -y install memcached && microdnf clean all
COPY start-memcached.sh /usr/local/bin/start-memcached.sh
RUN chmod 755 /usr/local/bin/start-memcached.sh

USER 1001
