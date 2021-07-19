#!/bin/bash
set -euxo pipefail

mkdir ./.bin
export PATH="./.bin:$PATH"

# renovate: datasource=github-releases depName=helm-docs lookupName=norwoodj/helm-docs
HELM_DOCS_VERSION=1.5.0

# install helm-docs
curl --silent --show-error --fail --location --output /tmp/helm-docs.tar.gz https://github.com/norwoodj/helm-docs/releases/download/v"${HELM_DOCS_VERSION}"/helm-docs_"${HELM_DOCS_VERSION}"_Linux_x86_64.tar.gz
tar -xf /tmp/helm-docs.tar.gz .bin/helm-docs

# validate docs
helm-docs
git diff --exit-code
