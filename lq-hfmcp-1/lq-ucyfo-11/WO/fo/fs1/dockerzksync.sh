#!/usr/bin/bash
# UTility Functions Mentioned in the course

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

# Funtions

dock_setup() {
    h1 "Setup Docker to run with zksync"
    CO1="docker run -it -v ./zksyncz:/zkz ubuntu:22.04 bash"
    echo -e "${GREEN}Command: ${NC}${CO1}"
    eval "$CO1"
}

docker_getin() {
    h1 "Setup Docker to run with zksync"
    CO1="docker ps -a"
    CO2="docker start thirsty_borg"
    CO3="docker exec -it thirsty_borg fish"
    echo -e "${GREEN}Command: ${NC}${CO1}"
    echo -e "${GREEN}Command: ${NC}${CO2}"
    echo -e "${GREEN}Command: ${NC}${CO3}"
    eval "$CO1" && eval "$CO2" && eval "$CO3"
}

# Execution
docker_getin
