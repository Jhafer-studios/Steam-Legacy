;Compression must be declared first
SetCompressor lzma

;Include Classic Modern UI and helper libraries
!include "MUI.nsh"
!include "LogicLib.nsh"
!include "FileFunc.nsh"

;Installer metadata
Name "Steam Legacy"
OutFile "SteamLegacySetup.exe"

VIProductVersion "1.0.0.0"     
VIFileVersion "1.0.0.0"     
VIAddVersionKey "ProductName" "Steam Legacy Setup"
VIAddVersionKey "FileDescription" "Steam installer for Windows 7"
VIAddVersionKey "FileVersion" "1.0.0.0"
InstallDir "$PROGRAMFILES\Steam"
RequestExecutionLevel admin

;!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
;!insertmacro MUI_PAGE_FINISH

;Installation section
Section "Install Steam"

  DetailPrint "Installing Steam files..."
  SetOutPath "$INSTDIR"
  File /r "Steam\*.*"

  DetailPrint "Copying steam.cfg..."
  File "steam.cfg"

  DetailPrint "Copying osver.ini to System32..."
  SetOutPath "$SYSDIR"
  File "osver.ini"

  DetailPrint "Copying QuickPatcher to Desktop..."
  SetOutPath "$DESKTOP\QuickPatcher"
  File "QuickPatcher_Patch_v1.2.0\Fixed Steam FriendsUI QuickPatcher.exe"
  File "QuickPatcher_Patch_v1.2.0\Fixed Steam FriendsUI QuickPatcher.exe.config"
  File "QuickPatcher_Patch_v1.2.0\Newtonsoft.Json.dll"
  File "QuickPatcher_Patch_v1.2.0\Ookii.Dialogs.Wpf.dll"

  DetailPrint "Creating Steam shortcut on Desktop..."
  SetOutPath "$DESKTOP"
  File "steam.lnk"

SectionEnd

;Finish message
Function .onInstSuccess
  MessageBox MB_OK "Steam has been installed. After signing in, run QuickPatcher from your desktop to enable Friends and Chat."
  
FunctionEnd
