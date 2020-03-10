function SaveProfile {
    $profilePath = Join-Path $PSScriptRoot "profile.json"

    If (Test-Path $profilePath) {
        Remove-Item $profilePath
    }
    
    Save-AzContext -Path $profilePath
}

function LoadProfile {
    $scriptFolder = Split-Path $Script:MyInvocation.MyCommand.Path
    Import-AzContext -Path (Join-Path $scriptFolder "profile.json") | Out-Null
}
