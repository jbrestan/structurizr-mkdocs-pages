#!/usr/bin/env bash

DOCS_PATH=$( cd "$(dirname "$0")" ; pwd -P )
echo "Starting structurizr/lite in $DOCS_PATH"
docker pull structurizr/lite
docker run -it --rm -p 8080:8080 -v $DOCS_PATH:/usr/local/structurizr structurizr/lite