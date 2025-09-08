#!/bin/bash

mkdir -p ./.bin
export PATH="./.bin:$PATH"

set -euxo pipefail

# renovate: datasource=github-releases depName=kubeconform packageName=yannh/kubeconform
KUBECONFORM_VERSION=v0.7.0

# renovate: datasource=github-releases depName=semver2 packageName=Ariel-Rodriguez/sh-semversion-2
#SEMVER_VERSION=v1.0.5

CHART_DIRS="$(git diff --find-renames --name-only "$(git rev-parse --abbrev-ref HEAD)" remotes/origin/main -- charts | cut -d '/' -f 2 | uniq)"

# install kubeconform
curl --silent --show-error --fail --location --output /tmp/kubeconform.tar.gz "https://github.com/yannh/kubeconform/releases/download/${KUBECONFORM_VERSION}/kubeconform-linux-amd64.tar.gz"
tar -C .bin/ -xf /tmp/kubeconform.tar.gz kubeconform

# install semver compare
# curl -sSfLo .bin/semver2 https://raw.githubusercontent.com/Ariel-Rodriguez/sh-semversion-2/${SEMVER_VERSION}/semver2.sh
# chmod +x .bin/semver2

# Compute required kubernetes api versions
apis=()

# if [[ "$(semver2 "${KUBERNETES_VERSION#v}" 1.21.0)" -ge 0 ]]; then
#   apis=("${apis[@]}" --api-versions batch/v1/CronJob)
# else
#   apis=("${apis[@]}" --api-versions batch/v1beta1/CronJob)
# fi

# validate charts
for CHART_DIR in ${CHART_DIRS}; do
  (cd "charts/${CHART_DIR}"; helm dependency build)
  for VALUES_FILE in charts/"${CHART_DIR}"/ci/*.yaml; do
    helm template \
      "${apis[@]}" \
      --values "${VALUES_FILE}" \
      charts/"${CHART_DIR}" | kubeconform \
        -strict \
        -summary \
        -kubernetes-version "${KUBERNETES_VERSION#v}"
  done
done
