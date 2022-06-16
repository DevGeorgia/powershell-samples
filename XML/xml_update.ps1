# XML File to update
$location = Get-Location
$filename = "$location\test.xml"
Write-Host "$location"

if(Test-Path -path $filename) {

# Read the file
[xml]$xmlDoc = Get-Content $filename

# Get node to update
$serverNode = $xmlDoc.SelectSingleNode("//Configuration/config[@Name='server']")
$portNode = $xmlDoc.SelectSingleNode("//Configuration/config[@Name='port']")
$protocolNode = $xmlDoc.SelectSingleNode("//Configuration/config[@Name='protocol']")

# Update value
$serverNode.InnerText = "url"
$portNode.InnerText = "123"
$protocolNode.InnerText = "https"

# Save xml file update
$xmlDoc.Save($filename)
Write-Host "INFO - File $filename updated"

} else {
    Write-Host "ERROR - Files not found"
    Write-Host "INFO - Please check presence of file : $filename"
}
