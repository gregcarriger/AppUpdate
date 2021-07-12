#############################################################
# AppUpdate-09.ps1                                   #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

# login to QA analytics and stop scheuled tasks."
if($null -eq $AnalyticsQAPSSession) {
if(([Security.Principal.WindowsIdentity]::GetCurrent()).name -eq $aAccount) {
	$global:AnalyticsQAPSSession = New-PSSession -computername $qaAnalyticsServer
}else {
	$global:AnalyticsQAPSSession = New-PSSession -computername $qaAnalyticsServer -Credential $aAccount
}
}
Invoke-Command -Session $AnalyticsQAPSSession -Scriptblock {
$null = Disable-ScheduledTask AppAssy
write-host "AppAssy is"(Get-ScheduledTask AppAssy).state
$null = Disable-ScheduledTask AppCerts
write-host "AppCerts is"(Get-ScheduledTask AppCerts).state
$null = Disable-ScheduledTask AppConstraints
write-host "AppConstraints is"(Get-ScheduledTask AppConstraints).state
$null = Disable-ScheduledTask AppFab
write-host "AppFab is"(Get-ScheduledTask AppFab).state
$null = Disable-ScheduledTask AppLog_Archive
write-host "AppLog_Archive is"(Get-ScheduledTask AppLog_Archive).state
$null = Disable-ScheduledTask AppPrio
write-host "AppPrio is"(Get-ScheduledTask AppPrio).state
$null = Disable-ScheduledTask AppReports
write-host "AppReports is"(Get-ScheduledTask AppReports).state
$null = Disable-ScheduledTask MainFactory
write-host "MainFactory is"(Get-ScheduledTask MainFactory).state
$null = Disable-ScheduledTask RecurFactory
write-host "RecurFactory is"(Get-ScheduledTask RecurFactory).state
$null = Disable-ScheduledTask ReportFactory
write-host "ReportFactory is"(Get-ScheduledTask ReportFactory).state
$null = Disable-ScheduledTask AppShiftHandoff
write-host "AppShiftHandoff is"(Get-ScheduledTask AppShiftHandoff).state
}
$global:09Status = "COMPLETE"