<#
.SYNOPSIS
    This PowerShell script ensures that the minimum lockout duration is 15 minutes on the Windows 10 Machine.

.NOTES
    Author          : Michael Albert
    LinkedIn        : linkedin.com/in/michael-albert-/
    GitHub          : github.com/Mik3yD3
    Date Created    : 2025-09-04
    Last Modified   : 2025-09-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AC-000005.ps1 
#>

# Set account lockout threshold (e.g., 5 invalid attempts)
net accounts /lockoutthreshold:5

# Set lockout duration to 15 minutes
net accounts /lockoutduration:15

# Set reset counter after 15 minutes (how long until failure counter resets)
net accounts /lockoutwindow:15

# Show results
net accounts

