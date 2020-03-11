[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, HelpMessage = "A number of jobs.")]
    [int]
    $NumberOfJobs = 3,

    [Parameter(Mandatory = $true, HelpMessage = "The admin password for the VM")]
    [System.Security.SecureString] $Password
) 

$DebugPreference = 'Continue'
Set-StrictMode -Version Latest 

$scriptFolder = Split-Path $Script:MyInvocation.MyCommand.Path
$jobScriptLocation = Join-Path $scriptFolder "Exec-Job.ps1"

for ($index = 0; $index -lt $NumberOfJobs; $index++) {
    . $jobScriptLocation -ModulePath $modulePath -Password $Password -Id $index
}