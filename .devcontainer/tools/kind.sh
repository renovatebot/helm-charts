#!/usr/bin/env bash

set -euo pipefail

check_semver "$TOOL_VERSION"

curl --silent --show-error --fail --location --output /usr/local/bin/kind "https://github.com/kubernetes-sigs/kind/releases/download/v$TOOL_VERSION/kind-linux-amd64"
chmod +x /usr/local/bin/kind

kind version
