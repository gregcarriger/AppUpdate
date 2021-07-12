#############################################################
# AppUpdate-03.ps1                                   #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

#copy and compare production git repos." $03Status

# Dev to PROD Analytics
robocopy $GitPath\$devAnalytics\exampleapp $GitPath\$prodAnalytics\exampleapp /E /R:5 /W:5 /TBD /NP /V /XF "$GitPath\$devAnalytics\exampleapp\R_scripts\smtp.R"
robocopy $GitPath\$devAnalytics\exampleapp2 $GitPath\$prodAnalytics\exampleapp2 /E /R:5 /W:5 /TBD /NP /V
Set-Location $GitPath\$prodAnalytics
git status
Write-Host "Press `"y`" to continue or `"Ctrl-C`" to cancel"
do
{
$key = [Console]::ReadKey("noecho")
}
while($key.Key -ne "y")
git diff

# Dev to PROD DS
robocopy $GitPath\$devDS\com $GitPath\$prodDS\com /E /R:5 /W:5 /TBD /NP /V
robocopy $GitPath\$devDS\exampleapp2 $GitPath\$prodDS\exampleapp2 /E /R:5 /W:5 /TBD /NP /V
Write-Host -NoNewLine 'Press any key to continue...'
Set-Location $GitPath\$prodDS
git status
Write-Host "Press `"y`" to continue or `"Ctrl-C`" to cancel"
do
{
$key = [Console]::ReadKey("noecho")
}
while($key.Key -ne "y")
git diff

# Dev to PROD Backend
robocopy $GitPath\$devBackend $GitPath\$prodbackend /E /R:5 /W:5 /TBD /NP /V /XD ".git" /XF "$GitPath\$devbackend\.gitignore"
Set-Location $GitPath\$prodbackend
git status
Write-Host "Press `"y`" to continue or `"Ctrl-C`" to cancel"
do
{
$key = [Console]::ReadKey("noecho")
}
while($key.Key -ne "y")
git diff

# Dev to PROD Frontend
robocopy $GitPath\$devFrontend\src $GitPath\$prodFrontend\src /E /R:5 /W:5 /TBD /NP /V /XF "$GitPath\$devFrontend\src\globals.js"
robocopy $GitPath\$devFrontend\static $GitPath\$prodFrontend\static /E /R:5 /W:5 /TBD /NP /V /XD "$GitPath\$devFrontend\static\apps"
Set-Location $GitPath\$prodFrontend
git status
Write-Host "Press `"y`" to continue or `"Ctrl-C`" to cancel"
do
{
$key = [Console]::ReadKey("noecho")
}
while($key.Key -ne "y")
git diff

$global:03Status = "COMPLETE"