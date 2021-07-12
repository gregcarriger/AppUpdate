#############################################################
# AppUpdate-21.ps1                                   #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

write-output "Checking Git folder"
Test-Path -Path $GitPath
write-output "Checking Git Dev Password"
Test-Path -Path $GitDevPassFile
write-output "Checking Git QA Password"
Test-Path -Path $GitQAPassFile
write-output "Checking Git Prod Password"
Test-Path -Path $GitProdPassFile
write-output "Checking Git dev Analytics local repo"
Test-Path -Path $GitPath\$devAnalytics
write-output "Checking Git dev DS local repo"
Test-Path -Path $GitPath\$devDS
write-output "Checking Git dev Backend local repo"
Test-Path -Path $GitPath\$devBackend
write-output "Checking Git dev Frontend local repo"
Test-Path -Path $GitPath\$devFrontend
write-output "Checking Git qa Analytics local repo"
Test-Path -Path $GitPath\$qaAnalytics
write-output "Checking Git qa DS local repo"
Test-Path -Path $GitPath\$qaDS
write-output "Checking Git qa Backend local repo"
Test-Path -Path $GitPath\$qaBackend
write-output "Checking Git qa Frontend local repo"
Test-Path -Path $GitPath\$qaFrontend
write-output "Checking Git prod Analytics local repo"
Test-Path -Path $GitPath\$prodAnalytics
write-output "Checking Git prod DS local repo"
Test-Path -Path $GitPath\$prodDS
write-output "Checking Git prod Backend local repo"
Test-Path -Path $GitPath\$prodBackend
write-output "Checking Git prod Frontend local repo"
Test-Path -Path $GitPath\$prodFrontend
write-output "Checking dev Analytics Server PS Remote Port"
(Test-NetConnection $devAnalyticsServer -port 5985).TcpTestSucceeded
write-output "Checking qa Analytics Server PS Remote Port"
(Test-NetConnection $qaAnalyticsServer -port 5985).TcpTestSucceeded
write-output "Checking prod Analytics Server PS Remote Port"
(Test-NetConnection $prodAnalyticsServer -port 5985).TcpTestSucceeded
$global:21Status = "COMPLETE"
