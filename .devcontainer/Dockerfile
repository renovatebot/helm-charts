FROM ghcr.io/containerbase/buildpack:3.13.1@sha256:64e79936ea6eaa05a7097008fd31a501aca3ca222f9af2981e8fb8e05af7c7ee

COPY tools /usr/local/buildpack

# renovate: datasource=github-releases depName=docker lookupName=moby/moby
ARG DOCKER_VERSION=v20.10.14
RUN install-tool docker

# renovate: datasource=github-tags depName=kubectl lookupName=kubernetes/kubectl
ARG KUBECTL_VERSION=1.20.1
RUN install-tool kubectl

# renovate: datasource=github-releases depName=kind lookupName=kubernetes-sigs/kind
ARG KIND_VERSION=v0.12.0
RUN install-tool kind

# renovate: datasource=github-releases depName=helm lookupName=helm/helm
ARG HELM_VERSION=v3.8.1
RUN install-tool helm

# renovate: datasource=github-releases depName=chart-testing lookupName=helm/chart-testing
ARG CHART_TESTING_VERSION=v3.5.1
RUN install-tool chart-testing

# renovate: datasource=github-releases depName=helm-docs lookupName=norwoodj/helm-docs
ARG HELM_DOCS_VERSION=v1.7.0
RUN install-tool helm-docs

# renovate: datasource=github-releases depName=kubeval lookupName=instrumenta/kubeval
ARG KUBEVAL_VERSION=v0.16.1
RUN install-tool kubeval
