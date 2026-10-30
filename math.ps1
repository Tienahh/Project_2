#Task 3c

#Begin Iteration (Loop) - Keeps the program running until the user exits
while ($true) {
    # 3. Display Menu
    Write-Host "========================="
    Write-Host "   Simple Calculator"
    Write-Host "========================="
    Write-Host "1. Addition"
    Write-Host "2. Subtraction"
    Write-Host "3. Multiplication"
    Write-Host "4. Division"
    Write-Host "5. Exit"
    
    # 4. Get User Input (Operation)
    $operation = Read-Host "Select an operation (1-5)"
    
    # 5. Validate Operation Input (Selection)
    if ($operation -eq "5") {
        Write-Host "Exiting calculator. Goodbye!"
        break
    }
    elseif ($operation -ne "1" -and $operation -ne "2" -and $operation -ne "3" -and $operation -ne "4") {
        Write-Host "Invalid option. Please select 1-5."
        Write-Host ""
        continue
    }
    
    # 6. Get User Input (Numbers)
    $num1Input = Read-Host "Enter the first number"
    $num2Input = Read-Host "Enter the second number"
    
    # 7. Validate Number Inputs (Check if they are valid numbers)
    $num1 = 0
    $num2 = 0
    $isNum1 = [double]::TryParse($num1Input, [ref]$num1)
    $isNum2 = [double]::TryParse($num2Input, [ref]$num2)
 if (-not $isNum1 -or -not $isNum2) {
        Write-Host "Invalid input. Please enter numbers only."
        Write-Host ""
        continue # Restarts the loop back to the menu
    }
    
    # 8. Perform Calculation (Selection)
    $result = 0
    if ($operation -eq "1") {
        $result = $num1 + $num2
    }
    elseif ($operation -eq "2") {
        $result = $num1 - $num2
    }
    elseif ($operation -eq "3") {
        $result = $num1 * $num2
    }
    elseif ($operation -eq "4") {
        # Check for division by zero
        if ($num2 -eq 0) {
            Write-Host "Cannot divide by zero."
            Write-Host ""
            continue
        }
        $result = $num1 / $num2
    }
    
    # 9. Display Result
    Write-Host "-------------------------"
    Write-Host "The result is: $result"
    Write-Host "-------------------------"
    Write-Host ""
    
    # 10. Loop Continuation (Returns to the top of the while loop)
}