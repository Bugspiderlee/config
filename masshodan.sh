#!/bin/bash

# Function to run shosubgo on a domain
run_shosubgo() {
    domain=$1
    api_key=$2
    # Construct the command
    command="shosubgo -d $domain -s $api_key"

    # Run the command
    $command
}

# Function to process domains from a file
process_domains_from_file() {
    file_path=$1
    api_key=$2
    # Read the list of domains from the file
    while IFS= read -r domain || [ -n "$domain" ]; do
        # Run shosubgo for the current domain
        run_shosubgo "$domain" "$api_key"

        # Wait for 10 seconds before moving to the next domain
        sleep 10
    done < "$file_path"
}

# Check if the wordlist file and API key are provided as command-line arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <wordlist_file> <api_key>"
    exit 1
fi

# Check if the provided file exists
if [ ! -f "$1" ]; then
    echo "File not found: $1"
    exit 1
fi

# Process domains from the file
process_domains_from_file "$1" "$2"
