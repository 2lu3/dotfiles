#!/bin/bash

should_install() {
    COMMAND="$1"

    if [ "$init" == "true" ] || ! type $COMMAND > /dev/null 2>&1; then
        echo "$COMMAND is not installed"
        return 0
    else
        echo "$COMMAND is already installed"
        return 1
    fi
}

apt_install() {
    PACKAGE_NAME="$1"
    COMMAND="$2"

    if [ "$init" == "true" ] || ! type $COMMAND > /dev/null 2>&1; then
        echo "$PACKAGE_NAME is not installed"
        echo "installing $PACKAGE_NAME"
        sudo apt-get install -y $PACKAGE_NAME
    else
        echo "$PACKAGE_NAME is already installed"
    fi
}


brew_install() {
    PACKAGE_NAME="$1"
    COMMAND="$2"

    if [ "$init" == "true" ] || ! type $COMMAND > /dev/null 2>&1; then
        echo "$PACKAGE_NAME is not installed"
        echo "installing $PACKAGE_NAME"
        brew install $PACKAGE_NAME
    else
        echo "$PACKAGE_NAME is already installed"
    fi
}


install() {
    PACKAGE_NAME="$1"
    COMMAND="$2"

    if [ "$init" == "true" ] || ! type $COMMAND > /dev/null 2>&1; then
        echo "$PACKAGE_NAME is not installed"
        echo "installing $PACKAGE_NAME"
        if [ "$(uname)" == "Darwin" ]; then
            brew install $PACKAGE_NAME
        elif [ "$(uname)" == "Linux" ]; then
            sudo apt-get install -y $PACKAGE_NAME
        else
            echo "Unsupported OS: $(uname)"
        fi
    else
        echo "$PACKAGE_NAME is already installed"
    fi
}
