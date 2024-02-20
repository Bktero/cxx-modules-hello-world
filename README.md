# "hello, world" with C++ modules

## What we need

- clang 17 = https://en.cppreference.com/w/cpp/compiler_support
- cmake 3.28 = https://cmake.org/cmake/help/latest/manual/cmake-cxxmodules.7.html
- Ninja 1.11

The next version of Ubuntu, Noble Numbat (which will be 24.04 http://cdimage.ubuntu.com/daily-live/pending/) comes with the versions we need.
To check the content of the packages, see https://packages.ubuntu.com/

## Dockerfile

We use `ubuntu:noble` as the base image. We add the packages for the tools listed above.

We add gdb to be compatible with CLion and `clang-tools` to get `clang-scan-deps`.
The link avoid an error like `/bin/sh: 1: CMAKE_CXX_COMPILER_CLANG_SCAN_DEPS-NOTFOUND: not found`.
See https://stackoverflow.com/questions/77800212/clang-scan-deps-was-not-found-while-trying-to-build-c-20-modules

## Build Docker image

```bash
docker build --tag cxx_modules .
```

## Execute "hello, world"

## By hand

Just for fun, let's build the project without CMake.

Get a shell inside the container:

```bash
docker run --rm -it -v $(pwd):/cxx_modules cxx_modules
```

From the container:

```bash
cd cxx_modules
clang++ -std=c++20 helloworld.cppm --precompile -o helloworld.pcm
clang++ -std=c++20 main.cpp -fmodule-file=helloworld=helloworld.pcm helloworld.pcm
./a.out
```

This prints `hello, world (with a module)`.

## With CMake

With CMake, it's much easier. Easier :

- configure CLion to use a Docker toolchain: https://www.jetbrains.com/help/clion/clion-toolchains-in-docker.html
  - manually set "Build Tool" / "C Compiler" / "C++ Compiler" to "ninja", "clang", "clang++"
- or use a shell inside the container to build the project like any CMake project

We will get the same output to the console.
