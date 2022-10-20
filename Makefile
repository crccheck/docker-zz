help: ## Shows this help
	@echo "$$(grep -h '#\{2\}' $(MAKEFILE_LIST) | sed 's/: #\{2\} /	/' | column -t -s '	')"

build: ## Build the crccheck/zz image locally
	docker build -t crccheck/zz .
