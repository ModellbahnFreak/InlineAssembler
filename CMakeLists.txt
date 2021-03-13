cmake_minimum_required(VERSION 3.10)

project(InlineAssembler VERSION 1.2)

message("${CMAKE_CXX_COMPILER_ID}")

if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    SET (CMAKE_CXX_FLAGS "-fasm-blocks")
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")

else()
    message(FATAL_ERROR "The project only supports Visual Studio or clang as compiler. Please use one of them")
endif()

add_executable(InlineTest main.cpp)
configure_file(InlineAssemblerConfig.h.in InlineAssemblerConfig.h)
