#!/bin/bash
#s4206389
#Tina Le

#task 3

#Begin Iteration (Loop) - Keeps the program running until the user exits
while true; do
    # 3. Display Menu
    echo "========================="
    echo "   Simple Calculator"
    echo "========================="
    echo "1. Addition"
    echo "2. Subtraction"
    echo "3. Multiplication"
    echo "4. Division"
    echo "5. Exit"
    
    # 4. Get User Input (Operation)
    read -p "Select an operation (1-5): " operation
    
    # 5. Validate Operation Input (Selection)
    if [ "$operation" = "5" ]; then
        echo "Exiting calculator. Goodbye!"
        break
    elif [ "$operation" != "1" ] && [ "$operation" != "2" ] && [ "$operation" != "3" ] && [ "$operation" != "4" ]; then
        echo "Invalid option. Please select 1-5."
        echo ""
        continue
    fi
    
    # 6. Get User Input (Numbers)
    read -p "Enter the first number: " num1
    read -p "Enter the second number: " num2
    
    # 7. Validate Number Inputs (Check if they are valid numbers using regex)
    if ! [[ "$num1" =~ ^-?[0-9]+([.][0-9]+)?$ ]] || ! [[ "$num2" =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then
        echo "Invalid input. Please enter numbers only."
        echo ""
        continue
    fi
    
    # 8. Perform Calculation (Selection)
    if [ "$operation" = "1" ]; then
        result=$(awk "BEGIN {print $num1 + $num2}")
    elif [ "$operation" = "2" ]; then
        result=$(awk "BEGIN {print $num1 - $num2}")
    elif [ "$operation" = "3" ]; then
        result=$(awk "BEGIN {print $num1 * $num2}")
    elif [ "$operation" = "4" ]; then
        # Check for division by zero
        if [ "$num2" = "0" ] || [ "$num2" = "0.0" ]; then
            echo "Cannot divide by zero."
            echo ""
            continue
        fi
        result=$(awk "BEGIN {print $num1 / $num2}")
    fi
    
    # 9. Display Result
    echo "-------------------------"
    echo "The result is: $result"
    echo "-------------------------"
    echo ""
    
    # 10. Loop Continuation (Returns to the top of the while loop)
done
