FROM renovate/buildpack:2-focal@sha256:bca0fb359cb24db165b02a3f16b76f93a555353aea2c7017a8a648c47f3383f3

COPY tools /usr/local/build

# renovate: datasource=github-releases depName=moby/moby
ARG DOCKER_VERSION=20.10.2
RUN install-tool docker

# renovate: datasource=github-tags depName=kubernetes/kubectl
ARG KUBECTL_VERSION=1.20.1
RUN install-tool kubectl

# renovate: datasource=github-releases depName=kubernetes-sigs/kind
ARG KIND_VERSION=0.9.0
RUN install-tool kind

# renovate: datasource=github-releases depName=helm/helm
ARG HELM_VERSION=3.5.0
RUN install-tool helm

# renovate: datasource=github-releases depName=helm/chart-testing
ARG CHART_TESTING_VERSION=3.3.1
RUN install-tool chart-testing

# renovate: datasource=github-releases depName=norwoodj/helm-docs
ARG HELM_DOCS_VERSION=1.5.0
RUN install-tool helm-docs

# renovate: datasource=github-releases depName=instrumenta/kubeval
ARG KUBEVAL_VERSION=0.15.0
RUN install-tool kubeval
