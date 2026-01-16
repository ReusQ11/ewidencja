# PowerShell script to setup and run the project

# Check if running in PowerShell
if ($PSVersionTable.PSVersion.Major -lt 5) {
    Write-Host "PowerShell version 5 or greater is required."
    exit 1
}

# Set execution policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process

# Install necessary modules
Install-Module -Name SomeModule -Force -AllowClobber

# Start the application
Start-Application -SomeParameters
