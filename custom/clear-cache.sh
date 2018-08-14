#!/usr/bin/env bash
DESCRIPTION='Clear the project cache'

if [ "${1}" == 'go' ]; then
    setImageName "php"
    getContainer
    if [ -z $container ]; then
        show "\n<red>✗ Container not found</red>\n"
    else
        execute "docker exec -it $container bash -c 'source ~/.bashrc && cd /var/www/var/cache && rm -rf *'";
    fi
fi