#!make

FRONTEND_IMAGE_NAME := ghcr.io/malike/k8s-gitops-llm-service/llm-frontend-service
LLM_IMAGE_NAME := ghcr.io/malike/k8s-gitops-llm-service/llm-service
TAG := v0.0.1

.PHONY:
build-frontend:  ## Build frontend
	echo "doing nothing"

.PHONY:
docker-build-frontend: ## Build frontend docker image
	cd llm-frontend && docker build -f Dockerfile -t ${FRONTEND_IMAGE_NAME}:${TAG} .

.PHONY:
docker-build-frontend-push: docker-build-frontend ## Build and push backend docker image to registry
	docker push ${FRONTEND_IMAGE_NAME}:${TAG}

.PHONY:
build-llm:  ## Build llm service
	echo "doing nothing"

.PHONY:
docker-build-llm: ## Build llm docker image
	cd llm-service && docker build -f Dockerfile -t ${LLM_IMAGE_NAME}:${TAG} .

.PHONY:
docker-build-llm-push: docker-build-llm ## Build and push backend docker image to registry
	docker push ${LLM_IMAGE_NAME}:${TAG}

.PHONY:
help: ## Display this help screen
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
