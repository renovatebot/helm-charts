FROM renovate/buildpack:3-focal@sha256:42d3e3cf837c93bb47ffade4442aa61bd56a3ce01a34ffe8462d941325e74d8a

COPY tools /usr/local/build

# renovate: datasource=github-releases depName=moby/moby
ARG DOCKER_VERSION=20.10.6
RUN install-tool docker

# renovate: datasource=github-tags depName=kubernetes/kubectl
ARG KUBECTL_VERSION=1.20.1
RUN install-tool kubectl

# renovate: datasource=github-releases depName=kubernetes-sigs/kind
ARG KIND_VERSION=0.10.0
RUN install-tool kind

# renovate: datasource=github-releases depName=helm/helm
ARG HELM_VERSION=3.5.4
RUN install-tool helm

# renovate: datasource=github-releases depName=helm/chart-testing
ARG CHART_TESTING_VERSION=3.3.1
RUN install-tool chart-testing

# renovate: datasource=github-releases depName=norwoodj/helm-docs
ARG HELM_DOCS_VERSION=1.5.0
RUN install-tool helm-docs

# renovate: datasource=github-releases depName=instrumenta/kubeval
ARG KUBEVAL_VERSION=v0.16.1
RUN install-tool kubeval
