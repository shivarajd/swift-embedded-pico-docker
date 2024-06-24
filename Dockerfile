# Start from the latest Swift nightly main toolchain
FROM swiftlang/swift:nightly-main-jammy

# Install the dependencies and the toolchain packages
RUN apt-get update && apt-get install -y \
    git \
    cmake \
    nano \
    python3 \
    gcc-arm-none-eabi \
    libnewlib-arm-none-eabi \
    libstdc++-arm-none-eabi-newlib \
    build-essential \
    ninja-build \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Clone pico-sdk repository and initialize submodules
RUN mkdir -p ~/pico \
    && cd ~/pico \
    && git clone https://github.com/raspberrypi/pico-sdk.git --branch master \
    && cd pico-sdk \
    && git submodule update --init

ENV PICO_SDK_PATH=~/pico/pico-sdk

# Clone pico-examples repository
RUN cd ~/pico \
    && git clone https://github.com/raspberrypi/pico-examples.git --branch master

# Clone swift-embedded-examples repository for pico and pico-w
RUN cd ~/pico \
    && git clone https://github.com/apple/swift-embedded-examples.git --depth 1 --filter=blob:none --sparse \
    && cd swift-embedded-examples \
    && git sparse-checkout set pico-blink-sdk pico-w-blink-sdk \
    && git pull origin main