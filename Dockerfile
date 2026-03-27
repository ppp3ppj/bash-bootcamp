FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV MISE_RUBY_COMPILE=false

RUN apt-get update && apt-get install -y \
  bash \
  curl \
  git \
  libatomic1 \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN chmod +x ./run ./setup runs/*

CMD ["/bin/bash"]
