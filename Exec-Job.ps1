[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, HelpMessage = "ContextUtilites Path")]
    [string]
    $ModulePath,

    [Parameter(Mandatory = $true, HelpMessage = "A job ID.")]
    [int]
    $Id = -1,

    [Parameter(Mandatory=$true, HelpMessage="The admin password for the VM")]
    [System.Security.SecureString] $Password,
    
    [Parameter(Mandatory = $true, HelpMessage = "Buffer.")]
    [string]
    $buffer
)


$DebugPreference = "Continue" 
Set-StrictMode -Version Latest

# Import-Module $ModulePath
Write-Output $buffer

return "Succeeded"