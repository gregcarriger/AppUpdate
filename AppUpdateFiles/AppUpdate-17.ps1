#############################################################
# AppUpdate-17.ps1                                   #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

# pull breakfix git repos." $17Status

cmdkey.exe /delete:git:https://git-codecommit.us-gov-west-1.amazonaws.com
cmdkey.exe /generic:git:https://git-codecommit.us-gov-west-1.amazonaws.com /user:$GitDevUser /password:(Get-Content $GitDevPassFile)

$GitBranchBF = Read-Host -Prompt "Enter Branch to pull from"
Set-Location $GitPath\$devAnalytics
git checkout $GitBranchBF
git pull
Set-Location $GitPath\$devFrontend
git checkout $GitBranchBF
git pull
Set-Location $GitPath\$devBackend
git checkout $GitBranchBF
git pull
Set-Location $GitPath\$devDS
git checkout $GitBranchBF
git pull

cmdkey.exe /delete:git:https://git-codecommit.us-gov-west-1.amazonaws.com
cmdkey.exe /generic:git:https://git-codecommit.us-gov-west-1.amazonaws.com /user:$GitQAUser /password:(Get-Content $GitqaPassFile)

Set-Location $GitPath\$breakFixAnalytics
git pull
Set-Location $GitPath\$breakFixFrontend
git pull
Set-Location $GitPath\$breakFixBackend
git pull
Set-Location $GitPath\$breakFixDS
git pull

$global:17Status = "COMPLETE"