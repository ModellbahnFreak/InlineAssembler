#!/bin/bash

if  ! command -v clang++ &> /dev/null
then
    echo "Clang wasn't found. This means it's propably not installed."
    read -p "Dou you want the script to try to install clang now? (y/N) " yNinput
    if [[ $yNinput =~ ^[Yy]$ ]]
    then
        if command -v apt-get &> /dev/null
        then
            sudo apt-get install clang || (echo "Installation using apt-get unsucessfull" && exit 1)
        elif command -v pacman &> /dev/null
        then
            sudo pacman -S clang || (echo "Installation using pacman unsucessfull" && exit 1)
        elif command -v zypper &> /dev/null
        then
            sudo zypper install clang || (echo "Installation using zypper unsucessfull" && exit 1)
        elif command -v brew &> /dev/null
        then
            sudo brew install clang || (echo "Installation using brew unsucessfull" && exit 1)
        else
            echo "Couldn't find any package manager to install clang automatically. Please install it manually for your OS."
        fi
        if (! command -v clang++ &> /dev/null) || (! command -v clang &> /dev/null)
        then
            echo "Installation of clang was either unsuccessfull or clang wasn't added to PATH and couldn't be found."
            exit 1
        fi
    else
        echo "Please install clang!"
        exit 1
    fi
fi
CC=clang && CXX=clang++ && cmake --cmake-clean-cache .