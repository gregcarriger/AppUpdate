#############################################################
# AppUpdate-15.ps1                                   #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

#complete qa analytics standard run through."

if($null -eq $AnalyticsQAPSSession) {
if(([Security.Principal.WindowsIdentity]::GetCurrent()).name -eq $aAccount) {
	$global:AnalyticsPSSession = New-PSSession -computername $qaAnalyticsServer
}else {
	$global:AnalyticsPSSession = New-PSSession -computername $qaAnalyticsServer -Credential $aAccount
}
}

Invoke-Command -Session $AnalyticsQAPSSession -Scriptblock {

### START RECUR
$RecurStartTime = (get-date).ToString("HH:mm:ss")
$RecurGuessFinish = (get-date).AddMinutes(22).ToString("HH:mm:ss")
Write-Host "Started RecurFactory at"$RecurStartTime -NoNewline
Write-Host " and will continue with other scripts"
$null = Enable-ScheduledTask RecurFactory | Start-ScheduledTask
$null = Disable-ScheduledTask RecurFactory

$starttime = get-date
Write-Host "Started AppPrio at"(get-date).ToString("HH:mm:ss") -NoNewline
Write-Host " and expected finish at"(get-date).AddMinutes(5).ToString("HH:mm:ss")
$null = Enable-ScheduledTask AppPrio | Start-ScheduledTask
$null = Disable-ScheduledTask AppPrio
$statusstart = (get-date).ToString("HH:mm:ss")
$statusend = (get-date).AddMinutes(5).ToString("HH:mm:ss")
$status = "Started at $statusstart and estimated finish at $statusend"
$i=0
while ((Get-ScheduledTask -TaskName 'AppPrio').State  -ne 'Disabled') {
    $i++
	Write-Progress -Activity "Waiting on AppPrio" -status $status -percentComplete ($i / 60)
}

Set-Location C:\AppFolder\logs
Get-ChildItem -Filter prio* | Where-Object LastWriteTime -ge $starttime | Get-Content -Tail 10
Write-Host "Started AppAssy at"(get-date).ToString("HH:mm:ss") -NoNewline
Write-Host " and expected finish at"(get-date).AddMinutes(1).ToString("HH:mm:ss")
$null = Enable-ScheduledTask AppAssy | Start-ScheduledTask
$null = Disable-ScheduledTask AppAssy

$statusstart = (get-date).ToString("HH:mm:ss")
$statusend = (get-date).AddMinutes(5).ToString("HH:mm:ss")
$status = "Started at $statusstart and estimated finish at $statusend"
$i=0
while ((Get-ScheduledTask -TaskName 'AppAssy').State  -ne 'Disabled') {
    $i++
	Write-Progress -Activity "Waiting on AppAssy" -status $status -percentComplete ($i / 60)
}

Set-Location C:\AppFolder\logs
Get-ChildItem -Filter Assembly* | Where-Object LastWriteTime -ge $starttime | Get-Content -Tail 10
Write-Host "Started AppFab at"(get-date).ToString("HH:mm:ss") -NoNewline
Write-Host " and expected finish at"(get-date).AddMinutes(1).ToString("HH:mm:ss")
$null = Enable-ScheduledTask AppFab | Start-ScheduledTask
$null = Disable-ScheduledTask AppFab

$statusstart = (get-date).ToString("HH:mm:ss")
$statusend = (get-date).AddMinutes(5).ToString("HH:mm:ss")
$status = "Started at $statusstart and estimated finish at $statusend"
$i=0
while ((Get-ScheduledTask -TaskName 'AppFab').State  -ne 'Disabled') {
    $i++
	Write-Progress -Activity "Waiting on AppFab" -status $status -percentComplete ($i / 60)
}

Set-Location C:\AppFolder\logs
Get-ChildItem -Filter Fab* | Where-Object LastWriteTime -ge $starttime | Get-Content -Tail 10
Write-Host "Started AppConstraints at"(get-date).ToString("HH:mm:ss") -NoNewline
Write-Host " and expected finish at"(get-date).AddMinutes(1).ToString("HH:mm:ss")
$null = Enable-ScheduledTask AppConstraints | Start-ScheduledTask
$null = Disable-ScheduledTask AppConstraints

$statusstart = (get-date).ToString("HH:mm:ss")
$statusend = (get-date).AddMinutes(5).ToString("HH:mm:ss")
$status = "Started at $statusstart and estimated finish at $statusend"
$i=0
while ((Get-ScheduledTask -TaskName 'AppConstraints').State  -ne 'Disabled') {
    $i++
	Write-Progress -Activity "Waiting on AppConstraints" -status $status -percentComplete ($i / 60)
}

Set-Location C:\AppFolder\logs
Get-ChildItem -Filter Constraints* | Where-Object LastWriteTime -ge $starttime | Get-Content -Tail 10

### CHECK RECUR

$status = "Started at $RecurStartTime and estimated finish at $RecurGuessFinish"
$i=0
while ((Get-ScheduledTask -TaskName 'RecurFactory').State  -ne 'Disabled') {
    $i++
	Write-Progress -Activity "Waiting on RecurFactory" -status $status -percentComplete ($i / 60)
}

Write-Host "Check database for RecurFactory status"
}
$global:15Status = "COMPLETE"