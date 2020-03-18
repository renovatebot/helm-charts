#!/bin/bash
set -euo pipefail

KUBEVAL_VERSION="0.14.0"
SCHEMA_LOCATION="https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/"

# install kubeval
curl --silent --show-error --fail --location --output /tmp/kubeval.tar.gz https://github.com/instrumenta/kubeval/releases/download/"${KUBEVAL_VERSION}"/kubeval-linux-amd64.tar.gz
sudo tar -C /usr/local/bin -xf /tmp/kubeval.tar.gz kubeval

# validate charts
helm template charts/renovate --set renovate.config=' ' | kubeval --strict --ignore-missing-schemas --kubernetes-version "${KUBERNETES_VERSION#v}" --schema-location "${SCHEMA_LOCATION}"
