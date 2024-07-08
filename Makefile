SHELL := /bin/bash
.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

rust-version: ## Display Rust command-line utility versions
	@echo "Rust command-line utility versions:"
	rustc --version 			#rust compiler
	cargo --version 			#rust package manager
	rustfmt --version			#rust code formatter
	rustup --version			#rust toolchain manager
	clippy-driver --version		#rust linter

format: ## Formats all the subprojects using cargo
	@echo "Format in all subdirectories..."
	@find . -type f -name 'Makefile' ! -path './Makefile' | while read dir; do \
		dir=$$(dirname $$dir); \
		echo "Formatting in $$dir..."; \
		(cd $$dir && $(MAKE) format); \
	done

lint: ## Lints all the subprojects using cargo
	@echo "Linting in all subdirectories..."
	@find . -type f -name 'Makefile' ! -path './Makefile' | while read dir; do \
		dir=$$(dirname $$dir); \
		echo "Linting in $$dir..."; \
		(cd $$dir && $(MAKE) lint); \
	done

test: ## Tests all the subprojects using cargo
	@echo "Testing in all subdirectories..."
	@find . -type f -name 'Makefile' ! -path './Makefile' | while read dir; do \
		dir=$$(dirname $$dir); \
		echo "Testing in $$dir..."; \
		(cd $$dir && $(MAKE) test); \
	done

release: ## Builds all the subprojects using cargo
	@echo "Building release in all subdirectories..."
	@find . -type f -name 'Makefile' ! -path './Makefile' | while read dir; do \
		dir=$$(dirname $$dir); \
		echo "Building in $$dir..."; \
		(cd $$dir && $(MAKE) release); \
	done

update: ## Updates all the subprojects dependencies using cargo
	@echo "Updating in all subdirectories..."
	@find . -type f -name 'Makefile' ! -path './Makefile' | while read dir; do \
		dir=$$(dirname $$dir); \
		echo "Updating in $$dir..."; \
		(cd $$dir && $(MAKE) update); \
	done

doc: ## Generates all the subprojects documentation using cargo
	@echo "Generating docs in all subdirectories..."
	@find . -type f -name 'Makefile' ! -path './Makefile' | while read dir; do \
		dir=$$(dirname $$dir); \
		echo "Generating docs in $$dir..."; \
		(cd $$dir && $(MAKE) doc); \
	done

all: ## Performs the format, lint, test, and run make targets in all subprojects
	@echo "Running the make all in all subdirectories ..."
	@find . -type f -name 'Makefile' ! -path './Makefile' | while read dir; do \
		dir=$$(dirname $$dir); \
		echo "Make all in $$dir..."; \
		(cd $$dir && $(MAKE) all); \
	done
