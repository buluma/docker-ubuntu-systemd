Docker Ubuntu Systemd
=====================

[![Build](https://github.com/buluma/docker-ubuntu-systemd/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/buluma/docker-ubuntu-systemd/actions/workflows/build.yml) [![Build Status](https://travis-ci.com/buluma/docker-ubuntu-systemd.svg?branch=main)](https://travis-ci.com/buluma/docker-ubuntu-systemd)

Branches
--------

This repository one branche that relate to Ubuntu a version.

|Branch |Ubuntu Version        |Docker image tag|
|-------|----------------------|----------------|
|master |jammy (22.04)         |latest          |
|lunar  |lunar lobster (23.04) |lunar           |
|noble  |noble devel (24.04)   |devel           |
|focal  |focal fossa (20.04)   |focal           |
|bionic |bionic beaver (18.04) |bionic          |

Pull strategy
-------------

The different branches are **not** merged, they live as individual branches.

Manually starting
-----------------

```
docker run \
  --tty \
  --privileged \
  --volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
  buluma/docker-ubuntu-systemd
```
