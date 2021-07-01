#!/usr/bin/env bash

set -euo pipefail

check_semver "$TOOL_VERSION"

curl --silent --show-error --fail --location --output /tmp/chart-testing.tar.gz https://github.com/helm/chart-testing/releases/download/v"$TOOL_VERSION"/chart-testing_"$TOOL_VERSION"_linux_amd64.tar.gz
tar -xf /tmp/chart-testing.tar.gz -C /usr/local/bin/ ct
mkdir -p /etc/ct
tar -xf /tmp/chart-testing.tar.gz -C /etc/ct --strip-components=1 etc
rm /tmp/chart-testing.tar.gz

ct version
