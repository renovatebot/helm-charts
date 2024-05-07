#!/bin/bash
set -e pipefail

# renovate: datasource=github-releases depName=helm-docs packageName=norwoodj/helm-docs
HELM_DOCS_VERSION="v1.13.1"

go run github.com/norwoodj/helm-docs/cmd/helm-docs@"${HELM_DOCS_VERSION}"

# validate docs
git diff --exit-code
