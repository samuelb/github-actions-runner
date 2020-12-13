#!/bin/bash

set -e

./config.sh --url $GITHUB_REPO \
            --token $GITHUB_TOKEN \
            --name $RUNNER_NAME \
            --labels $RUNNER_LABELS \
            --unattended \
            --replace

exec "$@"
