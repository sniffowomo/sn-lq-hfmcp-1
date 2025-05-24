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

hea1() {
    echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
    echo -e "${PURPLE}$1${NC}"
    echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
}

foset() {
    hea1 "Setup a foundry project, setup uv venv and install slither"
    # Get name of Project
    echo -e "Enter the name of the project: "
    read name_of_project
    if [ -z "$name_of_project" ]; then
        echo -e "${RED}BASTARD ! Project name cannot be empty${NC}"
        exit 1
    fi

    # Commands to execute
    CO1="forge init --no-commit --no-git --force --vscode $name_of_project && cd $name_of_project "
    CO2="uv venv && source venv/bin/activate.fish"
    CO3="uv pip install slither-analyzer"
    CO4="solc-select install 0.8.13 && solc-select use 0.8.13"

    # Execution Commands
    eval "$CO1"
    eval "$CO2"
    eval "$CO3"
    eval "$CO4"

    echo -e "${GREEN}Now run ${CO4}${NC}"
}

fo_only() {
    hea1 "Setup a foundry project, setup uv venv and install slither"
    # Get name of Project
    echo -e "Enter the name of the project: "
    read name_of_project
    if [ -z "$name_of_project" ]; then
        echo -e "${RED}BASTARD ! Project name cannot be empty${NC}"
        exit 1
    fi

    # Commands to execute
    CO1="forge init --no-commit --no-git --force --vscode $name_of_project && cd $name_of_project "

    # Execution Commands
    eval "$CO1"

    echo -e "${GREEN}Foundry Only Install ${CO4}${NC}"
}

######### Foundry Executions ############

# Declare the rpc and key arrays
rpcz=(
    "https://eth-sepolia.g.alchemy.com/v2/y-cD2hUWMXwa6cAWy7uplLSSoRQ5v7Fx"
    "https://eth-holesky.g.alchemy.com/v2/y-cD2hUWMXwa6cAWy7uplLSSoRQ5v7Fx"
)
keyz=(
    "0x6890220d6cc0218032cab963a528672d85643a2c7edf340de6e27861d1900958"
    "0xff630bf91f95d3e7af70c12490b858cd5e0818b2bc6af6fccff9d933a1097bc4"

)
accz=(
    "0x420A8Fe13265Df3B9323C3D7681b2854B1309338"
    "0x420fFfdA7565D31e9b4b7ebAF0269b5564644656"

)
ETHERSCAN_API_KEY="2JEANQYC4C9S6PKDFWNGVT2UER24T32D2M"

# Testing
fo_test() {
    hea1 "Foundry Run"
    CO1="forge test"
    eval "$CO1"
}

fo_create_holeksy() {
    hea1 "Foundry Create - One of contract deployment"

    CONTRACT_PATH="src/Counter.sol:Counter"
    LOG_FILE="logs/deploy_create_holesky.log"
    mkdir -p logs

    echo -e "██╗  ██╗  ██████╗  ██╗      ███████╗ ███████╗ ██╗  ██╗ ██╗   ██╗"
    echo -e "██║  ██║ ██╔═══██╗ ██║      ██╔════╝ ██╔════╝ ██║ ██╔╝ ╚██╗ ██╔╝"
    echo -e "███████║ ██║   ██║ ██║      █████╗   ███████╗ █████╔╝   ╚████╔╝ "
    echo -e "██╔══██║ ██║   ██║ ██║      ██╔══╝   ╚════██║ ██╔═██╗    ╚██╔╝  "
    echo -e "██║  ██║ ╚██████╔╝ ███████╗ ███████╗ ███████║ ██║  ██╗    ██║   "
    echo -e "╚═╝  ╚═╝  ╚═════╝  ╚══════╝ ╚══════╝ ╚══════╝ ╚═╝  ╚═╝    ╚═╝   "

    CO1="forge create ${CONTRACT_PATH} \
        --rpc-url ${rpcz[1]} \
        --private-key ${keyz[0]} \
        --etherscan-api-key ${ETHERSCAN_API_KEY} \
        --verify --broadcast \
        --out outz/"

    echo -e "${BLUE}Running: $CO1${NC}"

    # Run and log to file
    eval "$CO1" 2>&1 | tee "$LOG_FILE"

    echo -e "${GREEN}Successfully deployed contract${NC}"
    echo -e "${YELLOW}Log saved to $LOG_FILE${NC}"
}

