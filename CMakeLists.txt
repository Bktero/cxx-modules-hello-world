cmake_minimum_required(VERSION 3.28)

project(bakasable)

set(CMAKE_CXX_STANDARD 20)

add_executable(bakasable)
target_sources(bakasable PUBLIC
        main.cpp
)
target_sources(bakasable PUBLIC
        FILE_SET all_my_modules TYPE CXX_MODULES FILES
        helloworld.cppm
)
target_compile_options(bakasable PUBLIC
        -Wall -Wextra -Wconversion
)

target_include_directories(bakasable PUBLIC
        /home/pierre/gitlab/octopus-cpp20/common/rvnmetadata/test/
)