[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, HelpMessage = "ContextUtilites Path")]
    [string]
    $ModulePath,

    [Parameter(Mandatory = $true, HelpMessage = "A job ID.")]
    [int]
    $Id = -1,

    [Parameter(Mandatory = $true, HelpMessage = "Buffer.")]
    [sting]
    $buffer
)


$DebugPreference = "SilentlyContinue" 
Set-StrictMode -Version Latest

# Import-Module $ModulePath
Write-Output $buffer

return "Succeeded"