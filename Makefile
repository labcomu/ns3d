# ------------------------------------------------------------------------------

.DEFAULT_GOAL := ns3
file = docker-compose.yml

# ------------------------------------------------------------------------------

.PHONY: secret
secret:
	@echo '>> secret'
	bash ./init_secrets.sh

# ------------------------------------------------------------------------------

.PHONY: prune-volume
prune-volume:
	@echo '>> prune-volume'
	docker volume rm --force `docker volume ls --quiet --filter dangling=true` 2>/dev/null || true

.PHONY: prune
prune:
	@echo '>> prune'
	docker system prune --all --force

# ------------------------------------------------------------------------------

.PHONY: log
log:
	docker compose --file ${file} logs --follow ${services} || true

# ------------------------------------------------------------------------------

# --no-cache
.PHONY: build
build:
	@echo '>> build'
	docker compose --file ${file} build ${services}

.PHONY: stop
stop:
	@echo '>> stop'
	docker compose --file ${file} down ${services}

.PHONY: start
start:
	@echo '>> start'
	docker compose --file ${file} up ${services} --detach

.PHONY: refresh
refresh: stop build start
	@echo '>> refresh'

# ------------------------------------------------------------------------------

.PHONY: shell-ns3
shell-ns3:
	@echo '>> shell-ns3'
	docker exec -it ns3 /bin/bash

# ------------------------------------------------------------------------------

.PHONY: ns3
ns3: file = docker-compose.yml
ns3: services = ns3
ns3: refresh shell-ns3
	@echo '>> ns3'
