#!/bin/bash

should_install() {
    COMMAND="$1"

    if [ "$init" == "true" ] || ! type $COMMAND > /dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

apt_install() {
    PACKAGE_NAME="$1"
    COMMAND="$2"

    if [ "$init" == "true" ] || ! type $COMMAND > /dev/null 2>&1; then
        sudo apt-get install -y $PACKAGE_NAME
    else
        echo "$PACKAGE_NAME is already installed"
    fi
}
