# renovate

![Version: 37.269.2](https://img.shields.io/badge/Version-37.269.2-informational?style=flat-square) ![AppVersion: 37.269.2](https://img.shields.io/badge/AppVersion-37.269.2-informational?style=flat-square)

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
|-----|------|-------|-------------|
| affinity | object | `{}` | Configure the pod(Anti)Affinity and/or node(Anti)Affinity |
| apiVersionOverrides.cronjob | string | `""` | String to override apiVersion of cronjob rendered by this helm chart |
| cronjob.activeDeadlineSeconds | string | `""` | Deadline for the job to finish |
| cronjob.annotations | object | `{}` | Annotations to set on the cronjob |
| cronjob.completions | string | `""` | Number of successful completions before the job is considered complete |
| cronjob.completionMode | string | `""` | Set to `Indexed` the Pods of a Job get an associated completion index from 0 to x |
| cronjob.concurrencyPolicy | string | `""` | "Allow" to allow concurrent runs, "Forbid" to skip new runs if a previous run is still running or "Replace" to replace the previous run |
| cronjob.failedJobsHistoryLimit | string | `""` | Amount of failed jobs to keep in history |
| cronjob.initContainers | list | `[]` | Additional initContainers that can be executed before renovate |
| cronjob.jobBackoffLimit | string | `""` | Number of times to retry an errored job before considering it as being failed |
| cronjob.jobRestartPolicy | string | `"Never"` | Set to Never to restart the job when the pod fails or to OnFailure to restart when a container fails |
| cronjob.labels | object | `{}` | Labels to set on the cronjob |
| cronjob.parallelism | string | `""` | Number of pods to run in parallel |
| cronjob.preCommand | string | `""` | Prepend shell commands before renovate runs |
| cronjob.postCommand | string | `""` | Append shell commands after renovate runs |
| cronjob.schedule | string | `"0 1 * * *"` | Schedules the job to run using cron notation |
| cronjob.startingDeadlineSeconds | string | `""` | Deadline to start the job, skips execution if job misses it's configured deadline |
| cronjob.successfulJobsHistoryLimit | string | `""` | Amount of completed jobs to keep in history |
| cronjob.suspend | bool | `false` | If it is set to true, all subsequent executions are suspended. This setting does not apply to already started executions. |
| cronJob.timeZone | string | `""` | You can specify a time zone for a CronJob by setting timeZone to the name of a valid time zone. (starting with k8s 1.27) <https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#time-zones> |
| cronjob.ttlSecondsAfterFinished | string | `"""` | Time to keep the job after it finished before automatically deleting it |
| env | object | `{}` | Environment variables to set on the renovate container |
| envFrom | list | `[]` | Environment variables to add from existing secrets/configmaps. Uses the keys as variable name |
| envList | list | `[]` | Additional env. Helpful too if you want to use anything other than a `value` source. |
| existingSecret | string | `""` | k8s secret to reference environment variables from. Overrides secrets if set |
| extraConfigmaps | list | `[]` | Additional configmaps. A generated configMap name is: "renovate.fullname" + "extra" + name(below) e.g. renovate-netrc-config |
| extraVolumeMounts | list | `[]` | Additional volumeMounts to the container |
| extraVolumes | list | `[]` | Additional volumes to the pod |
| extraContainers | list | `[]` | Additional containers to the pod |
| fullnameOverride | string | `""` | Override the fully qualified app name |
| global.commonLabels | object | `{}` | Additional labels to be set on all renovate resources |
| hostAliases | list | `[]` | Override hostname resolution |
| image.pullPolicy | string | `"IfNotPresent"` | "IfNotPresent" to pull the image if no image with the specified tag exists on the node, "Always" to always pull the image or "Never" to try and use pre-pulled images |
| image.registry | string | `"ghcr.io"` | Registry to pull image from |
| image.repository | string | `"renovatebot/renovate"` | Image name to pull |
| image.tag | string | `"37.269.2"` | Renovate image tag to pull |
| imagePullSecrets | object | `{}` | Secret to use to pull the image from the repository |
| nameOverride | string | `""` | Override the name of the chart |
| nodeSelector | object | `{}` | Select the node using labels to specify where the cronjob pod should run on |
| pod.annotations | object | `{}` | Annotations to set on the pod |
| pod.labels | object | `{}` | Labels to set on the pod |
| redis.architecture | string | `"standalone"` | Disable replication by default |
| redis.auth.enabled | bool | `false` | Don't require a password by default |
| redis.enabled | bool | `false` | Enable the Redis subchart? |
| redis.kubeVersion | string | `""` | Override Kubernetes version for redis chart |
| redis.nameOverride | string | `""` | Override the prefix of the redisHost |
| renovate.config | string | `""` | Inline global renovate config.json |
| renovate.configEnableHelmTpl | bool | `false` | Use the Helm tpl function on your configuration. See README for how to use this value |
| renovate.configIsSecret | bool | `false` | Use this to create the renovate-config as a secret instead of a configmap |
| renovate.existingConfigFile | string | `""` | Custom exiting global renovate config |
| renovate.persistence.cache.enabled | bool | `false` | Allow the cache to persist between runs |
| renovate.persistence.cache.storageClass | string | `""` | Storage class of the cache PVC |
| renovate.persistence.cache.storageSize | string | `"512Mi"` | Storage size of the cache PVC |
| renovate.securityContext | object | `{}` | Renovate Container-level security-context |
| resources | object | `{}` | Specify resource limits and requests for the renovate container |
| secrets | object | `{}` | Environment variables that should be referenced from a k8s secret, cannot be used when existingSecret is set |
| securityContext | object | `{}` | Pod-level security-context |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use |
| ssh_config.config | string | `""` | Contents of the config file |
| ssh_config.enabled | bool | `false` | Whether to enable the use and creation of a secret containing .ssh files |
| ssh_config.existingSecret | string | `""` | Name of the existing secret containing a valid .ssh configuration |
| ssh_config.id_rsa | string | `""` | Contents of the id_rsa file |
| ssh_config.id_rsa_pub | string | `""` | Contents of the id_rsa_pub file |
| tolerations | list | `[]` | Configure which node taints the pod should tolerate |

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

## Renovate full image

This chart is using the slim renovate image by default.
If you want to use the full renovate image, set the `image.tag` to `full`.
If you like to use a specific major version, set the `image.tag` to `36-full`.

## Redis

Please check out [bitnami redis](https://artifacthub.io/packages/helm/bitnami/redis) chart for additional redis configuration.

## Upgrading

A major chart version change can indicate that there is an incompatible breaking change needing maual actions.

_No recent breaking changes needing manual actions._
