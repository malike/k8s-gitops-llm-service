# GitOps LLM

## Project Set Up: Mono Repo

This is mono-repo that builds and pushes two docker images.

- A simple html page served from nginx server
- An LLM service

It uses [Trivy vulnerability scanner](https://trivy.dev/) to scan the docker images for vulnerabilities
using Github Actions. A simple pipeline used as proof of concept.


## Helm Chart Repository

It also serves as a helm repository, where you helm releases for both the html frontend and llm service can be accessed.

### Usage
Helm must be installed to use the charts.

```shell
helm repo add gitops-llm https://malike.github.io/k8s-gitops-llm-service
```

This is a  one time activity.

To install the frontend.

```shell
helm install gitops-llm-frontend gitops-llm/llm-frontend
```

To install the backend.

```shell
helm install gitops-llm-service gitops-llm/llm-service
```


To uninstall the chart:

```shell
helm delete {chart-name}
```