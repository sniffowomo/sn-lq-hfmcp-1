#!/usr/bin/bash
# This bash srcript is for making cast accounts
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

# Cast Ballance Checking Function
cwb() {
    # Define Colors
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    NC='\033[0m' # No Color

    local script_name="Balance Checker"
    echo -e "${GREEN}${script_name}${NC}"

    # Generate timestamped log file
    local log_file="wallet_balance_$(date +%Y-%m-%d).log"

    # Truncate or create the log file
    >"$log_file"

    # --- Configuration ---
    # Wallet Addresses
    local -a wallets=(
        "0xA465600233997C758744d21ec8Bd0F5E84340e19"
    )

    # Network Configurations (Format: "NetworkName:RPC_URL")
    local -a networks=(
        "Sepolia:https://eth-sepolia.g.alchemy.com/v2/y-cD2hUWMXwa6cAWy7uplLSSoRQ5v7Fx "
        "Holesky:https://eth-holesky.g.alchemy.com/v2/y-cD2hUWMXwa6cAWy7uplLSSoRQ5v7Fx "
    )
    # --- End Configuration ---

    # Check for 'cast' command dependency
    if ! command -v cast &>/dev/null; then
        local error_msg="${RED}Error: 'cast' command not found. Please install Foundry (https://getfoundry.sh ).${NC}"
        echo -e "$error_msg"
        echo "$error_msg" >>"$log_file"
        return 1
    fi

    local overall_status=0 # 0 = success, 1 = failure occurred

    # Loop through each wallet
    for wallet_address in "${wallets[@]}"; do
        local header="--- Checking Wallet: ${wallet_address} ---"
        echo -e "$header"
        echo "$header" >>"$log_file"

        # Loop through each network for the current wallet
        for network_info in "${networks[@]}"; do
            # Split network info into name and URL
            IFS=':' read -r network_name rpc_url <<<"$network_info"

            local status_line="Checking ${network_name}..."
            echo -e "$status_line"
            echo "$status_line" >>"$log_file"

            local balance_output
            local exit_code

            # Execute the cast command
            balance_output=$(cast balance --ether "${wallet_address}" --rpc-url "${rpc_url}" 2>&1)
            exit_code=$?

            if [ $exit_code -ne 0 ]; then
                # Log error
                local error_msg="${RED}Error:${NC} Failed to get ${network_name} balance."
                local detail_msg="${RED}Details:${NC} ${balance_output}"
                echo -e "$error_msg"
                echo -e "$detail_msg"
                echo "$error_msg" >>"$log_file"
                echo "$detail_msg" >>"$log_file"
                overall_status=1
            else
                # Success
                local success_msg="${GREEN}${network_name} Balance:${NC} ${balance_output} ETH"
                echo -e "$success_msg"
                echo "$success_msg" >>"$log_file"
            fi
        done

        local divider="-------------------------------------------------------"
        echo "$divider"
        echo "$divider" >>"$log_file"
    done

    # Final status report
    if [ $overall_status -ne 0 ]; then
        local final_msg="${YELLOW}Balance Check Completed with errors.${NC}"
        echo -e "$final_msg"
        echo "$final_msg" >>"$log_file"
        return 1
    else
        local final_msg="${GREEN}Balance Check Completed Successfully.${NC}"
        echo -e "$final_msg"
        echo "$final_msg" >>"$log_file"
        return 0
    fi
}
# Sending function

cas() {
    echo -e "${GREEN}Sending function called${NC}"

    # --- Configuration ---
    local -a wallets=(
        "0xA465600233997C758744d21ec8Bd0F5E84340e19"
    )

    local -a rcvwallets=(
        "0xE987E28074D6E66D735Bb006ebbfe567350CB79d"
    )

    local -a keyz=(
        "0x953d1aa8fae6d88b5df924bb68de806142527764160ede872925502a525bfad5"
    )

    # Network Configurations (Format: "NetworkName:RPC_URL")
    local -a networks=(
        "https://eth-sepolia.g.alchemy.com/v2/y-cD2hUWMXwa6cAWy7uplLSSoRQ5v7Fx"
        "https://eth-holesky.g.alchemy.com/v2/y-cD2hUWMXwa6cAWy7uplLSSoRQ5v7Fx"
    )

    # --- AmountSend ---
    local amount_send=0.03 # Amount to send in ETH

    CO1="cast send --rpc-url ${networks[1]}  \
    --private-key ${keyz[0]} \
    ${rcvwallets[0]} \
    --value ${amount_send}ether"

    echo -e "${GREEN}Sending ${amount_send} ETH from ${wallets[0]} to ${rcvwallets[0]} on ${networks[1]}...${NC}"
    send_output=$(eval "$CO1" 2>&1)
    if [ $? -ne 0 ]; then
        echo -e "${RED}Error: ${send_output}${NC}"
        return 1 # Indicate failure
    fi
    echo -e "${GREEN}Transaction successful: ${send_output}${NC}"
    echo -e "${GREEN}Transaction hash: ${send_output}${NC}"
}

# Execution
cwb
