TAG := $(GITHUB_REF)
ifeq ($(TAG),)
	TAG := $(shell git symbolic-ref --short -q HEAD)
endif
ifeq ($(TAG),)
	TAG := $(shell git rev-parse --short --verify HEAD)
endif

define docker_build_and_push
	docker buildx build \
		--push \
		--platform linux/arm64,linux/amd64 \
		-t "schickling/$1:$(if $2,$2,$(TAG))" \
		./$1
endef

help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[0-9a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-18s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
	@echo $(TAG)

all: beanstalkd beanstalkd-console hugin jekyll latex mailcatcher mysql-backup-s3 nginx-envtpl nodejs octave opencv postgres-backup-s3 postgres-restore-s3 redis-commander rust s3cmd scala-sbt-docker swagger-ui thumbor-nginx-cors ## Build all images

.PHONY: beanstalkd
beanstalkd: ## Build beanstalkd image
	$(call docker_build_and_push,beanstalkd)

.PHONY: beanstalkd-console
beanstalkd-console: ## Build beanstalkd-console image
	$(call docker_build_and_push,beanstalkd-console)

.PHONY: hugin
hugin: ## Build hugin image
	$(call docker_build_and_push,hugin)

.PHONY: jekyll # (This image is not compatible with arm architecture)
jekyll: ## Build jekyll image
	docker buildx build \
		--push \
		--platform linux/amd64 \
		-t "schickling/$1" \
		./$1

.PHONY: latex
latex: ## Build latex image
	$(call docker_build_and_push,latex)

.PHONY: mailcatcher
mailcatcher: ## Build mailcatcher image
	$(call docker_build_and_push,mailcatcher)

.PHONY: mysql-backup-s3
mysql-backup-s3: ## Build mysql-backup-s3 image
	$(call docker_build_and_push,mysql-backup-s3)

.PHONY: nginx-envtpl
nginx-envtpl: ## Build nginx-envtpl image
	$(call docker_build_and_push,nginx-envtpl)

.PHONY: nodejs
nodejs: ## Build nodejs image
	$(call docker_build_and_push,nodejs)

.PHONY: octave
octave: ## Build octave image
	$(call docker_build_and_push,octave)

.PHONY: opencv
opencv: ## Build opencv image
	$(call docker_build_and_push,opencv)

.PHONY: postgres-backup-s3
postgres-backup-s3: ## Build postgres-backup-s3 image
	$(call docker_build_and_push,postgres-backup-s3)

.PHONY: postgres-restore-s3
postgres-restore-s3: ## Build postgres-restore-s3 image
	$(call docker_build_and_push,postgres-restore-s3)

.PHONY: redis-commander
redis-commander: ## Build redis-commander image
	$(call docker_build_and_push,redis-commander)

.PHONY: rust
rust: ## Build rust image
	$(call docker_build_and_push,rust)

.PHONY: s3cmd
s3cmd: ## Build s3cmd image
	$(call docker_build_and_push,s3cmd)

.PHONY: scala-sbt-docker
scala-sbt-docker: ## Build scala-sbt-docker image
	$(call docker_build_and_push,scala-sbt-docker)

.PHONY: swagger-ui
swagger-ui: ## Build swagger-ui image
	$(call docker_build_and_push,swagger-ui)

.PHONY: thumbor-nginx-cors
thumbor-nginx-cors: ## Build thumbor-nginx-cors image
	$(call docker_build_and_push,thumbor-nginx-cors)
