FROM ubuntu:noble
RUN apt-get update && apt-get install -y\
                                    clang\
                                    clang-tools \
                                    cmake \
                                    gdb\
                                    ninja-build

RUN ln /usr/bin/clang-scan-deps-17 /usr/bin/clang-scan-deps

RUN clang --version
RUN clang-scan-deps --version
RUN cmake --version
RUN gdb --version
RUN ninja --version
