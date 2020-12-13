FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    libicu63 \
    libkrb5-3 \
    liblttng-ust0 \
    libssl1.1 \
    zlib1g \
    && rm -rf /var/lib/apt/lists/*

RUN useradd --system --shell /bin/bash --create-home \
    --home-dir /actions-runner \
    actions-runner

USER actions-runner

WORKDIR /actions-runner

RUN curl -L https://github.com/actions/runner/releases/download/v2.274.1/actions-runner-linux-x64-2.274.1.tar.gz | tar xz \
    && chown -R actions-runner: /actions-runner

ADD entrypoint.sh entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
CMD ["./run.sh"]
