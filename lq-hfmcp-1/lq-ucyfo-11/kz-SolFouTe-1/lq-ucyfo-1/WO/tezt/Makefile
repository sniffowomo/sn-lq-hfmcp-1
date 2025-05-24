# Makefile for Foundry Smart Contract Projects
# Ensures forge fmt is always run before other actions

# Colors for pretty output
YELLOW := \033[1;33m
BLUE   := \033[1;34m
GREEN  := \033[1;32m
RESET  := \033[0m

# Default goal is help
.DEFAULT_GOAL := help

# Always run forge fmt before any command except help
define FORMAT_FIRST
	@echo "$(BLUE)[*] Running forge fmt...$(RESET)"
	@forge fmt
endef

.PHONY: help build test clean script coverage

help:
	@echo ""
	@echo "$(YELLOW)Foundry Makefile Commands$(RESET)"
	@echo "--------------------------------------"
	@echo "$(GREEN)make build$(RESET)    - Build all smart contracts"
	@echo "$(GREEN)make test$(RESET)     - Run all tests"
	@echo "$(GREEN)make script$(RESET)   - Run the default script"
	@echo "$(GREEN)make coverage$(RESET) - Run test coverage analysis"
	@echo "$(GREEN)make clean$(RESET)    - Remove build artifacts"
	@echo "$(GREEN)make fmt$(RESET)      - Format your Solidity files with forge fmt"
	@echo "$(GREEN)make help$(RESET)     - Show this help message (default)"

build:
	$(call FORMAT_FIRST)
	@echo "$(BLUE)[*] Building contracts...$(RESET)"
	@forge build -vvvvv

test:
	$(call FORMAT_FIRST)
	@echo "$(BLUE)[*] Running tests...$(RESET)"
	@forge test -vvvvv

script:
	$(call FORMAT_FIRST)
	@echo "$(BLUE)[*] Running default script...$(RESET)"
	@forge script script/Deploy.s.sol

coverage:
	$(call FORMAT_FIRST)
	@echo "$(BLUE)[*] Running coverage...$(RESET)"
	@forge coverage

clean:
	@echo "$(BLUE)[*] Cleaning up...$(RESET)"
	@rm -rf out cache

fmt:
	@echo "$(BLUE)[*] Formatting Solidity files...$(RESET)"
	@forge fmt

