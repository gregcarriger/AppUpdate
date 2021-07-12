#############################################################
# AppUpdate-20.ps1                                   #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

#deploy breakfix code." $20Status
Start-Process "chrome.exe" "http://fls-ict-02:8080/login?from=%2F"
$global:20Status = "COMPLETE"