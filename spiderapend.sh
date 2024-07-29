#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <list.txt> <mode>"
    echo "Mode 1: Append full subdomain (e.g., pod.example.com/pod.example.com)"
    echo "Mode 2: Append only subdomain name (e.g., pod.example.com/pod)"
    exit 1
fi

# Read the file and mode
file=$1
mode=$2

# Validate mode
if [ "$mode" -ne 1 ] && [ "$mode" -ne 2 ]; then
    echo "Invalid mode. Please use mode 1 or 2."
    exit 1
fi

# Process the file based on the selected mode
while IFS= read -r subdomain; do
    if [ "$mode" -eq 1 ]; then
        # Mode 1: Append full subdomain
        echo "$subdomain/$subdomain"
    elif [ "$mode" -eq 2 ]; then
        # Mode 2: Append only the subdomain name
        sub_name=$(echo "$subdomain" | cut -d'.' -f1)
        echo "$subdomain/$sub_name"
    fi
done < "$file"
