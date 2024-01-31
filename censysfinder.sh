#!/bin/bash

# Check if the number of arguments is correct
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <targets_file>"
    exit 1
fi

# Read the targets file from the command line argument
targets_file=$1

# Loop over each domain in the targets file and run the Python script
while IFS= read -r domain || [ -n "$domain" ]; do
    python3 censys-subdomain-finder.py "$domain"

    # Sleep for 1 second before moving to the next domain
    sleep 1
done < "$targets_file"
