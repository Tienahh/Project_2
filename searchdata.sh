#!/bin/bash
#s4206389
#Tina Le

# Prompt the user to enter the name of a file
read -p "Enter the name of the file: " filename

# Check if the file exists
if [ -f "$filename" ]; then
    # Prompt the user to enter text to search for
    read -p "Enter text to search for inside the file: " search_text
    
    # Search text (case-insensitive) and insert matching data into pattern.txt
    grep -i "$search_text" "$filename" > pattern.txt
    
    echo "Search complete. Matching results saved to pattern.txt"
else
    # Display message if file doesn't exist
    echo "File not found"
fi

