# Files for building a memcached image

This repository contains configuration and supporting files for building a
[memcached](https://memcached.org/) container image. The image is built on the
current [Fedora](https://getfedora.org/) base image. The Dockerfile is based on
the Fedora Cloud [memcached image](https://github.com/fedora-cloud/Fedora-Dockerfiles/tree/master/memcached).

## Build

To build the container in OpenShift, you can run:
```
oc new-build https://github.com/release-engineering/memcached-container
```

## Deployment

The recommended deployment method is OpenShift.

### Configuration

All configuration of the image is handled via environment variables, provided
by your container runtime environment.

- `MEMCACHED_CACHE_SIZE`: Number of MB of memory to use for object storage, the
  default is 64.
- `MEMCACHED_CONNECTIONS`: Max simultaneous connections, the default is 1024.
- `MEMCACHED_THREADS`: Number of threads to use to process incoming requests,
  the default is 4.
- `MEMCACHED_ARGS`: Command-line options to pass directly to memcached.
