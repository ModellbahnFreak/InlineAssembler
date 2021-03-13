cmake_minimum_required(VERSION 3.10)

project(InlineAssembler VERSION 1.2)

add_executable(InlineTest main.cpp)
configure_file(InlineAssemblerConfig.h.in InlineAssemblerConfig.h)

SET (CMAKE_CXX_FLAGS_INIT "-fsam-blocks")