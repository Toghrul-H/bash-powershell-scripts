# Script: Expression calculator
# Usage: ./task4.ps1

$filepath = Read-Host "Enter the file name"
if (Test-Path $filepath) {
    $lines = Get-Content $filepath
    foreach ($line in $lines) {
        $columns = $line -split "\s+"
        $result = ($columns[0] + $columns[1]) * $columns[2]
        Write-Host $result
    }
} else {
    Write-Host "The file does not exist."
}
