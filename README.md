# Renovate

Automated dependency updates. Multi-platform and multi-language.

This repository hosts Renovate's [Helm](https://helm.sh) charts. Chart documentation is automatically generated using [helm-docs](https://github.com/norwoodj/helm-docs)

## Add Helm repository

```bash
helm repo add renovate https://renovatebot.github.io/helm-charts/
helm repo update
```

## Install chart

```bash
helm install --generate-name --set renovate.config='module.exports={...}' renovate/renovate
```
