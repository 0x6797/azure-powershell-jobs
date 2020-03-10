[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, HelpMessage = "A number of jobs.")]
    [int]
    $NumberOfJobs = 3
) 

$DebugPreference = 'Continue'
Set-StrictMode -Version Latest 

$modulePath = Join-Path (Split-Path ($Script:MyInvocation.MyCommand.Path)) "ContextUtilities.psm1"
Import-Module $modulePath
$scriptFolder = Split-Path $Script:MyInvocation.MyCommand.Path
$jobScriptLocation = Join-Path $scriptFolder "Exec-Job.ps1"

#kick off jobs to deploy all the VMs in parallel
$jobs = @()
SaveProfile

for ($index = 0; $index -lt $NumberOfJobs; $index++) {
#     $jobs += Start-Job -Name ("Job-" + $index.ToString()) `
#         -FilePath $jobScriptLocation `
#         -ArgumentList $ModulePath, $index
    . $jobScriptLocation -ModulePath $modulePath -Id $index
}

# foreach ($job in $jobs) {
#     $jobOutput = Receive-Job $job -Wait
#     Write-Output $jobOutput
# }
# Remove-Job -Job $jobs