# renovate

![Version: 39.150.0](https://img.shields.io/badge/Version-39.150.0-informational?style=flat-square) ![AppVersion: 39.150.0](https://img.shields.io/badge/AppVersion-39.150.0-informational?style=flat-square)

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
| affinity | object | `{}` | Configure the pod(Anti)Affinity and/or node(Anti)Affinity |
| cronjob.activeDeadlineSeconds | string | `""` | Deadline for the job to finish |
| cronjob.annotations | object | `{}` | Annotations to set on the cronjob |
| cronjob.argsOverride | list | `[]` | Custom arguments to run in the container |
| cronjob.backoffLimitPerIndex | string | `""` | Maximal number of failures per index |
| cronjob.commandOverride | list | `[]` | Custom command to run in the container |
| cronjob.completionMode | string | `""` | "Where the jobs should be NonIndexed or Indexed" |
| cronjob.completions | string | `""` | "Number of successful completions is reached to mark the job as complete" |
| cronjob.concurrencyPolicy | string | `""` | "Allow" to allow concurrent runs, "Forbid" to skip new runs if a previous run is still running or "Replace" to replace the previous run |
| cronjob.failedJobsHistoryLimit | string | `""` | Amount of failed jobs to keep in history |
| cronjob.initContainers | list | `[]` | Additional initContainers that can be executed before renovate |
| cronjob.jobBackoffLimit | string | `""` | Number of times to retry running the pod before considering the job as being failed |
| cronjob.jobRestartPolicy | string | `"Never"` | Set to Never to restart the job when the pod fails or to OnFailure to restart when a container fails |
| cronjob.labels | object | `{}` | Labels to set on the cronjob |
| cronjob.maxFailedIndexes | string | `""` | Maximal number of failed indexes before terminating the Job execution |
| cronjob.parallelism | string | `""` | Number of pods to run in parallel |
| cronjob.postCommand | string | `""` | Append shell commands after renovate runs |
| cronjob.preCommand | string | `""` | Prepend shell commands before renovate runs |
| cronjob.schedule | string | `"0 1 * * *"` | Schedules the job to run using cron notation |
| cronjob.startingDeadlineSeconds | string | `""` | Deadline to start the job, skips execution if job misses it's configured deadline |
| cronjob.successfulJobsHistoryLimit | string | `""` | Amount of completed jobs to keep in history |
| cronjob.suspend | bool | `false` | If it is set to true, all subsequent executions are suspended. This setting does not apply to already started executions. |
| cronjob.timeZone | string | `""` | You can specify a time zone for a CronJob by setting timeZone to the name of a valid time zone. (starting with k8s 1.27) <https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#time-zones> |
| cronjob.ttlSecondsAfterFinished | string | `""` | Time to keep the job after it finished before automatically deleting it |
| env | object | `{}` | Environment variables to set on the renovate container |
| envFrom | list | `[]` | Environment variables to add from existing secrets/configmaps. Uses the keys as variable name |
| envList | list | `[]` | Additional env. Helpful too if you want to use anything other than a `value` source. |
| existingSecret | string | `""` | k8s secret to reference environment variables from. Overrides secrets if set |
| extraConfigmaps | list | `[]` | Additional configmaps. A generated configMap name is: "renovate.fullname" + "extra" + name(below) e.g. renovate-netrc-config |
| extraContainers | list | `[]` | Additional containers to the pod |
| extraObjects | list | `[]` | Create extra manifests via values. Would be passed through `tpl` for templating |
| extraVolumeMounts | list | `[]` | Additional volumeMounts to the container |
| extraVolumes | list | `[]` | Additional volumes to the pod |
| fullnameOverride | string | `""` | Override the fully qualified app name |
| global.commonLabels | object | `{}` | Additional labels to be set on all renovate resources |
| global.compatibility.openshift.adaptSecurityContext | string | `"auto"` | Adapt the securityContext sections of the deployment to make them compatible with Openshift restricted-v2 SCC: remove runAsUser, runAsGroup and fsGroup and let the platform use their allowed default IDs. Possible values: `auto` (apply if the detected running cluster is Openshift), `force` (perform the adaptation always), `disabled` (do not perform adaptation) |
| hostAliases | list | `[]` | Override hostname resolution |
| image.pullPolicy | string | `"IfNotPresent"` | "IfNotPresent" to pull the image if no image with the specified tag exists on the node, "Always" to always pull the image or "Never" to try and use pre-pulled images |
| image.registry | string | `"ghcr.io"` | Registry to pull image from |
| image.repository | string | `"renovatebot/renovate"` | Image name to pull |
| image.tag | string | `"39.150.0"` | Renovate image tag to pull |
| image.useFull | bool | `false` | Set `true` to use the full image. See https://docs.renovatebot.com/getting-started/running/#the-full-image |
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
| renovate.configIsJavaScript | bool | `false` | Use this to create a config.js instead of a config.json |
| renovate.configIsSecret | bool | `false` | Use this to create the renovate-config as a secret instead of a configmap |
| renovate.existingConfigFile | string | `""` | Custom exiting global renovate config |
| renovate.persistence | object | `{"cache":{"enabled":false,"labels":{},"storageClass":"","storageSize":"512Mi","volumeName":""}}` | Options related to persistence |
| renovate.persistence.cache.enabled | bool | `false` | Allow the cache to persist between runs |
| renovate.persistence.cache.labels | object | `{}` | Labels to set on the cache PVC |
| renovate.persistence.cache.storageClass | string | `""` | Storage class of the cache PVC |
| renovate.persistence.cache.storageSize | string | `"512Mi"` | Storage size of the cache PVC |
| renovate.persistence.cache.volumeName | string | `""` | Existing volume, enables binding the pvc to an existing volume |
| renovate.securityContext | object | `{}` | Renovate Container-level security-context |
| resources | object | `{}` | Specify resource limits and requests for the renovate container |
| secrets | object | `{}` | Environment variables that should be referenced from a k8s secret, cannot be used when existingSecret is set |
| securityContext | object | `{}` | Pod-level security-context |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use If not set and create is true, a name is generated using the fullname template |
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

**HINT**: It is highly recommended to use the redis subchart or SQLite for caching, instead of disk caching.
Take a look at https://github.com/renovatebot/renovate/discussions/30525 for more information.

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

A major chart version change can indicate that there is an incompatible breaking change needing manual actions.

_No recent breaking changes needing manual actions._
