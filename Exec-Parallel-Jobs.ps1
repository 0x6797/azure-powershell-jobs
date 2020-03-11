[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, HelpMessage = "A number of jobs.")]
    [int]
    $NumberOfJobs = 3,

    [Parameter(Mandatory=$true, HelpMessage="The admin password for the VM")]
    [System.Security.SecureString] $Password
)

$DebugPreference = 'Continue'
Set-StrictMode -Version Latest 

$scriptFolder = Split-Path $Script:MyInvocation.MyCommand.Path
$jobScriptLocation = Join-Path $scriptFolder "Exec-Job.ps1"

#kick off jobs to deploy all the VMs in parallel
$jobs = @()

for ($index = 0; $index -lt $NumberOfJobs; $index++) {
    $jobs += Start-Job -Name ("Job-" + $index.ToString()) `
        -FilePath $jobScriptLocation `
        -ArgumentList $Password
}

Wait-Job -Job $jobs

foreach ($job in $jobs) {
    $jobOutput = Receive-Job -Job $job -Wait
    Write-Output $jobOutput
}
Remove-Job -Job $jobs