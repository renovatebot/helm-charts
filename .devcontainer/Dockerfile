FROM ghcr.io/containerbase/devcontainer:14.2.0

USER root

COPY tools/*.sh /usr/local/containerbase/tools/

# installs files to /etc/ct
# renovate: datasource=github-releases packageName=helm/chart-testing
RUN install-tool chart-testing v3.14.0

USER vscode

# renovate: datasource=github-releases packageName=kubernetes/kubernetes
RUN install-tool kubectl v1.35.1

# renovate: datasource=github-releases packageName=kubernetes-sigs/kind
RUN install-tool kind v0.31.0

# renovate: datasource=github-releases packageName=helm/helm
RUN install-tool helm v3.20.0

# renovate: datasource=github-releases packageName=norwoodj/helm-docs
RUN install-tool helm-docs 1.14.2

# renovate: datasource=github-releases packageName=yannh/kubeconform
RUN install-tool kubeconform v0.7.0
