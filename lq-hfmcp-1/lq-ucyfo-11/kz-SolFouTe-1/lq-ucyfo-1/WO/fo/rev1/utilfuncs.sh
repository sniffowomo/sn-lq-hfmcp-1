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

# --- Cast - get contract bytecode
cast_bytecode() {
    h1 "Cast Get Contract Bytecode"

    KONTRACT="0xDb441F74E8B7307220823e228659415fFB7A59aa"

    # Create filename with date appended (format: YYYYMMDD_HHMMSS)
    DATE_STAMP=$(date '+%Y%m%d_%H%M%S')
    OUTPUT_FILE="cmdrun/cast_bytecode_run_${DATE_STAMP}.txt"

    co1="cast code $KONTRACT -r ${rpcz[1]}"
    echo -e "${GREEN}Command: ${NC}${co1}"

    # First write the date to the file
    echo "Date: $(date '+%Y-%m-%d %H:%M:%S')" >"$OUTPUT_FILE"
    echo "Command: $co1" >>"$OUTPUT_FILE"
    echo "-------------------------------------------" >>"$OUTPUT_FILE"

    # Now append the command output to the file that already has the date
    output=$(eval "$co1" | tee -a "$OUTPUT_FILE")

    echo -e "${GREEN}Output: ${NC} \n----\n $output $"

    echo -e "\n${GREEN}Bytecode saved to:${NC} $OUTPUT_FILE"

}

# --- Cast - Source
cast_source() {
    h1 "Cast source get contract source"

    KONTRACT="0x4c34050168E0e19EEC6fB6d462BeD51840350c43"

    # Create filename with date appended (format: YYYYMMDD_HHMMSS)
    DATE_STAMP=$(date '+%Y%m%d_%H%M%S')
    OUTPUT_FILE="cmdrun/cast_src_run_${DATE_STAMP}.txt"
    CHAIN="holesky"

    co1="cast source ${KONTRACT} \
    -d cmdrun \
    -e ${ETHERSCAN_API_KEY} \
    -c ${CHAIN} "

    echo -e "${GREEN}Command: ${NC}${co1}"

    # First write the date to the file
    echo "Date: $(date '+%Y-%m-%d %H:%M:%S')" >"$OUTPUT_FILE"
    echo "Command: $co1" >>"$OUTPUT_FILE"
    echo "-------------------------------------------" >>"$OUTPUT_FILE"

    # Now append the command output to the file that already has the date
    output=$(eval "$co1" | tee -a "$OUTPUT_FILE")

    echo -e "${GREEN}Output: ${NC} \n----\n $output $"

    echo -e "\n${GREEN}Bytecode saved to:${NC} $OUTPUT_FILE"
}

# --- Cast - etherscan source
cast_bytecode_disassemmble() {
    h1 "cast source get sourcecode of contract"

    KONTRACT="0xDb441F74E8B7307220823e228659415fFB7A59aa"

    # Create filename with date appended (format: YYYYMMDD_HHMMSS)
    DATE_STAMP=$(date '+%Y%m%d_%H%M%S')
    OUTPUT_FILE="cmdrun/cast_ethsrc_${DATE_STAMP}.txt"

    co1="cast source $KONTRACT -r ${rpcz[1]}"
    echo -e "${GREEN}Command: ${NC}${co1}"

    # First write the date to the file
    echo "Date: $(date '+%Y-%m-%d %H:%M:%S')" >"$OUTPUT_FILE"
    echo "Command: $co1" >>"$OUTPUT_FILE"
    echo "-------------------------------------------" >>"$OUTPUT_FILE"

    # Now append the command output to the file that already has the date
    output=$(eval "$co1" | tee -a "$OUTPUT_FILE")

    echo -e "${GREEN}Output: ${NC} \n----\n $output $"

    echo -e "\n${GREEN}Bytecode saved to:${NC} $OUTPUT_FILE"
}

