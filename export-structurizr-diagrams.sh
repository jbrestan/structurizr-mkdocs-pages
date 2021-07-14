#!/usr/bin/env bash

DOCS_PATH=$( cd "$(dirname "$0")" ; pwd -P )
docker pull ghcr.io/aidmax/structurizr-cli-docker
docker run --rm -it -v $DOCS_PATH:/root/data -w /root/data ghcr.io/aidmax/structurizr-cli-docker \
    export --workspace workspace.dsl --format mermaid --output $DOCS_PATH/diagrams/
