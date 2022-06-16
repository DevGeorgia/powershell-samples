# Logs format
$currentDate = Get-Date -format "yyyyMMdd"
$LogFileName = "create_logs_$($currentDate).log"

# Logs Level
enum LogLevel {
  DEBUG;
  INFO;
  WARN;
  ERROR;
}

# Write Logs
Function log {
  param ([Parameter(Mandatory)][LogLevel] $level,
         [Parameter(Mandatory)][String]   $message)

  $dateTime = Get-Date -format "yyyy-MM-dd HH:mm:ss.fff"
  $logLine = "$($dateTime) $($level) - $($message)"
  Write-Output "$($logLine)"

  Add-Content -Path $LogFileName -Value $logLine
}

# Call exemple
log -level ([LogLevel]::INFO) -message "START create_logs.ps1"
log -level ([LogLevel]::DEBUG) -message "DEBUG create_logs.ps1"
log -level ([LogLevel]::ERROR) -message "ERROR create_logs.ps1"
log -level ([LogLevel]::INFO) -message "END create_logs.ps1"
