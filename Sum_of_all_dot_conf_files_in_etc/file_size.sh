#!/bin/bash

# Define the directory to search
directory="/etc/"

# Define the suffix of files to search for
suffix=".conf"

# Initialize the output file and error file
output_file="etc-file_sizes.txt"
error_file="unreadable_files.txt"

# Find all files recursively in /etc/ with the suffix .conf and write their sizes to the output file
# Redirect error output to the error file
find "$directory" -type f -name "*$suffix" -exec stat -c "%s %n" {} + > "$output_file" 2>"$error_file"

# Phase 2: Add up all the sizes from the text file
# Initialize total size variable
total_size=0

# Read each size and filename from the output file and calculate the total size
while read -r size filename; do
    if [[ -r "$filename" ]]; then
        (( total_size += size ))
    fi
done < "$output_file"

echo "Total size of .conf files in /etc/: $total_size bytes"
