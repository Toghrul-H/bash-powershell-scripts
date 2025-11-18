# Script: Factorial generator
# Usage: ./task3.ps1

$filepath = "Task3.txt"
if (Test-Path $filepath) {
    $lines = Get-Content $filepath
    foreach ($line in $lines) {
        $number = $line -split "------" | Select-Object -First 1
        $factorial = 1
        for ($i = 1; $i -le $number; $i++) {
            $factorial *= $i
        }
        Write-Host "$number------$factorial"
    }
} else {
    Write-Host "The file does not exist."
}
