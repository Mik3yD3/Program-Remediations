<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Michael Albert
    LinkedIn        : linkedin.com/in/michael-albert-/
    GitHub          : github.com/Mik3yD3
    Date Created    : 2025-09-04
    Last Modified   : 2025-09-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-000500.ps1 
#>

# Ensure the policy registry path exists
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application" -Force | Out-Null

# Set the maximum log size to 32768 KB (32 MB)
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application" -Name "MaxSize" -Value 32768 -Type DWord

# Confirm
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application" | Select-Object MaxSize
