[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, HelpMessage = "ContextUtilites Path")]
    [string]
    $ModulePath,

    [Parameter(Mandatory = $true)]
    [string]
    $DevTestLabName,

    [Parameter(Mandatory = $true)]
    [string]
    $VmName,

    [Parameter(Mandatory = $true, HelpMessage = "A job ID.")]
    [int]
    $Id = -1
)


$DebugPreference = "SilentlyContinue" 
Set-StrictMode -Version Latest

Import-Module $ModulePath

Write-Debug ("My Job ID is " + $Id.ToString())
$result = Get-AzResource -ResourceType "Microsoft.DevTestLab/labs/virtualMachines" -Name $DevTestLabName | Where-Object { $_.Name -eq "$DevTestLabName/$VmName"}
Start-Sleep -Seconds 3.0

return $result