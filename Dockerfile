FROM archlinux:latest

ENV container docker
ENV LC_ALL C

RUN pacman -Sy \
    && pacman -S systemd --noconfirm \
    && pacman -Scc --noconfirm  \
    && rm -rf /tmp/* /var/tmp/*

RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
    /lib/systemd/system/systemd-update-utmp*

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/lib/systemd/systemd"]
