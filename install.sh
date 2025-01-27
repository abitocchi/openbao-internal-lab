#!/usr/bin/bash

error() {
    echo "$(date +'%D %T') - ERROR - $1"
}

[ -z "$(which podman)" ] && error "Podman is not present on the host"

podman run \
    --name openbao-server \
    --rm \
    -v ./certs:/etc/bao/certs:z \
    -p 8200:8200 \
    quay.io/openbao/openbao:2.1.1