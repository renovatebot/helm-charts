FROM ghcr.io/containerbase/buildpack:6.1.3@sha256:165bc6512e059c166b1ac1d1fc1d31537295919be6d5bee59f8498d5f4758f6d

COPY tools/*.sh /usr/local/buildpack/tools/

# renovate: datasource=github-releases depName=docker packageName=moby/moby
ARG DOCKER_VERSION=v20.10.23
RUN install-tool docker

# renovate: datasource=github-tags depName=kubectl packageName=kubernetes/kubectl
ARG KUBECTL_VERSION=1.24.1
RUN install-tool kubectl

# renovate: datasource=github-releases depName=kind packageName=kubernetes-sigs/kind
ARG KIND_VERSION=v0.17.0
RUN install-tool kind

# renovate: datasource=github-releases depName=helm packageName=helm/helm
ARG HELM_VERSION=v3.11.1
RUN install-tool helm

# renovate: datasource=github-releases depName=chart-testing packageName=helm/chart-testing
ARG CHART_TESTING_VERSION=v3.7.1
RUN install-tool chart-testing

# renovate: datasource=github-releases depName=helm-docs packageName=norwoodj/helm-docs
ARG HELM_DOCS_VERSION=1.11.0
RUN install-tool helm-docs

# renovate: datasource=github-releases depName=kubeval packageName=instrumenta/kubeval
ARG KUBEVAL_VERSION=v0.16.1
RUN install-tool kubeval
