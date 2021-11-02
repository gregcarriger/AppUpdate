# AppUpdate ☝

PowerShell program to update, deploy, and test software updates.

- This script reduced software deployments from 3 hours to 1 hour.

## Step 1 - Set variables 📝

Open up AppUpdate-Config.ps1 in a text editor and make sure "Personal Variables" and "Variables" are set correctly.

## Step 2 - Run the script 🏃

Run AppUpdate-Start.ps1 in a PowerShell prompt with `.\AppUpdate-Start.ps1`

## Step 3 - Update AWS hosted software ☁

This script has 4 main sections. It has sections to update Production, QA, and Dev, and also a section to validate required logins and validate files and connectivity needed for the script to function properly.

## ⚠ Global Variables Warning ⚠

This script uses global variables so it can carry variables into PowerShell remoting sessions and so status is maintained during multiple script runs.
