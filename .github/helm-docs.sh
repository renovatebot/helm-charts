#!/bin/bash
set -euo pipefail

HELM_DOCS_VERSION="0.11.0"

# install helm-docs
curl --silent --show-error --fail --location --output /tmp/helm-docs.tar.gz https://github.com/instrumenta/norwoodj/helm-docs/download/"${HELM_DOCS_VERSION}"/helm-docs-linux-amd64.tar.gz
tar -xf /tmp/helm-docs.tar.gz helm-docs

# validate docs
./helm-docs
git diff --exit-code
