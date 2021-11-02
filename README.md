# AppUpdate

PowerShell program to update, deploy, and test software updates.

## Step 1 - Set variables

Open up AppUpdate-Config.ps1 in a text editor and make sure "Personal Variables" and "Variables" are set correctly.

## Step 2 - Run the program

Run AppUpdate-Start.ps1 with ```powershell
.\AppUpdate-Start.ps1
```

## Step 3 - Update the program

This script has 4 main sections. It has sections to update Production, QA, and Dev, and also a section to validate required logins and validate files and connectivity needed for the script to function properly.
