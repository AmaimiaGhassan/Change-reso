**VALORANT Screen Resolution Scripts
**
These PowerShell scripts are designed to simplify your gaming setup for VALORANT players who want to avoid the hassle of adjusting screen resolutions manually. With these tools, you can easily set your screen resolution for an optimal gaming experience and restore it to its original settings when you're done. Features

Automatic Resolution Adjustment: Quickly change your screen resolution with a single command.
Seamless Restoration: Revert to your original display resolution effortlessly.
Enhanced Gaming Experience: Ensure a stretched display for VALORANT without repetitive manual adjustments.

Scripts Overview

set-screen-reso.ps1: Adjusts your screen resolution to the desired setting for a stretched display in VALORANT.
screen-reso-backup.ps1: Restores your original screen resolution with a simple command.

How to Use

Download the Scripts: Obtain the PowerShell scripts from this repository.
Set Screen Resolution:
    Open PowerShell as an administrator.
    Navigate to the directory where set-screen-reso.ps1 is located.
    Run the script by typing .\set-screen-reso.ps1 and pressing Enter.
Restore Original Resolution:
    Open PowerShell as an administrator.
    Navigate to the directory where screen-reso-backup.ps1 is located.
    Run the script by typing .\screen-reso-backup.ps1 and pressing Enter.

Requirements

Windows OS: These scripts are designed for Windows operating systems.
PowerShell: Ensure you have PowerShell installed and have permission to run scripts.

Execution Instructions

Open PowerShell: Run PowerShell as an administrator.
Navigate to Script Directory: Use cd path\to\scripts to change to the directory where your scripts are saved.
Run the Desired Script:
    For setting resolution: .\set-screen-reso.ps1
    For restoring resolution: .\screen-reso-backup.ps1

Troubleshooting

Script Execution Policy: You might need to adjust your PowerShell execution policy. Use Set-ExecutionPolicy RemoteSigned if needed.
Permission Issues: Ensure you have the necessary permissions to modify system settings.

License

This project is licensed under the MIT License.
