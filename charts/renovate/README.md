# renovate

![Version: 24.14.0+1](https://img.shields.io/badge/Version-24.14.0+1-informational?style=flat-square) ![AppVersion: 24.14.0](https://img.shields.io/badge/AppVersion-24.14.0-informational?style=flat-square)

Universal dependency update tool that fits into your workflows.

**Homepage:** <https://github.com/renovatebot/renovate>

## Installation

### Add Helm repository

```shell
helm repo add renovate https://docs.renovatebot.com/helm-charts
helm repo update
```

## Install Renovate chart

Using config from a file:

```bash
helm install --generate-name --set-file renovate.config=config.json renovate/renovate
```

Using config from a string:

```bash
helm install --generate-name --set renovate.config='\{\"token\":\"...\"\}' renovate/renovate
```

**NOTE**: `renovate.config` must be a valid Renovate [self-hosted configuration](https://docs.renovatebot.com/self-hosted-configuration/)

## Configuration

The following table lists the configurable parameters of the chart and the default values.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cronjob.annotations | object | `{}` |  |
| cronjob.concurrencyPolicy | string | `""` |  |
| cronjob.failedJobsHistoryLimit | string | `""` |  |
| cronjob.jobRestartPolicy | string | `"Never"` |  |
| cronjob.labels | object | `{}` |  |
| cronjob.schedule | string | `"0 1 * * *"` |  |
| cronjob.successfulJobsHistoryLimit | string | `""` |  |
| envFrom | list | `[]` |  |
| existingSecret | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"renovate/renovate"` |  |
| image.tag | string | `"24.14.0"` |  |
| imagePullSecrets | object | `{}` |  |
| pod.annotations | object | `{}` |  |
| pod.labels | object | `{}` |  |
| renovate.config | string | `""` |  |
| resources | object | `{}` |  |
| secrets | object | `{}` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |
| ssh_config.config | string | `""` |  |
| ssh_config.enabled | bool | `false` |  |
| ssh_config.existingSecret | string | `""` |  |
| ssh_config.id_rsa | string | `""` |  |
| ssh_config.id_rsa_pub | string | `""` |  |
