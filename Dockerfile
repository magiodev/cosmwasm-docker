FROM --platform=linux/amd64 ubuntu:latest

ENV DEBIAN_FRONTEND=non-interactive

RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    pkg-config \
    libssl-dev \
    golang-go \
    libclang-dev \
    clang

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Additional steps for CosmWasm dependencies if needed
## Set $LIBCLANG_DIR environment variable dynamically based on dirname $(find /usr -name libclang.so) output after libclang-dev has been installed
RUN LIBCLANG_DIR=$(dirname $(find /usr -name libclang.so)) && \
    echo "LIBCLANG_PATH=$LIBCLANG_DIR" >> /etc/environment

WORKDIR /code