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

# --- HF install Command ---

# Installs the HF CLI
hf_in() {
    h1 "HF Pip Install"
    co1='pip install -U "huggingface_hub[cli]"'
    echo -e "--- Executing ${co1} ---"
    eval "$co1"
}

# Repo Creation Commands
hf_repo() {
    h1 "HF Repo Creation"

    # Enter name of Project
    echo -e "Enter the name of the project: "
    read name_of_project
    if [ -z "$name_of_project" ]; then
        echo -e "${RED}BASTARD ! Project name cannot be empty${NC}"
        exit 1
    fi
    co2="huggingface-cli repo create ${name_of_project}"
    echo -e "--- Executing ${co2} ---"
    eval "$co2"
}

# HF Space Creation Commands
hf_space() {
    h1 "HF Space Creation"
    # Enter name of Project
    echo -e "Enter the name space of the project: "
    read name_of_space
    if [ -z "$name_of_space" ]; then
        echo -e "${RED}BASTARD ! Project name cannot be empty${NC}"
        exit 1
    fi
    co1="huggingface-cli repo create ${name_of_space} --type=space --space_sdk gradio -y"
    echo -e "--- Executing ${co1} ---"
    eval "$co1"
}

# Hugginface space upload
hf_space_upload() {
    h1 "HF Space Upload"
    SPACE="gmptut1"

    # Define the files to include
    INCLUDE_FILES="\"app.py\" \"requirements.txt\""

    co1="huggingface-cli upload \
    --repo-type=space ${SPACE} \
    --include=${INCLUDE_FILES}  "

    echo -e "--- Executing ${co1} ---"
    eval "$co1"
}

# Execution
# hf_repo
hf_space_upload
