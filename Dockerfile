FROM debian:latest
RUN apt update
RUN apt install -y systemd ssh
RUN systemctl enable ssh
ENTRYPOINT ["/bin/systemd"]
