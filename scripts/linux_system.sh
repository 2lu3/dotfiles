#!/bin/bash
set -xe

is_all_install=false
is_docker=false
while [ $# -gt 0 ]; do
    case ${1} in
        --all)
            is_all_install=true
            echo "set mode: all install"
        ;;
        --docker)
        is_docker=true
        echo  "set mode: docker"
        ;;
        *) ;;
    esac
    shift
done


# typora
if ! type typora > /dev/null 2>&1; then
    wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
    add-apt-repository 'deb https://typora.io/linux ./'
    apt-get install -y typora
fi

