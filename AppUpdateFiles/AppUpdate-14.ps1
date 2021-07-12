#############################################################
# AppUpdate-14.ps1                                   #
# Programmers: Greg Carriger                                #
# Date: November 2020                                       #
#############################################################

#deploy qa code." $14Status
Start-Process "chrome.exe" "http://example-02:8080/login"
$global:14Status = "COMPLETE"