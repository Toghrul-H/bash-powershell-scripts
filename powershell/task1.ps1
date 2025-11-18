# Script: Closest object calculator
# Usage: ./task1.ps1 data.txt

param([string]$FileName)

if (-not (Test-Path $FileName)) {
    Write-Error "File not found: $FileName"
    exit
}

$data = Get-Content $FileName
$closestTime = ""
$closestDistance = [float]::MaxValue

foreach ($line in $data) {
    $parts = $line -split ",\s*"
    $time = $parts[0]
    $distances = @($parts[2..4] | ForEach-Object { $_.Trim() -as [float] })

    $minDistance = ($distances | Measure-Object -Minimum).Minimum

    if ($minDistance -lt $closestDistance) {
        $closestDistance = $minDistance
        $closestTime = $time
    }
}

Write-Output "Closest object was at $closestTime with a distance of $closestDistance meters."
