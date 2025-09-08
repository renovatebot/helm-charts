#!/usr/bin/env bash

set -euo pipefail

check_semver "$TOOL_VERSION"

curl --silent --show-error --fail --location --output /tmp/kubeconform.tar.gz "https://github.com/yannh/kubeconform/releases/download/v$TOOL_VERSION/kubeconform-linux-amd64.tar.gz"
tar -xf /tmp/kubeconform.tar.gz -C /usr/local/bin/ kubeconform
rm /tmp/kubeconform.tar.gz

kubeconform -version
