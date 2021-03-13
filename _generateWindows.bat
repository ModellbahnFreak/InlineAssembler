@echo off

where /q cmake
IF ERRORLEVEL 1 (
    "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake" --help >nul 2>&1
    IF %errorlevel% != 0 (
        "C:\Program Files\Microsoft Visual Studio\2019\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake" --help >nul 2>&1
        IF %errorlevel% != 0 (
            echo "This application requires an installed Visual Studio and CMake."
            echo "CMake wasn't found. This means it's propably not installed."
            echo "Please download and install CMake"
            echo "IMPORTAND: Make sure, you set CMake to be included in PATH"
            pause
            start https://github.com/Kitware/CMake/releases/latest
            exit 1
        )
    )
)

cmake -A Win32 .
start .\InlineAssembler.sln