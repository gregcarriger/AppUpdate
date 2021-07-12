#############################################################
# AppUpdate-12.ps1                                   #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

#commit qauction git repos."

cmdkey.exe /delete:git:https://git-codecommit.us-gov-west-1.amazonaws.com
cmdkey.exe /generic:git:https://git-codecommit.us-gov-west-1.amazonaws.com /user:$GitQAUser /password:(Get-Content $GitQAPassFile)


Set-Location $GitPath\$qaAnalytics
git add .
git commit -m "dev branch to qa code push"
git push
Set-Location $GitPath\$qaFrontend
git add .
git commit -m "dev branch to qa code push"
git push
Set-Location $GitPath\$qaBackend
git add .
git commit -m "dev branch to qa code push"
git push
Set-Location $GitPath\$qaDS
git add .
git commit -m "dev branch to qa code push"
git push

$global:12Status = "COMPLETE"