# Embedded Swift Development for Raspberry Pi Pico using Docker

This repository provides a Docker-based setup for developing embedded Swift applications for the Raspberry Pi Pico and Pico W microcontrollers. The instructions below guide you through building and running a Docker container and compiling blink examples for the Raspberry Pi Pico and Pico W.

## Prerequisites

- Docker installed on your system.
- Raspberry Pi Pico or Pico W.

## Getting Started

### Building the Docker Image

To build the Docker image, run the following command:

```sh
docker build -t embedded-swift-rpi-pico .
```

### Running the Docker Container

To run the Docker container, execute the following command:

```sh
docker run -it -v $(pwd):/mnt embedded-swift-rpi-pico /bin/bash
```

This command mounts the current directory to `/mnt` inside the Docker container, allowing you to access files on your host machine from within the container.

## Examples

### Pico Blink Example

Follow these steps to compile the blink example for the Raspberry Pi Pico:

1. Navigate to the example directory:
    ```sh
    cd ~/pico/swift-embedded-examples/pico-blink-sdk
    ```

2. Edit the `CMakeLists.txt` file:
    ```sh
    nano CMakeLists.txt
    ```

3. Comment out the line:
    ```cmake
    execute_process(COMMAND xcrun -f swiftc OUTPUT_VARIABLE SWIFTC OUTPUT_STRIP_TRAILING_WHITESPACE)
    ```
    and add the following line:
    ```cmake
    set(SWIFTC /usr/bin/swiftc)
    ```

4. Set the target board:
    ```sh
    export PICO_BOARD=pico
    ```

5. Generate build files with CMake:
    ```sh
    cmake -B build -G Ninja .
    ```

6. Build the project:
    ```sh
    cmake --build build
    ```

7. Copy the generated UF2 file to the mounted directory:
    ```sh
    cp build/swift-blinky.uf2 /mnt/swift-blinky-pico.uf2
    ```

### Pico W Blink Example

Follow these steps to compile the blink example for the Raspberry Pi Pico W:

1. Navigate to the example directory:
    ```sh
    cd ~/pico/swift-embedded-examples/pico-w-blink-sdk
    ```

2. Edit the `CMakeLists.txt` file:
    ```sh
    nano CMakeLists.txt
    ```

3. Comment out the line:
    ```cmake
    execute_process(COMMAND xcrun -f swiftc OUTPUT_VARIABLE SWIFTC OUTPUT_STRIP_TRAILING_WHITESPACE)
    ```
    and add the following line:
    ```cmake
    set(SWIFTC /usr/bin/swiftc)
    ```

4. Set the target board:
    ```sh
    export PICO_BOARD=pico_w
    ```

5. Generate build files with CMake:
    ```sh
    cmake -B build -G Ninja .
    ```

6. Build the project:
    ```sh
    cmake --build build
    ```

7. Copy the generated UF2 file to the mounted directory:
    ```sh
    cp build/swift-blinky.uf2 /mnt/swift-blinky-pico-w.uf2
    ```
## Running
- Connect the Pico or Pico W board via a USB cable to your computer, and make sure it's in the USB Mass Storage firmware upload mode (either hold the BOOTSEL button while plugging the board, or make sure your Flash memory doesn't contain any valid firmware).
- Copy the UF2 firmware to the Mass Storage device.
- The green LED should now be blinking in a pattern.