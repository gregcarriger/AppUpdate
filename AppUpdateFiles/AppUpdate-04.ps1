#############################################################
# AppUpdate-04.ps1                                   #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

#commit production git repos." $04Status

Set-Location $GitPath\$prodAnalytics
git add .
git commit -m "dev branch to prod code push"
git push
Set-Location $GitPath\$prodFrontend
git add .
git commit -m "dev branch to prod code push"
git push
Set-Location $GitPath\$prodBackend
git add .
git commit -m "dev branch to prod code push"
git push
Set-Location $GitPath\$prodDS
git add .
git commit -m "dev branch to prod code push"
git push

$global:04Status = "COMPLETE"