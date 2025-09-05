<#
.SYNOPSIS
    This PowerShell script ensures that the camera's access is disabled from the lock screen.

.NOTES
    Author          : Michael Albert
    LinkedIn        : linkedin.com/in/michael-albert-/
    GitHub          : github.com/Mik3yD3
    Date Created    : 2025-09-05
    Last Modified   : 2025-09-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000038

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000038.ps1 
#>

# Registry path
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\Wdigest"

# Ensure the registry key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set UseLogonCredential to 0 (disable storing credentials in memory)
Set-ItemProperty -Path $regPath -Name "UseLogonCredential" -Value 0 -Type DWord -Force

# Verify
Get-ItemProperty -Path $regPath | Select-Object UseLogonCredential
