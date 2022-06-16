#jsonFile
$location = Get-Location
$filename = "$location\test.json"
$result = "$location\test_update.json"
Write-Host "$location"

$myJson = Get-Content "$filename" -Raw | ConvertFrom-Json

$myJson.first_argument = "Hello";
$myJson.second_argument = "World";

$myJson | ConvertTo-Json | Out-File "$result" -Force -Encoding UTF8
