<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Security event log is at least 1024000 KB (1 GB).

.NOTES
    Author          : Michael Albert
    LinkedIn        : linkedin.com/in/michael-albert-/
    GitHub          : github.com/Mik3yD3
    Date Created    : 2025-09-05
    Last Modified   : 2025-09-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000505

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-000505.ps1 
#>

# Registry path for Security Event Log policy
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security"

# Ensure the registry key exists
If (-Not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set MaxSize to 1024000 KB (1 GB)
Set-ItemProperty -Path $regPath -Name "MaxSize" -Value 1024000 -Type DWord -Force

Write-Host "Security Event Log MaxSize set to 1024000 KB (1 GB) or greater."

# Verify
Get-ItemProperty -Path $regPath | Select-Object MaxSize
