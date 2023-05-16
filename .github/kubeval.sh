#!/bin/bash

mkdir -p ./.bin
export PATH="./.bin:$PATH"

set -euxo pipefail

# renovate: datasource=github-releases depName=kubeval packageName=instrumenta/kubeval
KUBEVAL_VERSION=v0.16.1

# renovate: datasource=github-releases depName=semver2 packageName=Ariel-Rodriguez/sh-semversion-2
SEMVER_VERSION=v1.0.5

CHART_DIRS="$(git diff --find-renames --name-only "$(git rev-parse --abbrev-ref HEAD)" remotes/origin/main -- charts | cut -d '/' -f 2 | uniq)"
SCHEMA_LOCATION="https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/"

# install kubeval
curl --silent --show-error --fail --location --output /tmp/kubeval.tar.gz https://github.com/instrumenta/kubeval/releases/download/"${KUBEVAL_VERSION}"/kubeval-linux-amd64.tar.gz
tar -C .bin/ -xf /tmp/kubeval.tar.gz kubeval

# install semver compare
curl -sSfLo .bin/semver2 https://raw.githubusercontent.com/Ariel-Rodriguez/sh-semversion-2/${SEMVER_VERSION}/semver2.sh
chmod +x .bin/semver2

# Compute required kubernetes api versions
apis=()

if [[ "$(semver2 "${KUBERNETES_VERSION#v}" 1.21.0)" -ge 0 ]]; then
  apis=("${apis[@]}" --api-versions batch/v1/CronJob)
else
  apis=("${apis[@]}" --api-versions batch/v1beta1/CronJob)
fi

# validate charts
for CHART_DIR in ${CHART_DIRS}; do
  (cd "charts/${CHART_DIR}"; helm dependency build)
  for VALUES_FILE in charts/"${CHART_DIR}"/ci/*.yaml; do
    helm template \
      "${apis[@]}" \
      --values "${VALUES_FILE}" \
      charts/"${CHART_DIR}" | kubeval \
        --strict \
        --ignore-missing-schemas \
        --kubernetes-version "${KUBERNETES_VERSION#v}" \
        --schema-location "${SCHEMA_LOCATION}"
  done
done
