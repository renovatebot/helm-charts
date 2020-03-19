# Renovate

Automated dependency updates. Multi-platform and multi-language.

This repository hosts Renovate's [Helm](https://helm.sh) charts. Chart documentation is automatically generated using [helm-docs](https://github.com/norwoodj/helm-docs)

## Add Helm repository

```bash
helm repo add renovate https://renovatebot.github.io/helm-charts/
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

**NOTE**: `renovate.config` must be a valid Renovate [self-hosted configuration](https://docs.renovatebot.com/self-hosted-configuration/)
