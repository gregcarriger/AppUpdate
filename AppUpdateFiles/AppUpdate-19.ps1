#############################################################
# AppUpdate-19.ps1                                   #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

#commit breakfix git repos."

cmdkey.exe /delete:git:https://git-codecommit.us-gov-west-1.amazonaws.com
cmdkey.exe /generic:git:https://git-codecommit.us-gov-west-1.amazonaws.com /user:$GitQAUser /password:(Get-Content $GitQAPassFile)


Set-Location $GitPath\$breakFixAnalytics
git add .
git commit -m "dev Spiritqa branch to breakfix code push"
git push
Set-Location $GitPath\$breakFixFrontend
git add .
git commit -m "dev Spiritqa branch to breakfix code push"
git push
Set-Location $GitPath\$breakFixBackend
git add .
git commit -m "dev Spiritqa branch to breakfix code push"
git push
Set-Location $GitPath\$breakFixDS
git add .
git commit -m "dev Spiritqa branch to breakfix code push"
git push

$global:19Status = "COMPLETE"