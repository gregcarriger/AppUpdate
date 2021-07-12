#############################################################
# AppUpdate-11.ps1                                   #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

#copy and compare qa git repos." $11Status

# Dev to qa Analytics
robocopy $GitPath\$devAnalytics\exampleapp1 $GitPath\$qaAnalytics\exampleapp1 /E /R:5 /W:5 /TBD /NP /V /XF "$GitPath\$devAnalytics\exampleapp1\R_scripts\smtp.R"
robocopy $GitPath\$devAnalytics\exampleapp2 $GitPath\$qaAnalytics\exampleapp2 /E /R:5 /W:5 /TBD /NP /V
Set-Location $GitPath\$qaAnalytics
git status
Write-Host "Press `"y`" to continue or `"Ctrl-C`" to cancel"
do
{
$key = [Console]::ReadKey("noecho")
}
while($key.Key -ne "y")
git diff

# Dev to qa DS
robocopy $GitPath\$devDS\com $GitPath\$qaDS\com /E /R:5 /W:5 /TBD /NP /V
robocopy $GitPath\$devDS\example2 $GitPath\$qaDS\example2 /E /R:5 /W:5 /TBD /NP /V
Write-Host -NoNewLine 'Press any key to continue...'
Set-Location $GitPath\$qaDS
git status
Write-Host "Press `"y`" to continue or `"Ctrl-C`" to cancel"
do
{
$key = [Console]::ReadKey("noecho")
}
while($key.Key -ne "y")
git diff

# Dev to qa Backend
robocopy $GitPath\$devBackend $GitPath\$qabackend /E /R:5 /W:5 /TBD /NP /V /XD ".git" /XF "$GitPath\$devbackend\.gitignore"
Set-Location $GitPath\$qabackend
git status
Write-Host "Press `"y`" to continue or `"Ctrl-C`" to cancel"
do
{
$key = [Console]::ReadKey("noecho")
}
while($key.Key -ne "y")
git diff

# Dev to qa Frontend
robocopy $GitPath\$devFrontend\src $GitPath\$qaFrontend\src /E /R:5 /W:5 /TBD /NP /V /XF "$GitPath\$devFrontend\src\globals.js"
robocopy $GitPath\$devFrontend\static $GitPath\$qaFrontend\static /E /R:5 /W:5 /TBD /NP /V /XD "$GitPath\$devFrontend\static\apps"
Set-Location $GitPath\$qaFrontend
git status
Write-Host "Press `"y`" to continue or `"Ctrl-C`" to cancel"
do
{
$key = [Console]::ReadKey("noecho")
}
while($key.Key -ne "y")
git diff

$global:11Status = "COMPLETE"