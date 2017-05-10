## Uploaded by @JohnLaTwC
## Miss security bulletins?  Create them yourself in a few lines of PowerShell:

## First, get an API key to the MSRC Portal API 
## Sign-in in here: https://portal.msrc.microsoft.com/en-us/developer, and click on the Developer tab, click the Show button on the API key.

## Install the MSRC PowerShell cmdlets, Run in an Admin PowerShell:
## Install-Module -Name MSRCSecurityUpdates -force

## In a normal user PowerShell:
Import-Module MSRCSecurityUpdates -Verbose:$false
Set-MSRCApiKey -ApiKey "your-api-key" 
$timeperiod = Get-Date -Format yyyy-MMM
$fname = 'MSRCSecurityUpdates' + $timeperiod + '.html'
Get-MsrcCvrfDocument -ID $timeperiod | Get-MsrcSecurityBulletinHtml | Out-File $fname
Invoke-Item $fname 
