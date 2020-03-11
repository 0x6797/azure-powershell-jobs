[CmdletBinding()]
param (
    [Parameter(Mandatory=$true, HelpMessage="The admin password for the VM")]
    [System.Security.SecureString] $Password
)


$DebugPreference = "Continue" 
Set-StrictMode -Version Latest

return "Succeeded"