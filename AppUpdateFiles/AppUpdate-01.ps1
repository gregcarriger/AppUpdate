#############################################################
# AppUpdate-01.ps1                                   #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

# login to Production analytics and stop scheuled tasks."
if($null -eq $AnalyticsPSSession) {
if(([Security.Principal.WindowsIdentity]::GetCurrent()).name -eq $aAccount) {
	$global:AnalyticsPSSession = New-PSSession -computername $prodAnalyticsServer
}else {
	$global:AnalyticsPSSession = New-PSSession -computername $prodAnalyticsServer -Credential $aAccount
}
}
Invoke-Command -Session $AnalyticsPSSession -Scriptblock {
$null = Disable-ScheduledTask AppAssembly
write-host "AppAssembly is"(Get-ScheduledTask AppAssembly).state
$null = Disable-ScheduledTask AppCerts
write-host "AppCerts is"(Get-ScheduledTask AppCerts).state
$null = Disable-ScheduledTask AppConstraints
write-host "AppConstraints is"(Get-ScheduledTask AppConstraints).state
$null = Disable-ScheduledTask AppFabrication
write-host "AppFabrication is"(Get-ScheduledTask AppFabrication).state
$null = Disable-ScheduledTask AppArchive
write-host "AppArchive is"(Get-ScheduledTask AppArchive).state
$null = Disable-ScheduledTask AppPrioritization
write-host "AppPrioritization is"(Get-ScheduledTask AppPrioritization).state
$null = Disable-ScheduledTask AppReports
write-host "AppReports is"(Get-ScheduledTask AppReports).state
$null = Disable-ScheduledTask AppMainFactory
write-host "AppMainFactory is"(Get-ScheduledTask AppMainFactory).state
$null = Disable-ScheduledTask RecurFactory
write-host "RecurFactory is"(Get-ScheduledTask RecurFactory).state
$null = Disable-ScheduledTask ReportFactory
write-host "ReportFactory is"(Get-ScheduledTask ReportFactory).state
$null = Disable-ScheduledTask AppShiftHandoff
write-host "AppShiftHandoff is"(Get-ScheduledTask AppShiftHandoff).state
}
$global:01Status = "COMPLETE"