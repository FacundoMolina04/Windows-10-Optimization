@echo off
@echo Optimization
pause
@echo.
@echo Install internet driver
pause
@echo.
"devmgmt.msc" 
@echo Install amd driver
pause
@echo.
start https://www.amd.com/en/support
@echo Install nvidia driver
pause
@echo.
start https://www.nvidia.com/download/index.aspx
@echo Installing optimizations
pause
@echo.
@echo Please wait . . .
@echo.
"C:\Windows\Setup\Scripts\files\Inspector.exe" "C:\Windows\Setup\Scripts\files\Inspector.nip" -silent /f >nul 2>&1
timeout 2 >nul
"regedit.exe" /s "C:\Windows\Setup\Scripts\files\Registry.reg"
timeout 2 >nul
powercfg -import "C:\Windows\Setup\Scripts\files\Power.pow" 77777777-7777-7777-7777-777777777777 >nul
timeout 2 >nul
powercfg -SETACTIVE "77777777-7777-7777-7777-777777777777" 
timeout 2 >nul
powercfg -delete 381b4222-f694-41f0-9685-ff5bb260df2e
timeout 2 >nul
powercfg -delete 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
timeout 2 >nul
powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a
timeout 2 >nul
powercfg -h off
timeout 2 >nul
"C:\Windows\Setup\Scripts\files\Vs2010x64.exe" /install /quiet /norestart
timeout 2 >nul
"C:\Windows\Setup\Scripts\files\Vs2010x86.exe" /install /quiet /norestart
timeout 2 >nul
"C:\Windows\Setup\Scripts\files\STR.exe" -install /f >nul 2>&1
timeout 2 >nul
sc config STR start=auto /f >nul 2>&1
timeout 2 >nul
net start STR /f >nul 2>&1
timeout 2 >nul
start powershell -windowstyle hidden "& ""C:\Windows\Setup\Scripts\files\Debloat.ps1"""
timeout 80 >nul
start powershell -windowstyle hidden "& ""C:\Windows\Setup\Scripts\files\Tiles.ps1"""
timeout 20 >nul
@echo Optimize amd settings
pause
@echo.
"C:\Program Files\AMD\CNext\CNext\RadeonSoftware.exe" /f >nul 2>&1
@echo Optimize nvidia settings
pause
@echo.
takeown.exe /f "C:\Program Files\WindowsApps\NVIDIACorp.NVIDIAControlPanel_8.1.964.0_x64__56jybvy8sckqj" /r /d y >nul
icacls.exe "C:\Program Files\WindowsApps\NVIDIACorp.NVIDIAControlPanel_8.1.964.0_x64__56jybvy8sckqj" /grant *S-1-3-4:F /t /q >nul
"C:\Program Files\WindowsApps\NVIDIACorp.NVIDIAControlPanel_8.1.964.0_x64__56jybvy8sckqj\nvcplui.exe"
@echo Restarting pc
pause
C:\Windows\System32\shutdown.exe /r /t 0