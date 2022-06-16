
# File to read
$fileName = "loop.txt";
$result = "loop_result.txt";

# String to find
$toMatch = "Hello World";
Write-Host "Line to find in file : $toMatch"

# Loop on file
foreach($line in Get-Content $fileName) {
    Write-Host "Reading line : $line"
    # if line match
    if ($line -match $toMatch){
        #new line
        $newline = "Hello You"

        # update file with new line
        (Get-Content $fileName).replace($line, $newline) | Set-Content $result
        Write-Host "Line updated"
    }
}

