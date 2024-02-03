# jnote

[![Docker](https://github.com/Agitolyev/jnote/actions/workflows/docker-publish.yml/badge.svg?branch=main)](https://github.com/Agitolyev/jnote/actions/workflows/docker-publish.yml)

## Description

`jnote` is a Jupyter notebook based project initially created for personal use and now shared with the community. It comes with pre-installed libraries for various tasks including visualization, computer vision, natural language processing, and automation of day-to-day management responsibilities. Whether you're a data scientist, a manager, or someone who loves automating tasks, `jnote` could be a useful tool for you. It aims to provide a ready-to-use environment to perform daily tasks efficiently.

## Prerequisites

Before you begin, ensure you have met the following requirements:

* You have installed the latest version of [Docker](https://www.docker.com/products/docker-desktop).

## Installation

To install `jnote`, follow these steps:

1. Pull the Docker image:

    ```bash
    docker pull ghcr.io/agitolyev/jnote
    ```

2. Run the Docker image:

    Linux
    ```bash
    docker run -d --rm --name jnote -p 8888:8888 -v "$PWD":/home/jovyan/work ghcr.io/agitolyev/jnote:latest
    ```

    MacOS
    ```bash
    docker run -d --platform linux/amd64 --rm --name jnote -p 8888:8888 -v "$PWD":/home/jovyan/work ghcr.io/agitolyev/jnote:latest
    ```

    - `docker run`: This command is used to start a new Docker container.

    - `-d`: This option runs the container in detached mode, which means it runs in the background and doesn't block your terminal.

    - `--rm`: This option automatically removes the container when it exits. This is useful to not fill up your system with old, unused containers.

    - `--name jnote`: This option assigns the name `jnote` to the container. This can be useful for referencing the container in other Docker commands.

    - `-p 8888:8888`: This option maps the port 8888 of the container to the port 8888 of the host machine. This is necessary for accessing the Jupyter notebook, which by default runs on port 8888.

    - `-v "$PWD":/home/jovyan/work`: This option mounts the current directory (`$PWD`) on the host machine to the `/home/jovyan/work` directory in the container. This allows you to access and save files from your Jupyter notebook to your local machine.

    - `ghcr.io/agitolyev/jnote:latest`: This is the name of the Docker image to run. `ghcr.io/agitolyev/jnote:latest` refers to the `latest` version of the `jnote` image from the GitHub Container Registry (ghcr.io) under the user `agitolyev`.

The command for MacOS is the same, with the addition of `--platform linux/amd64`. This option specifies that the Docker engine should run the image as a Linux platform with AMD64 architecture. This is necessary because Docker on MacOS runs containers within a Linux VM, and this option ensures compatibility.

3. Add the following line to your rc file (e.g., `.bashrc`, `.zshrc`):
    
    This will allow you to start `jnote` by simply typing `jnote` in your terminal.

    Linux
    ```bash
    alias jnote='docker run -d --rm --name jnote -p 8888:8888 -v "$PWD":/home/jovyan/work ghcr.io/agitolyev/jnote:latest'
    ```
    MacOS
    ```bash
    alias jnote='docker run -d --platform linux/amd64 --rm --name jnote -p 8888:8888 -v "$PWD":/home/jovyan/work ghcr.io/agitolyev/jnote:latest'
    ```

## Usage

To use `jnote`, follow these steps:

1. Navigate to the directory you want to mount:

    ```bash
    cd /path/to/your/directory
    ```

2. Run the Docker image:

    ```bash
    docker run -d --rm --name jnote -p 8888:8888 -v "$PWD":/home/jovyan/work ghcr.io/agitolyev/jnote:latest
    ```

3. Check the logs for the access URL:

    ```bash
    docker logs jnote
    ```

    Look for a line that says something like `http://127.0.0.1:8888/?token=...`. This is your access URL.

4. Open your web browser and visit the access URL. You should now have access to a Jupyter notebook with your directory mounted.

Remember, any changes you make in the Jupyter notebook will be saved to your local directory.
