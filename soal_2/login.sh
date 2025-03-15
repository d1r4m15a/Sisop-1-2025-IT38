#!/bin/bash

data_folder="./data"
player_db="$data_folder/player.csv"
salt="arcaea_salt"

echo -e "\nLogin to Existing Account"

# Input email
read -p "Enter your email: " email

# Check if email exists
if ! grep -q "^$email," "$player_db"; then
    echo "Email not found. Please register first."
    exit 1
fi

# Input password
read -s -p "Enter password: " password
echo
hashed_password=$(echo -n "$salt$password" | sha256sum | awk '{print $1}')

# Validate credentials
if grep -q "^$email,.*,$hashed_password" "$player_db"; then
    echo "Login successful. Welcome!"
else
    echo "Incorrect password. Try again."
    exit 1
fi
