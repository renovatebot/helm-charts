#!/usr/bin/env bash

set -euo pipefail

check_semver "$KUBECTL_VERSION"

curl -sSL -o /usr/local/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/v$KUBECTL_VERSION/bin/linux/amd64/kubectl"
chmod +x /usr/local/bin/kubectl

kubectl version --client=true
