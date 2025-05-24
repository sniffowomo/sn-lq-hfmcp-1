#!/usr/bin/bash
# This bash srcript is for installing the KL docker image here
clear

# Colors
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export WHITE='\033[0;37m'
export NC='\033[0m' # No Color

# Commands

h1() {
  echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
  echo -e "${PURPLE}$1${NC}"
  echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
}

# Execute Command

call_mcp_api() {
  local word="Missisipi"
  local letter="s"

  curl -v -X GET \
    https://redesigned-happiness-7qxgg7j9pvv2pr6q-7860.app.github.dev/ \
    -H "Content-Type: application/json" \
    -d "{
          \"word\": \"$word\",
          \"letter\": \"$letter\"
      }"
}

# Execution
call_mcp_api
