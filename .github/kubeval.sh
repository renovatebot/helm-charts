#!/bin/bash
set -euxo pipefail


# renovate: datasource=github-releases depName=kubeval lookupName=instrumenta/kubeval
KUBEVAL_VERSION=v0.16.1

CHART_DIRS="$(git diff --find-renames --name-only "$(git rev-parse --abbrev-ref HEAD)" remotes/origin/main -- charts | cut -d '/' -f 2 | uniq)"
SCHEMA_LOCATION="https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/"

# install kubeval
curl --silent --show-error --fail --location --output /tmp/kubeval.tar.gz https://github.com/instrumenta/kubeval/releases/download/"${KUBEVAL_VERSION}"/kubeval-linux-amd64.tar.gz
tar -xf /tmp/kubeval.tar.gz kubeval

# add helm repos
helm repo add bitnami https://charts.bitnami.com/bitnami

# TODO: conditionally
apis=-a batch/v1beta1/CronJob

# validate charts
for CHART_DIR in ${CHART_DIRS}; do
  (cd charts/${CHART_DIR}; helm dependency build)
  helm template --values charts/"${CHART_DIR}"/ci/ci-values.yaml charts/"${CHART_DIR}" \
    $apis \
    | ./kubeval --strict --ignore-missing-schemas --kubernetes-version "${KUBERNETES_VERSION#v}" --schema-location "${SCHEMA_LOCATION}"
done
