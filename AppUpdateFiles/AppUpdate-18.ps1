#############################################################
# AppUpdate-18.ps1                                   #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

#copy and compare breakfix git repos." $18Status

# Dev to breakfix Analytics
robocopy $GitPath\$devAnalytics\exampleapp1 $GitPath\$breakFixAnalytics\exampleapp1 /E /R:5 /W:5 /TBD /NP /V /XF "$GitPath\$devAnalytics\exampleapp1\R_scripts\smtp.R"
robocopy $GitPath\$devAnalytics\exampleapp2 $GitPath\$breakFixAnalytics\exampleapp2 /E /R:5 /W:5 /TBD /NP /V
Set-Location $GitPath\$breakFixAnalytics
git status
Write-Host "Press `"y`" to continue or `"Ctrl-C`" to cancel"
do
{
$key = [Console]::ReadKey("noecho")
}
while($key.Key -ne "y")
git diff

# Dev to breakfix DS
robocopy $GitPath\$devDS\com $GitPath\$breakFixDS\com /E /R:5 /W:5 /TBD /NP /V
robocopy $GitPath\$devDS\example2 $GitPath\$breakFixDS\example2 /E /R:5 /W:5 /TBD /NP /V
Write-Host -NoNewLine 'Press any key to continue...'
Set-Location $GitPath\$breakFixDS
git status
Write-Host "Press `"y`" to continue or `"Ctrl-C`" to cancel"
do
{
$key = [Console]::ReadKey("noecho")
}
while($key.Key -ne "y")
git diff

# Dev to breakfix Backend
robocopy $GitPath\$devBackend $GitPath\$breakFixBackend /E /R:5 /W:5 /TBD /NP /V /XD ".git" /XF "$GitPath\$devbackend\.gitignore"
Set-Location $GitPath\$breakFixBackend
git status
Write-Host "Press `"y`" to continue or `"Ctrl-C`" to cancel"
do
{
$key = [Console]::ReadKey("noecho")
}
while($key.Key -ne "y")
git diff

# Dev to breakfix Frontend
robocopy $GitPath\$devFrontend\src $GitPath\$breakFixFrontend\src /E /R:5 /W:5 /TBD /NP /V /XF "$GitPath\$devFrontend\src\globals.js"
robocopy $GitPath\$devFrontend\static $GitPath\$breakFixFrontend\static /E /R:5 /W:5 /TBD /NP /V /XD "$GitPath\$devFrontend\static\apps"
Set-Location $GitPath\$breakFixFrontend
git status
Write-Host "Press `"y`" to continue or `"Ctrl-C`" to cancel"
do
{
$key = [Console]::ReadKey("noecho")
}
while($key.Key -ne "y")
git diff

$global:18Status = "COMPLETE"