#############################################################
# AppUpdate-Config.ps1                               #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

# Personal Variables
$global:GitPath = "C:\git"
$global:aAccount = ([Security.Principal.WindowsIdentity]::GetCurrent()).name -replace 'u','a'
$global:GitDevUser = "JenkinsGitUser-at-123456789012"
$global:GitDevPassFile = "secret\dev.txt"
$global:GitQAUser = "JenkinsGitUser-at-234567890123"
$global:GitQAPassFile = "secret\qa.txt"
$global:GitProdUser = "JenkinsGitUser-at-345678901234"
$global:GitProdPassFile = "secret\prod.txt"

# Variables
$global:devAnalytics = "CompanyApp-Analytics"
$global:devDS = "CompanyApp-DS"
$global:devBackend = "CompanyApp-BackEnd"
$global:devFrontend = "CompanyApp-Frontend"
$global:qaAnalytics = "CompanyApp-Analytics-QA"
$global:qaDS = "CompanyApp-DS-QA"
$global:qaBackend = "CompanyApp-BackEnd-QA"
$global:qaFrontend = "CompanyApp-FrontEnd-QA"
$global:prodAnalytics = "CompanyApp-Analytics-Prod"
$global:prodDS = "CompanyApp-DS-Prod"
$global:prodBackend = "CompanyApp-BackEnd-Prod"
$global:prodFrontend = "CompanyApp-FrontEnd-Prod"
$global:breakFixAnalytics = "CompanyApp-Analytics-Breakfix"
$global:breakFixDS = "CompanyApp-DS-Breakfix"
$global:breakFixBackend = "CompanyApp-BackEnd-Breakfix"
$global:breakFixFrontend = "CompanyApp-FrontEnd-Breakfix"
$global:devAnalyticsServer = "example11.company.com"
$global:qaAnalyticsServer = "example21.company.com"
$global:prodAnalyticsServer = "example01.company.com"

# Reset Run Status Variables if they don't exist
if(Test-Path variable:global:01Status) {
}else {
$global:01Status = "Not Run"
$global:02Status = "Not Run"
$global:03Status = "Not Run"
$global:04Status = "Not Run"
$global:05Status = "Not Run"
$global:06Status = "Not Run"
$global:07Status = "Not Run"
$global:08Status = "Not Run"
$global:09Status = "Not Run"
$global:10Status = "Not Run"
$global:11Status = "Not Run"
$global:12Status = "Not Run"
$global:13Status = "Not Run"
$global:14Status = "Not Run"
$global:15Status = "Not Run"
$global:16Status = "Not Run"
$global:17Status = "Not Run"
$global:18Status = "Not Run"
$global:19Status = "Not Run"
$global:20Status = "Not Run"
$global:21Status = "Not Run"
$global:22Status = "Not Run"
}

function global:Show-CodeMoveMenu {
    param (
        [string]$Title = 'FloorSight Code Move'
    )
    Clear-Host
    Write-Host "================ Production ================"
    Write-Host "1: Press '1' Stop Production analytics scheduled tasks." $01Status
    Write-Host "2: Press '2' Pull production git repos." $02Status
	Write-Host "3: Press '3' Copy and compare production git repos." $03Status
	Write-Host "4: Press '4' Commit production git repos." $04Status
    Write-Host "5: Press '5' Check production analytics scheduled tasks." $05Status
	Write-Host "6: Press '6' Deploy production code." $06Status
    Write-Host "7: Press '7' Run production standard run through." $07Status
    Write-Host "8: Press '8' Turn on production analytics tasks." $08Status
	Write-Host "================ QA ================"
    Write-Host "9: Press '9' Stop QA analytics scheduled tasks." $09Status
    Write-Host "10: Press '10' Pull QA git repos." $10Status
    Write-Host "11: Press '11' Copy and compare QA git repos." $11Status
    Write-Host "12: Press '12' Commit QA git repos." $12Status
    Write-Host "13: Press '13' Check QA analytics scheduled tasks." $13Status
	Write-Host "14: Press '14' Deploy QA code." $14Status
    Write-Host "15: Press '15' Run a QA standard run through." $15Status
    Write-Host "16: Press '16' Turn on QA analytics scheduled tasks." $16Status
	Write-Host "================ UAT ================"
    Write-Host "17: Press '17' Pull UAT git repos." $17Status
    Write-Host "18: Press '18' Copy and compare UAT git repos." $18Status
    Write-Host "19: Press '19' Commit UAT git repos." $19Status
	Write-Host "20: Press '20' Deploy UAT code." $20Status
	Write-Host "================ Utility ================"
    Write-Host "21: Press '21' Validate analytics login." $21Status
    Write-Host "22: Press '22' Validate files and connectivity." $22Status
	Write-Host "Q: Press 'Q' to quit."
}