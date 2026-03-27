FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
  bash \
  curl \
  git \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN chmod +x ./run ./setup runs/*

CMD ["/bin/bash"]
