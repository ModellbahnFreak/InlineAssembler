#!/bin/sh

if (! command -v clang++ > /dev/null) ;
then
    echo "Clang wasn't found. This means it's propably not installed."
    read -p "Dou you want the script to try to install clang now? (y/N) " yNinput
    case $yNinput in
    [yY]*) 
        if [ command -v apt-get &> /dev/null ]
        then
            sudo apt-get install clang || (echo "Installation using apt-get unsucessfull" && exit 1)
        elif [ command -v pacman &> /dev/null ]
        then
            sudo pacman -S clang || (echo "Installation using pacman unsucessfull" && exit 1)
        elif [ command -v zypper &> /dev/null ]
        then
            sudo zypper install clang || (echo "Installation using zypper unsucessfull" && exit 1)
        elif [ command -v brew &> /dev/null ]
        then
            sudo brew install clang || (echo "Installation using brew unsucessfull" && exit 1)
        else
            echo "Couldn't find any package manager to install clang automatically. Please install it manually for your OS."
            echo "(see https://clang.llvm.org/ for instructions)"
            exit 1
        fi
        if (! command -v clang++ > /dev/null) ;
        then
            echo "Installation of clang was either unsuccessfull or clang wasn't added to PATH and couldn't be found."
            echo "(see https://clang.llvm.org/ for instructions)"
            exit 1
        fi ;;
    * )
        echo "Please install clang!"
        echo "(see https://clang.llvm.org/ for instructions)"
        exit 1 ;;
    esac
fi

if (! command -v cmake > /dev/null) ;
then
    echo "CMake wasn't found. This means it's propably not installed."
    read -p "Dou you want the script to try to install CMake now? (y/N) " yNinput
    case $yNinput in
    [yY]*) 
        if [ command -v apt-get &> /dev/null ]
        then
            sudo apt-get install cmake || (echo "Installation using apt-get unsucessfull" && exit 1)
        elif [ command -v pacman &> /dev/null ]
        then
            sudo pacman -S cmake || (echo "Installation using pacman unsucessfull" && exit 1)
        elif [ command -v zypper &> /dev/null ]
        then
            sudo zypper install cmake || (echo "Installation using zypper unsucessfull" && exit 1)
        elif [ command -v brew &> /dev/null ]
        then
            sudo brew install cmake || (echo "Installation using brew unsucessfull" && exit 1)
        else
            echo "Couldn't find any package manager to install CMake automatically. Please install it manually for your OS."
            echo "(see https://cmake.org/ for instructions)"
            exit 1
        fi
        if (! command -v cmake > /dev/null) ;
        then
            echo "Installation of CMake was either unsuccessfull or CMake wasn't added to PATH and couldn't be found."
            echo "(see https://cmake.org/ for instructions)"
            exit 1
        fi ;;
    * )
        echo "Please install CMake!"
        echo "(see https://cmake.org/ for instructions)"
        exit 1 ;;
    esac
fi

( CC=clang && CXX=clang++ && cmake --cmake-clean-cache . ) || ( echo "Error during configuration. There are propably helpfull messages above. Re-run this script once errors are resolved." && exit 1 )

echo "Configuration successfull."
echo "You can now compile and build the application (on linux most likely using 'make')"