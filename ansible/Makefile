.PHONY: lint help

PLAYBOOK     = ansible-playbook
ANSIBLE_LINT = ansible-lint
YAML_LINT    = yamllint

NFS_SERVER = playbooks/fgl-nfs-server.yaml

#INVENTORY = 

lint: ## Run linting on all ansible playbooks & roles
	$(ANSIBLE_LINT) playbooks/*.yml roles/*/tasks/*.yml || true
	$(YAML_LINT) . || true

help: ## Output the help for the different Makefile targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

#================#
# Authentication #
#================#

nfs-server:
	$(PLAYBOOK) $(NFS_SERVER) --inventory $(INVENTORY) $(ARGS)
