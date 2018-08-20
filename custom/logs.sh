#!/usr/bin/env bash
DESCRIPTION='View the project logs'

if [ "${1}" == 'go' ]; then
    setImageName "php"
    OS=`uname -s`
    getContainer
    if [ -z $container ]; then
        show "\n<red>✗ Container not found</red>\n"
    else
        logpath=$(docker inspect --format '{{ .Mountpoint }}' ${docker_namespace}_log-data)
        if [ $OS != "Darwin" ]; then
            execute "tail -f ${logpath}/*"
        else
            logFiles=$(docker run -it --rm --privileged --pid=host justincormack/nsenter1 /bin/sh -c "ls -A ${logpath}/")
            if [ -z "${logFiles}" ]; then
                show "\n<red>✗ No log files found</red>\n"
            else
                execute "docker run -it --rm --privileged --pid=host justincormack/nsenter1 /bin/sh -c 'tail -f ${logpath}/*'"
            fi
        fi
    fi
fi