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

format: ## Format the project using cargo
	cargo fmt --quiet

lint: ## Lint the project using cargo
	cargo clippy --quiet

test: ## Test the project using cargo
	cargo test --quiet

run: ## Run the project using cargo
	cargo run

release: ## Build the project using cargo
	cargo build --release

update: ## Update the project dependencies using cargo
	cargo update

doc: ## Generate the project documentation using cargo
	cargo doc --quiet --no-deps --document-private-items

all: format lint test run
