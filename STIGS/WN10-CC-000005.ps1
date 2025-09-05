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
    STIG-ID         : WN10-CC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000005.ps1 
#>

# Registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"

# Create the key if it doesn't exist
If (-Not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set NoLockScreenCamera = 1 (disable camera on lock screen)
New-ItemProperty -Path $regPath -Name "NoLockScreenCamera" -PropertyType DWord -Value 1 -Force | Out-Null

Write-Host "Camera on lock screen disabled (NoLockScreenCamera=1)."

# Verify
Get-ItemProperty -Path $regPath | Select-Object NoLockScreenCamera
