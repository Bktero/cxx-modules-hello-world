module;

#include <iostream>

export module helloworld;

export void hello() {
    std::cout << "hello, world (with a module)" << '\n';
}
