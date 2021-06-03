<#
.SYNOPSIS
    AutoStart Network AutoConfig Services to Enable IEEE802.1X on network adapters.
	Mark Messink 03-06-2021.

.DESCRIPTION
 
.INPUTS
  None

.OUTPUTS
  Log file: pslog_AutoStart-Network-AutoConfig-Services.txt
  
.NOTES
  
  
.EXAMPLE
  .\pslog_AutoStart-Network-AutoConfig-Services.ps1

#>

# Create logpath (if not exist)
$logpath = "C:\IntuneLogs"
If(!(test-path $logpath))
{
      New-Item -ItemType Directory -Force -Path $logpath
}

$logFile = "$logpath\pslog_AutoStart-Network-AutoConfig-Services.txt"

#Start logging
Start-Transcript $logFile -Append -Force

	Write-Output "-------------------------------------------------------------------"
	Write-Output "--- Enable autostart Wired AutoConfig Service"
	get-service -displayname 'Wired Autoconfig' | set-service -StartupType Automatic -Status Running
	Write-Output "--- Settings and Status"
	get-service -displayname 'Wired Autoconfig' | select -Property Displayname, Name, starttype, status | FL
	
	Write-Output "-------------------------------------------------------------------"
	Write-Output "--- Enable autostart WLAN AutoConfig Service"
	get-service -displayname 'WLAN Autoconfig' | set-service -StartupType Automatic -Status Running
	Write-Output "--- Settings and Status"
	get-service -displayname 'WLAN Autoconfig' | select -Property Displayname, Name, starttype, status | FL
<#	
	Write-Output "-------------------------------------------------------------------"
	Write-Output "--- Enable autostart WWan AutoConfig Service"	
	get-service -displayname 'WWAN Autoconfig' | set-service -StartupType Automatic -Status Running
	Write-Output "--- Settings and Status"
    get-service -displayname 'WWAN Autoconfig' | select -Property Displayname, Name, starttype, status | FL
#>
	
	Write-Output "-------------------------------------------------------------------"

#Stop Logging
Stop-Transcript
