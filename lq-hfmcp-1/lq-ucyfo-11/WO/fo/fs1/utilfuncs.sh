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

# Variables
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
# Functions

# Cast function to convert hex to decimal
ca1() {
    h1 "cast convert hexadecimal to function"
    TO_CONVERT="0xac468"
    CO1="cast --to-base ${TO_CONVERT} dec"
    echo -e "${GREEN}Command: ${NC}${CO1}"
    RESULT=$(eval "$CO1")
    echo -e "${TO_CONVERT} to decimal = ${GREEN}$RESULT${NC}"
}

# Using cast to interact with accounts
cast_send_anvil1() {
    h1 "cast send to interact with contracts"

    # Important Vars
    DEPLOYED_CONTRACT_ANVIL="0x5FbDB2315678afecb367f032d93F642f64180aa3"
    ANVIL_URL="127.0.0.1:8545"
    ANVIL_PK1="0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"

    # Main Command
    CO1="cast send \
    ${DEPLOYED_CONTRACT_ANVIL} \
    'store(uint256)' 69 \
    --rpc-url ${ANVIL_URL} \
    --private-key ${ANVIL_PK1} \
    "

    # Execution Sequence
    echo -e "${GREEN}Command: ${NC}${CO1}"
    RESULT=$(eval "$CO1")
    {
        echo "++++++++++++++++ $(date) ++++++++++++++++"
        echo "Command: $CO1"
        echo "Result: $RESULT"
        echo "----------------------------------------"
    } >>"./logs/cast_send.txt"
    echo -e "${GREEN}Result: ${NC}${RESULT}"
}

# Cast Send to Holesky
cast_send_hol1() {
    h1 "cast send to holeksy"

    echo -e "██╗  ██╗  ██████╗  ██╗      ███████╗ ███████╗ ██╗  ██╗ ██╗   ██╗"
    echo -e "██║  ██║ ██╔═══██╗ ██║      ██╔════╝ ██╔════╝ ██║ ██╔╝ ╚██╗ ██╔╝"
    echo -e "███████║ ██║   ██║ ██║      █████╗   ███████╗ █████╔╝   ╚████╔╝ "
    echo -e "██╔══██║ ██║   ██║ ██║      ██╔══╝   ╚════██║ ██╔═██╗    ╚██╔╝  "
    echo -e "██║  ██║ ╚██████╔╝ ███████╗ ███████╗ ███████║ ██║  ██╗    ██║   "
    echo -e "╚═╝  ╚═╝  ╚═════╝  ╚══════╝ ╚══════╝ ╚══════╝ ╚═╝  ╚═╝    ╚═╝   "

    HOLE_DC="0x1E70089ccDf57818BD7f4A6B80b144403Ff99072"

    # Main Command
    CO1="cast send \
    ${HOLE_DC} \
    'store(uint256)' 666999 \
    --rpc-url ${rpcz[1]} \
    --private-key ${keyz[0]} \
    "

    # Execution Sequence
    echo -e "${GREEN}Command: ${NC}${CO1}"
    RESULT=$(eval "$CO1")
    {
        echo "++++++++++++++++ $(date) ++++++++++++++++"
        echo "Command: $CO1"
        echo "Result: $RESULT"
        echo "----------------------------------------"
    } >>"./logs/cast_send_holesky1.txt"
    echo -e "${GREEN}Result: ${NC}${RESULT}"
}

cast_send_sep1() {
    h1 "cast send to SEPOLSY"

    echo -e "███████╗ ███████╗ ██████╗   ██████╗  ██╗      ███████╗ ██╗  ██╗ ██╗"
    echo -e "██╔════╝ ██╔════╝ ██╔══██╗ ██╔═══██╗ ██║      ██╔════╝ ██║ ██╔╝ ██║"
    echo -e "███████╗ █████╗   ██████╔╝ ██║   ██║ ██║      ███████╗ █████╔╝  ██║"
    echo -e "╚════██║ ██╔══╝   ██╔═══╝  ██║   ██║ ██║      ╚════██║ ██╔═██╗  ██║"
    echo -e "███████║ ███████╗ ██║      ╚██████╔╝ ███████╗ ███████║ ██║  ██╗ ██║"
    echo -e "╚══════╝ ╚══════╝ ╚═╝       ╚═════╝  ╚══════╝ ╚══════╝ ╚═╝  ╚═╝ ╚═╝"

    SEP_DC="0x22E143A618AdeadE32ae9B729Aa2254Ef02fe544"

    # Main Command
    CO1="cast send \
    ${SEP_DC} \
    'store(uint256)' 31333333333337 \
    --rpc-url ${rpcz[0]} \
    --private-key ${keyz[0]} \
    "

    # Execution Sequence
    echo -e "${GREEN}Command: ${NC}${CO1}"
    RESULT=$(eval "$CO1")
    {
        echo "++++++++++++++++ $(date) ++++++++++++++++"
        echo "Command: $CO1"
        echo "Result: $RESULT"
        echo "----------------------------------------"
    } >>"./logs/cast_send_sepolia1.txt"
    echo -e "${GREEN}Result: ${NC}${RESULT}"
}

# //////////////// Cast retruieve function ////////////////

cast_retrieve_hol1() {
    h1 "cast send to holeksy"

    echo -e "██╗  ██╗  ██████╗  ██╗      ███████╗ ███████╗ ██╗  ██╗ ██╗   ██╗"
    echo -e "██║  ██║ ██╔═══██╗ ██║      ██╔════╝ ██╔════╝ ██║ ██╔╝ ╚██╗ ██╔╝"
    echo -e "███████║ ██║   ██║ ██║      █████╗   ███████╗ █████╔╝   ╚████╔╝ "
    echo -e "██╔══██║ ██║   ██║ ██║      ██╔══╝   ╚════██║ ██╔═██╗    ╚██╔╝  "
    echo -e "██║  ██║ ╚██████╔╝ ███████╗ ███████╗ ███████║ ██║  ██╗    ██║   "
    echo -e "╚═╝  ╚═╝  ╚═════╝  ╚══════╝ ╚══════╝ ╚══════╝ ╚═╝  ╚═╝    ╚═╝   "

    HOLE_DC="0x1E70089ccDf57818BD7f4A6B80b144403Ff99072"

    # Main Command
    CO1="cast call \
    ${HOLE_DC} \
    'retrieve()' \
    --rpc-url ${rpcz[1]}  \
    | cast --to-dec"

    # Execution Sequence
    echo -e "${GREEN}Command: ${NC}${CO1}"
    RESULT=$(eval "$CO1")
    {
        echo "++++++++++++++++ $(date) ++++++++++++++++"
        echo "Command: $CO1"
        echo "Result: $RESULT"
        echo "----------------------------------------"
    } >>"./logs/cast_retrieve_holesky1.txt"
    echo -e "${GREEN}Result: ${NC}${RESULT}"
}

# Looper Function
panty_loope() {
    for i in {1..5}; do
        cast_send_hol1
    done
}

# Execution
# cast_send_hol1
# cast_send_sep1
cast_retrieve_hol1
# panty_loope
