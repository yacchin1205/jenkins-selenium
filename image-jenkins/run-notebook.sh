#!/bin/bash

INPUT_NOTEBOOK=$1
OUTPUT_NOTEBOOK=$2
TEMP_NOTEBOOK=/tmp/`date '+%Y%m%d'`-${INPUT_NOTEBOOK}
docker exec -i ${JUPYTER_CONTAINER_NAME} papermill /home/jovyan/${INPUT_NOTEBOOK} ${TEMP_NOTEBOOK} && \
docker cp ${JUPYTER_CONTAINER_NAME}:${TEMP_NOTEBOOK} ${OUTPUT_NOTEBOOK}
