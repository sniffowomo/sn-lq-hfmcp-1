#!/usr/bin/bash
# System Commands

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

# Commands

# --- Function that finds file pattern and deletes it
fd_find_delete() {
    h1 "Finding files with fd and delete"
    co1="fd -g 'counters*.sol' -X rm -i"
    echo -e "${GREEN}Command: ${NC}${co1}"
    eval "$co1"
}

# Executions
fd_find_delete
