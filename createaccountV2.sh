#!/bin/bash

#errors found in original: 4 
Error 1:
#   Category: Syntax Error
#   Description: 'User@dd' is not a valid Linux command.
#   Solution: Changed to 'useradd'.
#
# Error 2:
#   Category: Syntax Error
#   Description: 'useradd /bin/bash $user' is incorrect syntax for assigning a shell.
#   Solution: Changed to 'useradd -m -s /bin/bash $user' to correctly specify the shell (-s) and create a home directory (-m).
#
# Error 3:
#   Category: Logic Error
#   Description: 'passwd $pwrd' attempts to change the password of a user named the value of $pwrd, and cannot set a password non-interactively.
#   Solution: Changed to 'echo "$user:$pwrd" | chpasswd' to correctly set the user's password in the background.
#
# Error 4:
#   Category: Logic Error (Missing Functionality)
#   Description: The script is missing the functionality to assign the user to a group, which is a stated requirement.
#   Solution: Added a prompt to ask for the group name, and used 'usermod -aG $group $user' to assign the user to the specified group.

# Prompt for username
read -p "Enter Username: " user

# Prompt for password (using -s to hide the typing)
read -s -p "Enter Password: " pwrd
echo "" # Adds a blank line after the hidden password input

# Prompt for the group name
read -p "Enter Group Name (e.g., students or teachers): " group

# Create the user with a home directory and bash shell
useradd -m -s /bin/bash "$user"

# Set the password for the user non-interactively
echo "$user:$pwrd" | chpasswd

# Assign the user to the specified group
usermod -aG "$group" "$user"

echo "User '$user' has been successfully created and added to the '$group' group."
