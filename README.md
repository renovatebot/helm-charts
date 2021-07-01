# Renovate

[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/renovatebot/helm-charts?style=for-the-badge)](https://github.com/renovatebot/helm-charts/releases/latest)
[![License](https://img.shields.io/github/license/renovatebot/helm-charts?style=for-the-badge)](https://opensource.org/licenses/AGPL-3.0)

Automated dependency updates.
Multi-platform and multi-language.

This repository hosts Renovate's [Helm](https://helm.sh) charts.
Chart documentation is automatically generated using [helm-docs](https://github.com/norwoodj/helm-docs).

## Kubernetes version support

We test the following versions of Kubernetes:

| Cloud | Lowest | Highest |
| ----- | :----: | :-----: |
| AWS   | `1.16` | `1.20`  |
| Azure | `1.18` | `1.20`  |
| GCP   | `1.18` | `1.20`  |

We will test on the latest 4 versions of Kubernetes.
The general concept is that we track the versions of Kubernetes that are supported by the major cloud providers.

## Add Helm repository

```bash
helm repo add renovate https://docs.renovatebot.com/helm-charts
helm repo update
```

## Install chart

Using config from a file:

```bash
helm install --generate-name --set-file renovate.config=config.json renovate/renovate
```

Using config from a string:

```bash
helm install --generate-name --set renovate.config='\{\"token\":\"...\"\}' renovate/renovate
```

**Note**: `renovate.config` must be a valid Renovate [self-hosted configuration](https://docs.renovatebot.com/self-hosted-configuration/).

## Contributing

When using this repo locally or contributing to this repo, you will need to build the dependencies used for each helm chart.
You can run the following commands to do so:

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
cd charts/renovate
helm dependency build
```
