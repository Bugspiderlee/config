#!/bin/bash

# Check if a target is provided
if [ -z "$1" ]; then
  echo "Usage: $0 target.com"
  exit 1
fi

TARGET=$1

echo "Running puredns bruteforce with best-dns-wordlist.txt against $TARGET..."
puredns bruteforce best-dns-wordlist.txt $TARGET -l 5000 | tee ${TARGET}-ratscan-best.txt

echo "Finished running puredns bruteforce with best-dns-wordlist.txt against $TARGET."

echo "Running puredns bruteforce with 2m-subdomains.txt against $TARGET..."
puredns bruteforce 2m-subdomains.txt $TARGET -l 5000 | tee ${TARGET}-ratscan-2m.txt

echo "Finished running puredns bruteforce with 2m-subdomains.txt against $TARGET."

echo "Running puredns bruteforce with all.txt against $TARGET..."
puredns bruteforce all.txt $TARGET -l 5000 | tee ${TARGET}-ratscan-all-w.txt

echo "Finished running puredns bruteforce with all.txt against $TARGET."

echo "Results have been saved to the following files:"
echo "${TARGET}-ratscan-best.txt"
echo "${TARGET}-ratscan-2m.txt"
echo "${TARGET}-ratscan-all-w.txt"
