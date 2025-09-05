<#
.SYNOPSIS
    This PowerShell script configures IPv6 source routing to the highest protection.

.NOTES
    Author          : Michael Albert
    LinkedIn        : linkedin.com/in/michael-albert-/
    GitHub          : github.com/Mik3yD3
    Date Created    : 2025-09-05
    Last Modified   : 2025-09-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000020

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000020.ps1 
#>

$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters"
$regName = "DisableIpSourceRouting"

# Create the key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set DisableIpSourceRouting to 2 (fully disabled)
Set-ItemProperty -Path $regPath -Name $regName -Value 2 -Type DWord -Force

# Verify
Get-ItemProperty -Path $regPath | Select-Object $regName
