# Prompt the user to enter the name of a file
$file = Read-Host "Enter the name of a file"

# Check if the file exists using the Test-Path cmdlet
if (Test-Path $file) {
    # Prompt the user to enter text to search for inside the file
    $text = Read-Host "Enter text to search for"
    
    # Use Select-String to search for the text (case-insensitive) and insert matching data into pattern.txt
    Select-String -Path $file -Pattern $text | ForEach-Object { $_.Line } | Set-Content pattern.txt
    
    Write-Host "Search complete. Results saved to pattern.txt."
} else {
    # Display 'File not found' message if the file doesn't exist
    Write-Host "File not found"
}