#--- Cast Interface ---
cast_interface() {
    h1 "Cast get interface of contract"

    KONTRACT="0xd960606c3c748B5502De2a81756E63ad0E1480c5"
    CHAIN="holesky"

    # Create filename with date appended (format: YYYYMMDD_HHMMSS)
    DATE_STAMP=$(date '+%Y%m%d_%H%M%S')
    OUTPUT_FILE="cmdrun/cast_Interface_${DATE_STAMP}.txt"

    co1="cast interface $KONTRACT \
    -o cmdrun/${KONTRACT}.sol \
    -c ${CHAIN} \
    -e ${ETHERSCAN_API_KEY} "

    echo -e "${GREEN}Command: ${NC}${co1}"

    # First write the date to the file
    echo "Date: $(date '+%Y-%m-%d %H:%M:%S')" >"$OUTPUT_FILE"
    echo "Command: $co1" >>"$OUTPUT_FILE"
    echo "-------------------------------------------" >>"$OUTPUT_FILE"

    # Now append the command output to the file that already has the date
    output=$(eval "$co1" | tee -a "$OUTPUT_FILE")

    echo -e "${GREEN}Output: ${NC} \n----\n $output $"

    echo -e "\n${GREEN}RunOutput = :${NC} $OUTPUT_FILE"
}

# //////////////////// Cast send and call functions ////////////////
# //////////////////// Cast send and call functions ////////////////
# //////////////////// Cast send and call functions ////////////////
# //////////////////// Cast send and call functions ////////////////

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
    h1 "cast send to holeksy - Transfer Function"

    echo -e "██╗  ██╗  ██████╗  ██╗      ███████╗ ███████╗ ██╗  ██╗ ██╗   ██╗"
    echo -e "██║  ██║ ██╔═══██╗ ██║      ██╔════╝ ██╔════╝ ██║ ██╔╝ ╚██╗ ██╔╝"
    echo -e "███████║ ██║   ██║ ██║      █████╗   ███████╗ █████╔╝   ╚████╔╝ "
    echo -e "██╔══██║ ██║   ██║ ██║      ██╔══╝   ╚════██║ ██╔═██╗    ╚██╔╝  "
    echo -e "██║  ██║ ╚██████╔╝ ███████╗ ███████╗ ███████║ ██║  ██╗    ██║   "
    echo -e "╚═╝  ╚═╝  ╚═════╝  ╚══════╝ ╚══════╝ ╚══════╝ ╚═╝  ╚═╝    ╚═╝   "

    HOLE_DC="0xd960606c3c748B5502De2a81756E63ad0E1480c5"

    # Main Command
    CO1="cast send \
    ${HOLE_DC} \
    'transfer(address,uint256)' 0x420fFfdA7565D31e9b4b7ebAF0269b5564644656 500000000000000 \
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

# ///////////////// Holeksy Deployed Contract Interaction ////////////////
# Multiple Commands
cast_hol1_multi() {
    h1 "cast send to holeksy"

    echo -e "██╗  ██╗  ██████╗  ██╗      ███████╗ ███████╗ ██╗  ██╗ ██╗   ██╗"
    echo -e "██║  ██║ ██╔═══██╗ ██║      ██╔════╝ ██╔════╝ ██║ ██╔╝ ╚██╗ ██╔╝"
    echo -e "███████║ ██║   ██║ ██║      █████╗   ███████╗ █████╔╝   ╚████╔╝ "
    echo -e "██╔══██║ ██║   ██║ ██║      ██╔══╝   ╚════██║ ██╔═██╗    ╚██╔╝  "
    echo -e "██║  ██║ ╚██████╔╝ ███████╗ ███████╗ ███████║ ██║  ██╗    ██║   "
    echo -e "╚═╝  ╚═╝  ╚═════╝  ╚══════╝ ╚══════╝ ╚══════╝ ╚═╝  ╚═╝    ╚═╝   "

    HOLE_DC="0xd960606c3c748B5502De2a81756E63ad0E1480c5"

    # Retrieve Function
    COLF1="'retrieve()'"
    CO1="cast call \
    ${HOLE_DC} \
    ${COLF1} \
    --rpc-url ${rpcz[1]}  \
    | cast --to-dec"

    # Set Function
    CO2F1="'increment()'"
    CO2="cast send \
    ${HOLE_DC} \
    ${CO2F1} \
    --rpc-url ${rpcz[1]} \
    --private-key ${keyz[0]} \
    "

    # Execution Sequence
    echo -e "${GREEN}Command: ${NC}${CO2}"
    RESULT=$(eval "$CO2")
    {
        echo "++++++++++++++++ $(date) ++++++++++++++++"
        echo "Command: $CO2"
        echo "Result: $RESULT"
        echo "----------------------------------------"
    } >>"./logs/cast_retrieve_holesky1.txt"
    echo -e "${GREEN}Result: ${NC}${RESULT}"
}

# Execution
# cast_hol1_multi
cast_interface
