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

echo "is_all_install $is_all_install"

sudo  -E ./linux_system.sh "$@"
./linux_user.sh "$@"



## openMPI
#if [[ "$is_all_install" = true ]]; then
#    install_log openMPI
#    sudo mkdir /opt/openMPI
#    sudo rm /opt/openMPI/* -rf
#    sudo apt-get install build-essential gfortran
#    curl https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.2.tar.gz --output ~/openmpi.tar.gz 
#    tar -xvf ~/openmpi.tar.gz -C ~
#    rm ~/openmpi.tar.gz
#    cd ~/openmpi-4.1.2/
#    ./configure --prefix=/opt/openMPI CC=gcc CXX=g++ F77=gfortran FC=gfortran
#    make -j
#    sudo make install
#fi

# Git Credential Manager for Linux
#if ! type git-credential-manager-core >/dev/null 2>&1; then
#    install_log "git credential manager for linux"
#    apt_install pass
#    curl -LO https://raw.githubusercontent.com/GitCredentialManager/git-credential-manager/main/src/linux/Packaging.Linux/install-from-source.sh > ~/install-from-source.sh
#    sh ~/install-from-source.sh
#    git-credential-manager-core configure
#fi


