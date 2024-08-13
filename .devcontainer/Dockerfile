FROM ghcr.io/containerbase/devcontainer:11.10.0

USER root

COPY tools/*.sh /usr/local/containerbase/tools/

# installs files to /etc/ct
# renovate: datasource=github-releases packageName=helm/chart-testing
RUN install-tool chart-testing v3.11.0

USER vscode

# renovate: datasource=github-releases packageName=kubernetes/kubernetes
RUN install-tool kubectl v1.31.0

# renovate: datasource=github-releases packageName=kubernetes-sigs/kind
RUN install-tool kind v0.23.0

# renovate: datasource=github-releases packageName=helm/helm
RUN install-tool helm v3.15.3

# renovate: datasource=github-releases packageName=norwoodj/helm-docs
RUN install-tool helm-docs 1.14.2

# renovate: datasource=github-releases packageName=instrumenta/kubeval
RUN install-tool kubeval v0.16.1
