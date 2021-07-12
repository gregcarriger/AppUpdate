#############################################################
# AppUpdate-10.ps1                                   #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

# pull qa git repos." $10Status

cmdkey.exe /delete:git:https://git-codecommit.us-gov-west-1.amazonaws.com
cmdkey.exe /generic:git:https://git-codecommit.us-gov-west-1.amazonaws.com /user:$GitDevUser /password:(Get-Content $GitDevPassFile)

$GitBranchQA = Read-Host -Prompt "Enter Branch to pull from"
Set-Location $GitPath\$devAnalytics
git checkout $GitBranchQA
git pull
Set-Location $GitPath\$devFrontend
git checkout $GitBranchQA
git pull
Set-Location $GitPath\$devBackend
git checkout $GitBranchQA
git pull
Set-Location $GitPath\$devDS
git checkout $GitBranchQA
git pull

cmdkey.exe /delete:git:https://git-codecommit.us-gov-west-1.amazonaws.com
cmdkey.exe /generic:git:https://git-codecommit.us-gov-west-1.amazonaws.com /user:$GitQAUser /password:(Get-Content $GitqaPassFile)

Set-Location $GitPath\$qaAnalytics
git pull
Set-Location $GitPath\$qaFrontend
git pull
Set-Location $GitPath\$qaBackend
git pull
Set-Location $GitPath\$qaDS
git pull

$global:10Status = "COMPLETE"