#!/usr/bin/env bash

set -euo pipefail

check_semver "$TOOL_VERSION"

curl --silent --show-error --fail --location --output /tmp/helm-docs.tar.gz https://github.com/norwoodj/helm-docs/releases/download/v"$TOOL_VERSION"/helm-docs_"$TOOL_VERSION"_Linux_x86_64.tar.gz
tar -xf /tmp/helm-docs.tar.gz -C /usr/local/bin/ helm-docs
rm /tmp/helm-docs.tar.gz

helm-docs --version
