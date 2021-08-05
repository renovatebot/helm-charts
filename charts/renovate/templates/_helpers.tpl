{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "renovate.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "renovate.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "renovate.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "renovate.labels" -}}
helm.sh/chart: {{ include "renovate.chart" . }}
{{ include "renovate.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "renovate.selectorLabels" -}}
app.kubernetes.io/name: {{ include "renovate.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "renovate.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "renovate.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Define secret names
*/}}
{{- define "renovate.secretName" -}}
{{- if .Values.existingSecret -}}
{{- .Values.existingSecret -}}
{{- else -}}
{{ include "renovate.fullname" . }}-secret
{{- end -}}
{{- end -}}

{{/*
Define ssh config secret
*/}}
{{- define "renovate.sshSecretName" -}}
{{- if .Values.ssh_config.existingSecret -}}
{{- .Values.ssh_config.existingSecret -}}
{{- else -}}
{{ include "renovate.fullname" . }}-ssh-secret
{{- end -}}
{{- end -}}

{{/*
Force slim image if dind is enabled and slim is not disabled
*/}}
{{- define "renovate.imageTag" -}}
{{- if and .Values.dind.enabled .Values.dind.slim.enabled (not (eq .Values.image.tag "slim")) (not (regexMatch "^.*-slim$" .Values.image.tag)) -}}
{{- .Values.image.tag }}-slim
{{- else -}}
{{- .Values.image.tag }}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified Redis&trade; name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "renovate.redis.fullname" -}}
{{- $name := default "redis" .Values.redis.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the Redis&trade; hostname
*/}}
{{- define "renovate.redisHost" -}}
    {{- printf "%s-master" (include "renovate.redis.fullname" .) -}}
{{- end -}}
