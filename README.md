# Embedded Swift Development for Raspberry Pi Pico using Docker

This repository provides a Docker-based setup for developing embedded Swift applications for the Raspberry Pi Pico and Pico W microcontrollers using [Raspberry Pi Pico SDK](https://github.com/raspberrypi/pico-sdk.git). The instructions below guide you through building and running a Docker container and compiling [Embedded Swift Examples](https://github.com/apple/swift-embedded-examples.git) for the Raspberry Pi Pico and Pico W.

## Prerequisites

- Docker installed on your system.
- Raspberry Pi Pico or Pico W.

## Getting Started

### Cloning the Repository

Clone this repository using the following command:

```sh
git clone https://github.com/shivarajd/swift-embedded-pico-docker.git
```

Navigate into the cloned repository’s directory:

```sh
cd swift-embedded-pico-docker
```

### Building the Docker Image

To build the Docker image, run the following command:

```sh
docker build -t embedded-swift-rpi-pico .
```

### Running the Docker Container

To run the Docker container, execute the following command:
#### macOS and Ubuntu (Bash Shell):
```sh
docker run -it --name swift-embedded-pico -v $(pwd):/mnt embedded-swift-rpi-pico
```
#### Windows with PowerShell:
```sh
docker run -it --name swift-embedded-pico -v ${pwd}:/mnt embedded-swift-rpi-pico
```
#### Windows with Command Prompt:
```sh
docker run -it --name swift-embedded-pico -v "%cd%":/mnt embedded-swift-rpi-pico
```

This command mounts the current directory to `/mnt` inside the Docker container, allowing you to access files on your host machine from within the container.

## Examples

### Pico Blink Example

Follow these steps to compile the blink example for the Raspberry Pi Pico:

1. Navigate to the example directory:
    ```sh
    cd /root/pico/swift-embedded-examples/pico-blink-sdk
    ```

2. Set the target board and generate build files with CMake:
    ```sh
    cmake -B build -G Ninja -S . -D PICO_BOARD=pico
    ```

3. Build the project:
    ```sh
    cmake --build build
    ```

4. Copy the generated UF2 file to the mounted directory:
    ```sh
    cp build/swift-blinky.uf2 /mnt/swift-blinky-pico.uf2
    ```

### Pico W Blink Example

Follow these steps to compile the blink example for the Raspberry Pi Pico W:

1. Navigate to the example directory:
    ```sh
    cd /root/pico/swift-embedded-examples/pico-w-blink-sdk
    ```

2. Set the target board and generate build files with CMake:
    ```sh
    cmake -B build -G Ninja -S . -D PICO_BOARD=pico_w
    ```

3. Build the project:
    ```sh
    cmake --build build
    ```

4. Copy the generated UF2 file to the mounted directory:
    ```sh
    cp build/swift-blinky.uf2 /mnt/swift-blinky-pico-w.uf2
    ```
### Stopping and Restarting the Container
You can stop and start the container without losing data.

To **stop** the docker container, run the following command:
```sh
docker stop swift-embedded-pico
```
To **start** the docker container, run the following command:
```sh
docker start -i swift-embedded-pico
```
## Programming
- Connect the Pico or Pico W board via a USB cable to your computer, and make sure it's in the USB Mass Storage firmware upload mode (either hold the BOOTSEL button while plugging the board, or make sure your Flash memory doesn't contain any valid firmware).
- Copy the UF2 firmware to the Mass Storage device.
- The green LED should now be blinking in a pattern.