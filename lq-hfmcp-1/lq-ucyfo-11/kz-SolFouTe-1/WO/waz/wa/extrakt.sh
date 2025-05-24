#!/bin/bash

# Input file
input_file="wc.txt"

# Output files
address_file="addy.txt"
private_key_file="pk.txt"

# Clear or create the output files
>"$address_file"
>"$private_key_file"

# Read the input file line by line
while IFS= read -r line; do
    if [[ "$line" == Address:* ]]; then
        # Extract address and append to addy.txt
        echo "$line" | awk '{print $2}' >>"$address_file"
    elif [[ "$line" == "Private Key:"* ]]; then
        # Extract private key and append to pk.txt
        echo "$line" | awk '{print $3}' >>"$private_key_file"
    fi
done <"$input_file"

echo "✅ Addresses extracted to: $(pwd)/$address_file"
echo "✅ Private keys extracted to: $(pwd)/$private_key_file"
