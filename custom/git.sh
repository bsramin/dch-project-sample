#!/usr/bin/env bash
DESCRIPTION='Git command'

if [ "${1}" == 'go' ]; then
    setImageName "php"
    getContainer
    if [ -z $container ]; then
        show "\n<red>✗ Container not found</red>\n"
    else
        shift 1
        params=''
        for i in "$@"; do
            params+="${i} "
        done

        execute "docker exec -it $container bash -c 'source ~/.bashrc && cd /var/www && git ${params}'";
    fi
fi