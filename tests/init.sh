#!/usr/bin/env bash

log(){
    timestamp=$(date +"%D %T")
    echo "$timestamp $1 $2"
}

export BAO_ADDR="https://openbao1.lab.local:8200"
export BAO_SKIP_VERIFY="true"
export BAO_TOKEN="s.BqHpxZ0akNYPF21vx4gKs4Kg"

[ -z "$BAO_TOKEN" ] && exit 1

response=$(bao status 2>&1)
[ "$?" -ne 0 ] && echo "$response" && exit 1