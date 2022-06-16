#For example, we need all the files that are modified after 01st April 2021 then we can use the below command.
$date = "01/01/2022"
Get-ChildItem C:\Temp | where{$_.LastWriteTime -ge
[DateTime]$date}

#To get all the files modified before the date, use the below command.
$date = "01/01/2022"
Get-ChildItem C:\Temp | where{$_.LastWriteTime -le
[DateTime]$date}

