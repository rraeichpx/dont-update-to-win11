@echo off
echo STARTING AGGRESSIVE CLEANUP OPERATION...
echo ----------------------------------------

:: 1. Check Admin
net session >nul 2>&1
if %errorLevel% == 0 (
    echo [OK] Admin privileges confirmed.
) else (
    echo [ERROR] Run as Administrator!
    pause
    exit
)

:: 2. Stop ALL related services to unlock files
echo [1/5] Stopping Windows Update, BITS, and Cryptography services...
net stop wuauserv
net stop bits
net stop cryptsvc
net stop dosvc
net stop msiserver

:: 3. WIPE the Download Cache (This deletes the pending update files)
echo [2/5] Wiping update cache files (SoftwareDistribution and Catroot2)...

:: Deleting SoftwareDistribution (Where updates are downloaded)
if exist C:\Windows\SoftwareDistribution rmdir /s /q C:\Windows\SoftwareDistribution

:: Deleting Catroot2 (Where update signatures are stored)
if exist C:\Windows\System32\catroot2 rmdir /s /q C:\Windows\System32\catroot2

:: Recreate empty folders
mkdir C:\Windows\SoftwareDistribution
mkdir C:\Windows\System32\catroot2

:: 4. Disable the Services (Again, to be sure)
echo [3/5] Disabling services permanently...
sc config wuauserv start= disabled
sc config bits start= disabled
sc config dosvc start= disabled

:: 5. Registry Hacks to Remove "Update and Restart" from Power Menu
echo [4/5] Modifying Registry to hide Power Menu update options...

:: Remove "Update and Restart" / "Update and Shutdown" options
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAUAsDefaultShutdownOption /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAUShutdownOption /t REG_DWORD /d 1 /f

:: Re-apply the version lock (Just in case)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v TargetReleaseVersion /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v TargetReleaseVersionInfo /t REG_SZ /d 22H2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v ProductVersion /t REG_SZ /d "Windows 10" /f

:: 6. Restart Services (Only CryptSvc is needed for Windows to function normally)
echo [5/5] Restarting essential crypto service (keeping Update dead)...
net start cryptsvc

echo.
echo ---------------------------------------------------
echo OPERATION SUCCESSFUL.
echo The pending update files have been deleted.
echo The Power Menu options should be gone after reboot.
echo ---------------------------------------------------
echo PLEASE RESTART YOUR PC NOW.
pause