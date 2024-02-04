FROM ubuntu:lunar

LABEL maintainer="Michael Buluma"
LABEL build_date="2024-02-04"

LABEL org.opencontainers.image.source=https://github.com/buluma/docker-ubuntu-systemd
LABEL org.opencontainers.image.description="Container to test Ansible roles in, including capabilities to use systemd facilities"
LABEL org.opencontainers.image.licenses=Apache-2.0

ENV container docker

# Enable apt repositories.
RUN sed -i 's/# deb/deb/g' /etc/apt/sources.list

# Enable systemd.
RUN apt-get update ; \
    apt-get install -y systemd systemd-sysv sudo ; \
    apt-get clean ; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ; \
    cd /lib/systemd/system/sysinit.target.wants/ ; \
    ls | grep -v systemd-tmpfiles-setup | xargs rm -f $1 ; \
    rm -f /lib/systemd/system/multi-user.target.wants/* ; \
    rm -f /etc/systemd/system/*.wants/* ; \
    rm -f /lib/systemd/system/local-fs.target.wants/* ; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev* ; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl* ; \
    rm -f /lib/systemd/system/basic.target.wants/* ; \
    rm -f /lib/systemd/system/anaconda.target.wants/* ; \
    rm -f /lib/systemd/system/plymouth* ; \
    rm -f /lib/systemd/system/systemd-update-utmp*

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/lib/systemd/systemd"]

CMD tail -f /dev/null
