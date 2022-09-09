FROM ghcr.io/containerbase/buildpack:4.14.0@sha256:63bd688bb24b83322a7e2172c8b0357f4694ef03a5b6ef12e0450ae31d4eb2ca

COPY tools/*.sh /usr/local/buildpack/tools/

# renovate: datasource=github-releases depName=docker packageName=moby/moby
ARG DOCKER_VERSION=v20.10.18
RUN install-tool docker

# renovate: datasource=github-tags depName=kubectl packageName=kubernetes/kubectl
ARG KUBECTL_VERSION=1.24.1
RUN install-tool kubectl

# renovate: datasource=github-releases depName=kind packageName=kubernetes-sigs/kind
ARG KIND_VERSION=v0.15.0
RUN install-tool kind

# renovate: datasource=github-releases depName=helm packageName=helm/helm
ARG HELM_VERSION=v3.9.4
RUN install-tool helm

# renovate: datasource=github-releases depName=chart-testing packageName=helm/chart-testing
ARG CHART_TESTING_VERSION=v3.7.0
RUN install-tool chart-testing

# renovate: datasource=github-releases depName=helm-docs packageName=norwoodj/helm-docs
ARG HELM_DOCS_VERSION=1.11.0
RUN install-tool helm-docs

# renovate: datasource=github-releases depName=kubeval packageName=instrumenta/kubeval
ARG KUBEVAL_VERSION=v0.16.1
RUN install-tool kubeval
