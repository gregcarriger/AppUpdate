#############################################################
# AppUpdate-07.ps1                                   #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

#complete production analytics standard run through." $07Status
if($null -eq $AnalyticsPSSession) {
if(([Security.Principal.WindowsIdentity]::GetCurrent()).name -eq $aAccount) {
	$global:AnalyticsPSSession = New-PSSession -computername $prodAnalyticsServer
}else {
	$global:AnalyticsPSSession = New-PSSession -computername $prodAnalyticsServer -Credential $aAccount
}
}

Invoke-Command -Session $AnalyticsPSSession -Scriptblock {

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

$i=0
while ((Get-ScheduledTask -TaskName 'AppPrio').State  -ne 'Disabled') {
    $i++
    if ($i -gt 59) {
		{ Write-Progress -Activity “Waiting on AppPrio” -status “Waiting on AppPrio $i” -percentComplete ($i / 100)}
        }
}
Set-Location C:\Users\Public\dynamic_scheduler\logs
Get-ChildItem -Filter prio* | Where-Object LastWriteTime -ge $starttime | Get-Content -Tail 10
Write-Host "Started AppAssy at"(get-date).ToString("HH:mm:ss") -NoNewline
Write-Host " and expected finish at"(get-date).AddMinutes(1).ToString("HH:mm:ss")
$null = Enable-ScheduledTask AppAssy | Start-ScheduledTask
$null = Disable-ScheduledTask AppAssy

$i=0
while ((Get-ScheduledTask -TaskName 'AppAssy').State  -ne 'Disabled') {
    $i++
    if ($i -gt 59) {
		{ Write-Progress -Activity “Waiting on AppAssy” -status “Waiting on AppAssy $i” -percentComplete ($i / 100)}
        }
}

Set-Location C:\Users\Public\dynamic_scheduler\logs
Get-ChildItem -Filter Assembly* | Where-Object LastWriteTime -ge $starttime | Get-Content -Tail 10
Write-Host "Started AppFab at"(get-date).ToString("HH:mm:ss") -NoNewline
Write-Host " and expected finish at"(get-date).AddMinutes(1).ToString("HH:mm:ss")
$null = Enable-ScheduledTask AppFab | Start-ScheduledTask
$null = Disable-ScheduledTask AppFab

$i=0
while ((Get-ScheduledTask -TaskName 'AppFab').State  -ne 'Disabled') {
    $i++
    if ($i -gt 59) {
		{ Write-Progress -Activity “Waiting on AppFab” -status “Waiting on AppFab $i” -percentComplete ($i / 100)}
        }
}

Set-Location C:\Users\Public\dynamic_scheduler\logs
Get-ChildItem -Filter Fab* | Where-Object LastWriteTime -ge $starttime | Get-Content -Tail 10
Write-Host "Started AppConstraints at"(get-date).ToString("HH:mm:ss") -NoNewline
Write-Host " and expected finish at"(get-date).AddMinutes(1).ToString("HH:mm:ss")
$null = Enable-ScheduledTask AppConstraints | Start-ScheduledTask
$null = Disable-ScheduledTask AppConstraints
while ((Get-ScheduledTask -TaskName 'AppConstraints').State  -ne 'Disabled') {
	Write-Host "Waiting on AppConstraints..."
}

$i=0
while ((Get-ScheduledTask -TaskName 'OneBuildUninst').State  -ne 'Disabled') {
    $i++
	Write-Progress -Activity "Waiting on OneBuildUninst" -status "Attempt $i" -percentComplete ($i / 60)
	}

Set-Location C:\Users\Public\dynamic_scheduler\logs
Get-ChildItem -Filter Constraints* | Where-Object LastWriteTime -ge $starttime | Get-Content -Tail 10

### CHECK RECUR
Write-Host "Started RecurFactory at"$RecurStartTime -NoNewline
Write-Host " and expected finish at"$RecurGuessFinish
while ((Get-ScheduledTask -TaskName 'RecurFactory').State  -ne 'Disabled') {
	Write-Host "Waiting on RecurFactory..."
}
Write-Host "Check database for RecurFactory status"
}
Write-Host "Press `"y`" to enable all scheduled tasks or `"Ctrl-C`" to cancel"
do
{
$key = [Console]::ReadKey("noecho")
}
while($key.Key -ne "y")
$global:07Status = "COMPLETE"