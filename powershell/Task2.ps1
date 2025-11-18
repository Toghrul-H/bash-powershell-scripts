# Script: Swap two columns in a file
# Usage: ./task2.ps1 file.txt

$filepath = $args[0]
if (Test-Path $filepath) {
    $lines = Get-Content $filepath
    $swapped = $lines | ForEach-Object {
        $columns = $_ -split "\s+"
        "$($columns[1]) $($columns[0])"
    }
    $swapped | Set-Content $filepath
} else {
    Write-Host "The file doesn't exist"
}
