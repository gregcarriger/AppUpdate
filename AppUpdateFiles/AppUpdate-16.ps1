#############################################################
# AppUpdate-16.ps1                                   #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

#complete qa analytics standard run through." $16Status
if($null -eq $AnalyticsQAPSSession) {
if(([Security.Principal.WindowsIdentity]::GetCurrent()).name -eq $aAccount) {
	$global:AnalyticsPSSession = New-PSSession -computername $qaAnalyticsServer
}else {
	$global:AnalyticsPSSession = New-PSSession -computername $qaAnalyticsServer -Credential $aAccount
}
}
Invoke-Command -Session $AnalyticsQAPSSession -Scriptblock {

Enable-ScheduledTask AppAssy
Enable-ScheduledTask AppCerts
Enable-ScheduledTask AppConstraints
Enable-ScheduledTask AppFab
Enable-ScheduledTask AppLog_Archive
Enable-ScheduledTask AppPrio
Enable-ScheduledTask AppReports
Enable-ScheduledTask MainFactory
Enable-ScheduledTask RecurFactory
Enable-ScheduledTask ReportFactory
Enable-ScheduledTask AppShiftHandoff
}
$global:16Status = "COMPLETE"