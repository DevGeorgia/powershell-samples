$url="https://xxxxx.fr/request"
$firstArgument="first argument"
$secondArgument="second argument"

$body = @{
	"first_argument" = $firstArgument
	"second_argument" = $secondArgument
}

$bodyJson = $body | ConvertTo-Json

Write-Output $bodyJson
Invoke-WebRequest -Uri $url -Method POST -Body $bodyJson -ContentType "application/json"

