$a = $args[0]
$b = $args[1]
$c = $args[2]
$discriminant = [Math]::Sqrt(($b * $b) - (4 * $a * $c))
$root1 = (-$b + $discriminant) / (2 * $a)
$root2 = (-$b - $discriminant) / (2 * $a)
Write-Host "Root 1: $root1"
Write-Host "Root 2: $root2"
