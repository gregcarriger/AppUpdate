#############################################################
# AppUpdate-22.ps1                                   #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

# login to Production analytics and get a hostname."
if(([Security.Principal.WindowsIdentity]::GetCurrent()).name -eq $aAccount) {
	$global:AnalyticsPSSession = New-PSSession -computername $prodAnalyticsServer
}else {
	$global:AnalyticsPSSession = New-PSSession -computername $prodAnalyticsServer -Credential $aAccount
}
Invoke-Command -Session $AnalyticsPSSession -Scriptblock {
$env:computername
}
$global:22Status = "COMPLETE"