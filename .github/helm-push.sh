#!/bin/bash

set -ex

PKG_REGEX="^.cr-release-packages\/([a-z-]+)-([0-9]+\.[0-9]+\.[0-9]+)\.tgz$"
OWNER=$1

for pkg in .cr-release-packages/*; do
  if [[ ! "${pkg}" =~ ${PKG_REGEX} ]]; then
    echo "invalid package: ${pkg}"
    continue
  fi

  pkg_name=${BASH_REMATCH[1]}
  pkg_version=${BASH_REMATCH[2]}

  echo "checking chart ${pkg_name}@${pkg_version}"

  if helm pull "oci://ghcr.io/${OWNER}/charts/${pkg_name}" --version "${pkg_version}" 2> /dev/null; then
    echo "skipping, package exists"
    continue
  fi
  echo "pushing package"
  helm push "${pkg}" "oci://ghcr.io/${OWNER}/charts"
done
