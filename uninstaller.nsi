; Steam Legacy Uninstaller Builder
; This script builds UninstallSteamLegacy.exe as a standalone uninstaller

!include "MUI2.nsh"

Name "Steam Legacy Uninstaller Builder"
OutFile "UninstallBuilder.exe"
InstallDir "$PROGRAMFILES\SteamLegacy"
ShowInstDetails show
XPStyle on
RequestExecutionLevel admin

Section "Build Uninstaller"

  ; Write the actual uninstaller EXE
  WriteUninstaller "$EXEDIR\UninstallSteamLegacy.exe"

SectionEnd

; --- Uninstaller Logic ---
UninstallCaption "Steam Legacy Uninstaller"
UninstallText "This will remove Steam Legacy and all related files from your system."

Section "Uninstall"

  DetailPrint "Removing Steam Legacy files..."
  Delete "$INSTDIR\steam.cfg"
  Delete "$INSTDIR\Steam.exe"
  Delete "$INSTDIR\QuickPatcher.exe"
  Delete "$INSTDIR\*.dll"
  Delete "$INSTDIR\*.txt"
  Delete "$INSTDIR\*.ini"
  Delete "$INSTDIR\*.dat"
  RMDir /r "$INSTDIR"

  DetailPrint "Removing osver.ini from System32..."
  Delete "$SYSDIR\osver.ini"

  DetailPrint "Removing QuickPatcher folder from Desktop..."
  RMDir /r "$DESKTOP\QuickPatcher"

  DetailPrint "Removing Steam shortcut from Desktop..."
  Delete "$DESKTOP\Steam.lnk"

  DetailPrint "Uninstall complete."

SectionEnd
