FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
# add PATH for games binaries
ENV PATH="$PATH:/usr/games"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      bash \
      netcat-openbsd \
      fortune-mod \
      fortunes \
      cowsay && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY wisecow.sh /app/wisecow.sh
RUN sed -i 's/\r$//' /app/wisecow.sh && chmod +x /app/wisecow.sh

EXPOSE 4499
ENTRYPOINT ["/app/wisecow.sh"]
