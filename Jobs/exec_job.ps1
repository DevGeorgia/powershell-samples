
# Csv containing job arguments
$csvName = "world.csv"

# How many jobs do you want to run in parralel
$maxQueriesParallele=2
# Script you want to execute for your job
$scriptToLaunch="hello_world.ps1"

Write-host "START exec_job.ps1"

# Clean jobs history
Write-host "Checking jobs"
Get-Job
Remove-Job -State Completed

Write-host "Reading input CSV"

# Loop on csv datas
Import-Csv -Path $csvName -Delimiter ";" | ForEach-Object {

	Write-host "Fisrt Name $($_."firstName") - Last Name $($_."lastName")"

	$firstName = $($_."firstName")
	$lastName = $($_."lastName")


            # Script arguments for the job
            $scriptArguments = $firstName, $lastName

            # Start the job
            $jobName = "Job_$($firstName)_$($lastName)"
			Write-host "Start job $jobName"
            Start-Job -Name $jobName -FilePath $scriptToLaunch -ArgumentList $scriptArguments

            $currentJobs = Get-Job -State Running
			Write-host "Running jobs count: $($currentJobs.Count)"

            # Check how many jobs are running before starting another one
            if ($currentJobs.Count -ge $maxQueriesParallele) {
                # if too many jobs running, waiting
				Write-host "Waiting for at least one job to complete. Running jobs count: $($currentJobs.Count)"
                $currentJobs | Wait-Job -Any
            }

}

# Waiting all jobs to complete
Get-Job | Wait-Job
Write-host "All jobs terminated."

# Clean all completed jobs
Get-Job | Receive-Job
Write-host "All jobs received."
Remove-Job -State Completed
Write-host "All completed jobs removed."

# End script
Write-host "END exec_job.ps1"
