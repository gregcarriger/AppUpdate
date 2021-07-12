#############################################################
# AppUpdate-13.ps1                                   #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

#check production analytics scheuled tasks."

if($null -eq $AnalyticsQAPSSession) {
if(([Security.Principal.WindowsIdentity]::GetCurrent()).name -eq $aAccount) {
	$global:AnalyticsQAPSSession = New-PSSession -computername $qaAnalyticsServer
}else {
	$global:AnalyticsQAPSSession = New-PSSession -computername $qaAnalyticsServer -Credential $aAccount
}
}

Invoke-Command -Session $AnalyticsQAPSSession -Scriptblock {
while ((Get-ScheduledTask -TaskName AppAssy).State  -ne 'Disabled') {
	Write-Host "Waiting on AppAssy..."
}
write-host "AppAssy is disabled"
while ((Get-ScheduledTask -TaskName 'AppCerts').State  -ne 'Disabled') {
	Write-Host "Waiting on AppCerts..."
}
write-host "AppCerts is disabled"
while ((Get-ScheduledTask -TaskName 'AppConstraints').State  -ne 'Disabled') {
	Write-Host "Waiting on AppConstraints..."
}
write-host "AppConstraints is disabled"
while ((Get-ScheduledTask -TaskName 'AppFab').State  -ne 'Disabled') {
	Write-Host "Waiting on AppFab..."
}
write-host "AppFab is disabled"
while ((Get-ScheduledTask -TaskName 'AppLog_Archive').State  -ne 'Disabled') {
	Write-Host "Waiting on AppLog_Archive..."
}
write-host "AppLog_Archive is disabled"
while ((Get-ScheduledTask -TaskName 'AppPrio').State  -ne 'Disabled') {
	Write-Host "Waiting on AppPrio..."
}
write-host "AppPrio is disabled"
while ((Get-ScheduledTask -TaskName 'AppReports').State  -ne 'Disabled') {
	Write-Host "Waiting on AppReports..."
}
write-host "AppReports is disabled"
while ((Get-ScheduledTask -TaskName 'MainFactory').State  -ne 'Disabled') {
	Write-Host "Waiting on MainFactory..."
}
write-host "MainFactory is disabled"
while ((Get-ScheduledTask -TaskName 'RecurFactory').State  -ne 'Disabled') {
	Write-Host "Waiting on RecurFactory..."
}
write-host "RecurFactory is disabled"
while ((Get-ScheduledTask -TaskName 'ReportFactory').State  -ne 'Disabled') {
	Write-Host "Waiting on ReportFactory..."
}
write-host "ReportFactory is disabled"
while ((Get-ScheduledTask -TaskName 'AppShiftHandoff').State  -ne 'Disabled') {
	Write-Host "Waiting on AppShiftHandoff..."
}
write-host "AppShiftHandoff is disabled"
}
$global:13Status = "COMPLETE"