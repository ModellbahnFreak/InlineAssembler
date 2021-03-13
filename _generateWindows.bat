@echo off

where /q cmake
IF ERRORLEVEL 1 (
    echo "CMake wasn't found. This means it's propably not installed."
    echo "Please download and install CMake"
    echo "IMPORTAND: Make sure, you set CMake to be included in PATH"
    pause
    start https://github.com/Kitware/CMake/releases/latest
)

cmake -A Win32 .
start .\InlineAssembler.sln