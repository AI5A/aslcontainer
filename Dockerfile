FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y curl && \
    curl -o /etc/apt/trusted.gpg.d/ai5a-asl.asc https://raw.githubusercontent.com/AI5A/asl-pkgs/main/pkg_pub_key.asc && \
    echo "deb [signed-by=/etc/apt/trusted.gpg.d/ai5a-asl.asc] https://repo.ai5a.net/deb/$(grep VERSION_CODENAME /etc/os-release | cut -d= -f2) $(grep VERSION_CODENAME /etc/os-release | cut -d= -f2) main" > /etc/apt/sources.list.d/ai5a-asl.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y wget supervisor asl-update-node-list asl-asterisk && \
    rm -rf /etc/asterisk

COPY supervisor.conf /etc/supervisor/conf.d/asl.conf

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