fo_create_sepolia() {
    hea1 "Foundry Create - One of contract deployment"

    CONTRACT_PATH="src/Counter.sol:Counter"
    LOG_FILE="logs/deploy_create_sepolia.log"
    mkdir -p logs

    echo -e "███████╗ ███████╗ ██████╗   ██████╗  ██╗      ██╗  █████╗ "
    echo -e "██╔════╝ ██╔════╝ ██╔══██╗ ██╔═══██╗ ██║      ██║ ██╔══██╗"
    echo -e "███████╗ █████╗   ██████╔╝ ██║   ██║ ██║      ██║ ███████║"
    echo -e "╚════██║ ██╔══╝   ██╔═══╝  ██║   ██║ ██║      ██║ ██╔══██║"
    echo -e "███████║ ███████╗ ██║      ╚██████╔╝ ███████╗ ██║ ██║  ██║"
    echo -e "╚══════╝ ╚══════╝ ╚═╝       ╚═════╝  ╚══════╝ ╚═╝ ╚═╝  ╚═╝"

    CO1="forge create ${CONTRACT_PATH} \
        --rpc-url ${rpcz[0]} \
        --private-key ${keyz[0]} \
        --etherscan-api-key ${ETHERSCAN_API_KEY} \
        --verify --broadcast \
        --out outz/"

    echo -e "${BLUE}Running: $CO1${NC}"

    # Run and log to file
    eval "$CO1" 2>&1 | tee "$LOG_FILE"

    echo -e "${GREEN}Successfully deployed contract${NC}"
    echo -e "${YELLOW}Log saved to $LOG_FILE${NC}"
}

fo_script_holeksy() {
    hea1 "Foundry Script - One of contract deployment"

    LOG_FILE="logs/deploy_script._holesky.log"
    mkdir -p logs

    echo -e "██╗  ██╗  ██████╗  ██╗      ███████╗ ███████╗ ██╗  ██╗ ██╗   ██╗"
    echo -e "██║  ██║ ██╔═══██╗ ██║      ██╔════╝ ██╔════╝ ██║ ██╔╝ ╚██╗ ██╔╝"
    echo -e "███████║ ██║   ██║ ██║      █████╗   ███████╗ █████╔╝   ╚████╔╝ "
    echo -e "██╔══██║ ██║   ██║ ██║      ██╔══╝   ╚════██║ ██╔═██╗    ╚██╔╝  "
    echo -e "██║  ██║ ╚██████╔╝ ███████╗ ███████╗ ███████║ ██║  ██╗    ██║   "
    echo -e "╚═╝  ╚═╝  ╚═════╝  ╚══════╝ ╚══════╝ ╚══════╝ ╚═╝  ╚═╝    ╚═╝   "

    CO1="forge script script/Counter.s.sol:CounterScript \
        --rpc-url ${rpcz[1]} \
        --private-key ${keyz[0]} \
        --broadcast \
        --out outz/"

    echo -e "${BLUE}Running: $CO1${NC}"

    # Run and log to file
    eval "$CO1" 2>&1 | tee "$LOG_FILE"

    echo -e "${GREEN}Successfully deployed contract${NC}"
    echo -e "${YELLOW}Log saved to $LOG_FILE${NC}"
}

fo_script_sepolia() {
    hea1 "Foundry Script - One of contract deployment"

    LOG_FILE="logs/deploy_script_sepolia.log"
    mkdir -p logs

    echo -e "███████╗ ███████╗ ██████╗   ██████╗  ██╗      ██╗  █████╗ "
    echo -e "██╔════╝ ██╔════╝ ██╔══██╗ ██╔═══██╗ ██║      ██║ ██╔══██╗"
    echo -e "███████╗ █████╗   ██████╔╝ ██║   ██║ ██║      ██║ ███████║"
    echo -e "╚════██║ ██╔══╝   ██╔═══╝  ██║   ██║ ██║      ██║ ██╔══██║"
    echo -e "███████║ ███████╗ ██║      ╚██████╔╝ ███████╗ ██║ ██║  ██║"
    echo -e "╚══════╝ ╚══════╝ ╚═╝       ╚═════╝  ╚══════╝ ╚═╝ ╚═╝  ╚═╝"

    CO1="forge script script/Counter.s.sol:CounterScript \
        --rpc-url ${rpcz[1]} \
        --private-key ${keyz[0]} \
        --broadcast \
        --out outz/"

    echo -e "${BLUE}Running: $CO1${NC}"

    # Run and log to file
    eval "$CO1" 2>&1 | tee "$LOG_FILE"

    echo -e "${GREEN}Successfully deployed contract${NC}"
    echo -e "${YELLOW}Log saved to $LOG_FILE${NC}"
}

# Execution
fo_script
