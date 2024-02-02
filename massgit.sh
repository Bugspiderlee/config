#!/bin/bash

# Function to run github-subdomains on a domain
run_github_subdomains() {
    domain=$1
    # Construct the command
    command="github-subdomains -d $domain -raw"
    
    # Run the command
    $command
}

# Function to process domains from a file
process_domains_from_file() {
    file_path=$1
    # Read the list of domains from the file
    while IFS= read -r domain || [ -n "$domain" ]; do
        # Run github-subdomains for the current domain
        run_github_subdomains "$domain"

        # Wait for 10 seconds before moving to the next domain
        sleep 10
    done < "$file_path"
}

# Replace 'your_input_file.txt' with the path to your text file containing domains
input_file_path='./1.txt'

# Process domains from the file
process_domains_from_file "$input_file_path"
