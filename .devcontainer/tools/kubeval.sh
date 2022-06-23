#!/usr/bin/env bash

set -euo pipefail

check_semver "$TOOL_VERSION"

curl --silent --show-error --fail --location --output /tmp/kubeval.tar.gz "https://github.com/instrumenta/kubeval/releases/download/v$TOOL_VERSION/kubeval-linux-amd64.tar.gz"
tar -xf /tmp/kubeval.tar.gz -C /usr/local/bin/ kubeval
rm /tmp/kubeval.tar.gz

kubeval --version
