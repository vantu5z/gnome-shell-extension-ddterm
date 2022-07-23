#!/usr/bin/env bash

SCRIPT_DIR=$(CDPATH="" cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

TTY_FLAG=$(test -t 0 && echo -n -t)
UID_GID=$(id -u):$(id -g)

set -ex

exec docker run --init --rm -i $TTY_FLAG -u $UID_GID -v "${SCRIPT_DIR}:${SCRIPT_DIR}" -w "${PWD}" ghcr.io/ddterm/ci-docker-image:master xvfb-run "$@"
