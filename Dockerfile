FROM --platform=linux/amd64 ubuntu:latest

ENV DEBIAN_FRONTEND=non-interactive

RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    pkg-config \
    libssl-dev

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Additional steps for CosmWasm dependencies if needed

WORKDIR /code
