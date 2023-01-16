# renovate

![Version: 34.102.7](https://img.shields.io/badge/Version-34.102.7-informational?style=flat-square) ![AppVersion: 34.102.7](https://img.shields.io/badge/AppVersion-34.102.7-informational?style=flat-square)

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
| apiVersionOverrides.cronjob | string | `""` | String to override apiVersion of cronjob rendered by this helm chart |
| cronjob.activeDeadlineSeconds | string | `""` | Deadline for the job to finish |
| cronjob.annotations | object | `{}` |  |
| cronjob.concurrencyPolicy | string | `""` |  |
| cronjob.failedJobsHistoryLimit | string | `""` |  |
| cronjob.initContainers | list | `[]` | Additional initContainers that can be executed before renovate |
| cronjob.jobBackoffLimit | string | `""` |  |
| cronjob.jobRestartPolicy | string | `"Never"` |  |
| cronjob.labels | object | `{}` |  |
| cronjob.preCommand | string | `""` | Prepend shell commands before renovate runs |
| cronjob.schedule | string | `"0 1 * * *"` |  |
| cronjob.startingDeadlineSeconds | string | `""` |  |
| cronjob.successfulJobsHistoryLimit | string | `""` |  |
| cronjob.suspend | bool | `false` | If it is set to true, all subsequent executions are suspended. This setting does not apply to already started executions. |
| cronjob.ttlSecondsAfterFinished | string | `"""` | Time to keep the job after it finished before automatically deleting it |
| dind.enabled | bool | `false` | Enable dind sidecar usage? |
| dind.image.pullPolicy | string | `"IfNotPresent"` |  |
| dind.image.repository | string | `"docker"` |  |
| dind.image.tag | string | `"20.10.22-dind"` |  |
| dind.securityContext | object | `{"privileged":true}` | DinD Container-level security-context. Privilged is needed for DinD, it will not work without! |
| dind.slim.enabled | bool | `true` | Do not add `-slim` suffix to image tag when using dind |
| env | object | `{}` |  |
| envFrom | list | `[]` |  |
| envList | list | `[]` | Additional env. To helpful if you want to use anything other than a `value` source. |
| existingSecret | string | `""` |  |
| extraConfigmaps | list | `[]` | Additional configmaps. A generated configMap name is: "renovate.fullname" + "extra" + name(below) e.g. renovate-netrc-config |
| extraVolumeMounts | list | `[]` | Additional volumeMounts to the container |
| extraVolumes | list | `[]` | Additional volumes to the pod |
| global.commonLabels | object | `{}` | Additional labels to be set on all renovate resources |
| hostAliases | list | `[]` | Override hostname resolution |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"renovate/renovate"` |  |
| image.tag | string | `"34.102.7"` |  |
| imagePullSecrets | object | `{}` |  |
| pod.annotations | object | `{}` |  |
| pod.labels | object | `{}` |  |
| redis.architecture | string | `"standalone"` | Disable replication by default |
| redis.auth.enabled | bool | `false` | Don't require a password by default |
| redis.enabled | bool | `false` | Enable the Redis subchart? |
| redis.kubeVersion | string | `""` | Override Kubernetes version for redis chart |
| renovate.config | string | `""` | Inline global renovate config.json |
| renovate.configEnableHelmTpl | bool | `false` | Use the Helm tpl function on your configuration. See README for how to use this value |
| renovate.configIsSecret | bool | `false` | Use this to create the renovate config as a secret instead of a configmap |
| renovate.existingConfigFile | string | `""` | Custom exiting global renovate config |
| renovate.persistence.cache.enabled | bool | `false` | Allow the cache to persist between runs |
| renovate.persistence.cache.storageClass | string | `""` | Storage class of the cache PVC |
| renovate.persistence.cache.storageSize | string | `"512Mi"` | Storage size of the cache PVC |
| renovate.securityContext | object | `{}` | Renovate Container-level security-context |
| resources | object | `{}` |  |
| secrets | object | `{}` |  |
| securityContext | object | `{}` | Pod-level security-context |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |
| ssh_config.config | string | `""` |  |
| ssh_config.enabled | bool | `false` |  |
| ssh_config.existingSecret | string | `""` |  |
| ssh_config.id_rsa | string | `""` |  |
| ssh_config.id_rsa_pub | string | `""` |  |

## Renovate persistent cache

To speed up execution time of jobs it could be useful to enable persistent caching. This means that Renovate
can make use of the cache that have been build up in previous runs. Set `renovate.persistence.cache.enabled` to true
to enable this. If necessary, the storageClass can be configured and the storageSize can be set to the preferred value.

**NOTE**: `securityContext.fsGroup` must be set to the correct group ID to use the persistent cache. Without it, renovate
can't write to the mounted PVC. For the current default user (`ubuntu`), the correct fsGroup is `1000`.

## Renovate config templating

Enable `renovate.configEnableHelmTpl` to use helm templates for generated renovate `config.json`.
Allows you to reference values using `"{{ .Values.someValue }}"` in your config

**NOTE**: setting `renovate.configEnableHelmTpl` to true means that you have to
escape your config entries containing `{{` (i.e. `"key": "{{depName}}"`) in the
value by wrapping it like: `"key": "{{ "{{depName}}" }}"`.

## Docker in Docker configuration

When `dind.enabled` is set to `true`, a Docker in Docker container will run as a sidecar to supply a Docker daemon to the RenovateBot container. This allows the configuration `binarySource` to be set to `docker`, which is the default configuration in the slim Docker images.

The slim suffix will be added to the tag if not present. To disable this behaviour, set `dind.slim.enabled` to `false`.

## Redis

Please checkout [bitnami redis](https://artifacthub.io/packages/helm/bitnami/redis) chart for additional redis configuration.

