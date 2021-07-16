FROM ghcr.io/containerbase/buildpack:1.12.0@sha256:ada50b06ca0539bd05b24c99e996c813b14895d2d11143b9b25c6d774d3617f1

COPY tools /usr/local/buildpack

# renovate: datasource=github-releases depName=docker lookupName=moby/moby
ARG DOCKER_VERSION=v20.10.7
RUN install-tool docker

# renovate: datasource=github-tags depName=kubectl lookupName=kubernetes/kubectl
ARG KUBECTL_VERSION=1.20.1
RUN install-tool kubectl

# renovate: datasource=github-releases depName=kind lookupName=kubernetes-sigs/kind
ARG KIND_VERSION=v0.11.1
RUN install-tool kind

# renovate: datasource=github-releases depName=helm lookupName=helm/helm
ARG HELM_VERSION=v3.6.3
RUN install-tool helm

# renovate: datasource=github-releases depName=chart-testing lookupName=helm/chart-testing
ARG CHART_TESTING_VERSION=v3.4.0
RUN install-tool chart-testing

# renovate: datasource=github-releases depName=helm-docs lookupName=norwoodj/helm-docs
ARG HELM_DOCS_VERSION=1.5.0
RUN install-tool helm-docs

# renovate: datasource=github-releases depName=kubeval lookupName=instrumenta/kubeval
ARG KUBEVAL_VERSION=v0.16.1
RUN install-tool kubeval
