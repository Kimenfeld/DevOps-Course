#!/bin/bash

# Generate a random number between 1 and 100
target=$(( (RANDOM % 100) + 1 ))

# Initialize the number of attempts
attempts=0

# Function to check if the guess is correct
check_guess() {
    if [[ $1 -eq $target ]]; then
        echo "Congratulations! You guessed the right number: $target"
        echo "You won in $attempts attempts."
        echo "$attempts" >> attempts.txt
        exit 0
    elif [[ $1 -lt $target ]]; then
        echo "Too low. Guess again."
    else
        echo "Too high. Guess again."
    fi
}

# Main game loop
echo "Welcome to the 'Guess the Number' game!"
echo "I have picked a number between 1 and 100. You have 5 attempts to guess it."

while [[ $attempts -lt 5 ]]; do
    read -p "Enter your guess: " guess
    (( attempts++ ))
    check_guess "$guess"
done

# If all attempts are used and the correct number is not guessed
echo "Sorry, you ran out of attempts. The number was: $target"
echo "You lose!"
echo "$attempts" >> attempts.txt
exit 0
