#############################################################
# AppUpdate-02.ps1                                   #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

# pull production git repos." $02Status

cmdkey.exe /delete:git:https://git-codecommit.us-gov-west-1.amazonaws.com
cmdkey.exe /generic:git:https://git-codecommit.us-gov-west-1.amazonaws.com /user:$GitDevUser /password:(Get-Content $GitDevPassFile)

Set-Location $GitPath\$devAnalytics
git checkout Production
git pull
Set-Location $GitPath\$devFrontend
git checkout Production
git pull
Set-Location $GitPath\$devBackend
git checkout Production
git pull
Set-Location $GitPath\$devDS
git checkout Production
git pull

cmdkey.exe /delete:git:https://git-codecommit.us-gov-west-1.amazonaws.com
cmdkey.exe /generic:git:https://git-codecommit.us-gov-west-1.amazonaws.com /user:$GitProdUser /password:(Get-Content $GitProdPassFile)

Set-Location $GitPath\$prodAnalytics
git pull
Set-Location $GitPath\$prodFrontend
git pull
Set-Location $GitPath\$prodBackend
git pull
Set-Location $GitPath\$prodDS
git pull

$global:02Status = "COMPLETE"