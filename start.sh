#!/usr/bin/env bash

local_dir=` pwd `'/local_data'
APP_HOME='/home/elena_basic' # should be the same as Dockerfile ENV MODULE_NAME=elena_basic

echo Using:
echo    ${local_dir} as working directory

docker run  --name elena \
        --rm \
        -v ${local_dir}:${APP_HOME}/data \
        elena/elena

# for test
#docker run --name elena --rm -ti -v  ${local_dir}:${APP_HOME}/data /bin/bash
