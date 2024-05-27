#!/bin/bash

read -p "Enter the input file name: " input_file
output_file="working_ips.txt"

read -p "Enter timeout in seconds: " timeout

# Check if file exists
if [[ ! -f "$input_file" ]]; then
  echo "Input file not found!"
  exit 1
fi

# Check if timeout is not zero
if [[ -z "$timeout" || "$timeout" -eq 0 ]]; then
  echo "Timeout must be higher than 0!"
  exit 1
fi

# Ensure output file is empty before starting
> $output_file

# Read each IP from the input file
while IFS= read -r ip; do
  # Ping the IP with a timeout
  if ping -w $timeout -c 1 $ip &> /dev/null; then
    # If the ping is successful, write the IP to the output file
    echo "$ip" >> $output_file
  fi
done < "$input_file"

echo "Pingable IPs written to $output_file"
