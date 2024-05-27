#!/bin/bash

# Prompt the user to enter the value of N
read -p "Enter the value of N: " N

# Check if N is a positive integer
if ! [[ "$N" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: Please enter a positive integer."
    exit 1
fi

# Loop through integers from 1 to N
for ((i=1; i<=N; i++)); do
    # Check if the integer is divisible by both 3 and 5
    if ((i % 3 == 0)) && ((i % 5 == 0)); then
        echo "FizzBuzz"
    # Check if the integer is divisible by 3
    elif ((i % 3 == 0)); then
        echo "Fizz"
    # Check if the integer is divisible by 5
    elif ((i % 5 == 0)); then
        echo "Buzz"
    # If none of the above conditions are met, print the integer itself
    else
        echo "$i"
    fi
done
