#!/bin/bash

data_folder="./data"
player_db="$data_folder/player.csv"
salt="arcaea_salt"

mkdir -p "$data_folder"
touch "$player_db"

echo -e "\nRegister New Account"

# Input email
while true; do
    read -p "Enter your email: " email
    if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        if grep -q "^$email," "$player_db"; then
            echo "Email is already registered. Please use another email."
        else
            break
        fi
    else
        echo "Invalid email format. Try again."
    fi
done

# Input username
read -p "Enter your username: " username

# Input password
while true; do
    read -s -p "Enter password: " password
    echo
    if [[ ${#password} -ge 8 && "$password" =~ [A-Z] && "$password" =~ [a-z] && "$password" =~ [0-9] ]]; then
        hashed_password=$(echo -n "$salt$password" | sha256sum | awk '{print $1}')
        echo "$email,$username,$hashed_password" >> "$player_db"
        echo "Registration successful"
        sleep 2
        break
    else
        echo "Password must be at least 8 characters, contain an uppercase letter, a lowercase letter, and a number."
    fi
done
