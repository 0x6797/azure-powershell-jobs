[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, HelpMessage = "A number of jobs.")]
    [int]
    $NumberOfJobs = 3,

    [Parameter(Mandatory = $true)]
    [string]
    $DevTestLabName,

    [Parameter(Mandatory = $true)]
    [string]
    $VmName
)

$DebugPreference = 'Continue'
Set-StrictMode -Version Latest 

$modulePath = Join-Path (Split-Path ($Script:MyInvocation.MyCommand.Path)) "ContextUtilities.psm1"
Import-Module $modulePath
$scriptFolder = Split-Path $Script:MyInvocation.MyCommand.Path
$jobScriptLocation = Join-Path $scriptFolder "Exec-Job.ps1"

#kick off jobs to deploy all the VMs in parallel
$jobs = @()
# SaveProfile

Write-Output "Starting Jobs"

$buffer = "012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789012456789"

for ($index = 0; $index -lt $NumberOfJobs; $index++) {
    $jobs += Start-Job -Name ("Job-" + $index.ToString()) `
        -FilePath $jobScriptLocation `
        -ArgumentList $ModulePath, $index, $buffer
}

$jobCount = $jobs.Count
Write-Output ("Job count is " + $jobCount)
Wait-Job -Job $jobs

foreach ($job in $jobs) {
    $jobOutput = Receive-Job -Job $job -Wait
    Write-Output $jobOutput
}
Remove-Job -Job $jobs