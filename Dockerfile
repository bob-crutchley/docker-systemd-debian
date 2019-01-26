FROM debian:latest
RUN apt update
RUN apt install -y systemd ssh openssl
RUN systemctl enable ssh
# delegate user
RUN useradd --create-home --password "$(openssl passwd -1 password)" delegate
RUN passwd -e delegate
RUN usermod --shell /bin/bash delegate
VOLUME ["/sys/fs/cgroup"]
ENTRYPOINT ["/bin/systemd"]
