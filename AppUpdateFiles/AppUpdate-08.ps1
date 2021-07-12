#############################################################
# AppUpdate-08.ps1                                   #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

#complete production analytics standard run through." $08Status
if($null -eq $AnalyticsPSSession) {
if(([Security.Principal.WindowsIdentity]::GetCurrent()).name -eq $aAccount) {
	$global:AnalyticsPSSession = New-PSSession -computername $prodAnalyticsServer
}else {
	$global:AnalyticsPSSession = New-PSSession -computername $prodAnalyticsServer -Credential $aAccount
}
}

Invoke-Command -Session $AnalyticsPSSession -Scriptblock {
$null = Enable-ScheduledTask AppAssy
write-host "AppAssy is"(Get-ScheduledTask AppAssy).state
$null = Enable-ScheduledTask AppCerts
write-host "AppCerts is"(Get-ScheduledTask AppCerts).state
$null = Enable-ScheduledTask AppConstraints
write-host "AppConstraints is"(Get-ScheduledTask AppConstraints).state
$null = Enable-ScheduledTask AppFab
write-host "AppFab is"(Get-ScheduledTask AppFab).state
$null = Enable-ScheduledTask AppLog_Archive
write-host "AppLog_Archive is"(Get-ScheduledTask AppLog_Archive).state
$null = Enable-ScheduledTask AppPrio
write-host "AppPrio is"(Get-ScheduledTask AppPrio).state
$null = Enable-ScheduledTask AppReports
write-host "AppReports is"(Get-ScheduledTask AppReports).state
$null = Enable-ScheduledTask MainFactory
write-host "MainFactory is"(Get-ScheduledTask MainFactory).state
$null = Enable-ScheduledTask RecurFactory
write-host "RecurFactory is"(Get-ScheduledTask RecurFactory).state
$null = Enable-ScheduledTask ReportFactory
write-host "ReportFactory is"(Get-ScheduledTask ReportFactory).state
$null = Enable-ScheduledTask AppShiftHandoff
write-host "AppShiftHandoff is"(Get-ScheduledTask AppShiftHandoff).state
}
$global:08Status = "COMPLETE"