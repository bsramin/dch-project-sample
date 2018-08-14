#!/usr/bin/env bash
DESCRIPTION='View the project logs'

if [ "${1}" == 'go' ]; then
    setImageName "php"
    getContainer
    if [ -z $container ]; then
        show "\n<red>✗ Container not found</red>\n"
    else
        execute "docker exec -it $container bash -c 'source ~/.bashrc && tail -f /var/www/var/log/*'";
    fi
fi