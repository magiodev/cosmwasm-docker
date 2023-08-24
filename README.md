# Rust CosmWasm Development Environment

This repository provides a Docker-based development environment for Rust CosmWasm smart contracts.

## Building the Docker Image

1. Navigate to the directory containing the `Dockerfile`.
2. Build the Docker image:

```bash
docker build -t cosmwasm-dev .
```

## Using the Development Environment

### Temporary variant

1. To run the Docker container and mount your local code directory:

```bash
docker run -it --rm -v /path/to/your/code:/code cosmwasm-dev /bin/bash
```

### Persistent variant

```bash
docker run -it -v /path/to/your/code:/code --name my_cosmwasm_container cosmwasm-dev /bin/bash
docker start -ai my_cosmwasm_container
```

Replace `/path/to/your/code` with the path to your Rust CosmWasm project on your host machine.

2. Once inside the container, you can navigate to the `/code` directory to compile and test your Rust code.

## Notes

- Ensure Docker has adequate resources (RAM, CPU) allocated in its settings for optimal performance.
- Any changes made in the `/code` directory inside the container will reflect in your local directory on the host machine and vice versa.

## Additional Notes

1. This setup is a basic starting point. Depending on the specific requirements of CosmWasm or any other dependencies you may need, you might have to extend the Dockerfile.
2. Remember to replace /path/to/your/code in the README with the actual path to your Rust project on your macOS host.
3. Make sure Docker Desktop is installed on your macOS and is running when you try the commands.
4. After making changes to your code on your macOS host, you can go into the Docker container, navigate to /code, and run cargo build or cargo test as needed.
