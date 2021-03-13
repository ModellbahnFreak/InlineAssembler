cmake_minimum_required(VERSION 3.10)

project(InlineAssembler VERSION 1.2)
add_executable(InlineTest main.cpp)

if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    SET (CMAKE_CXX_FLAGS "-fasm-blocks")
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    SET (CMAKE_GENERATOR "Win32")
    set_property(GLOBAL PROPERTY USE_FOLDERS ON)
    SET (VS_STARTUP_PROJECT "InlineTest")
    set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT InlineTest)
else()
    message(FATAL_ERROR "The project only supports Visual Studio or clang as compiler. Please use one of them.")
endif()

configure_file(InlineAssemblerConfig.h.in InlineAssemblerConfig.h)
