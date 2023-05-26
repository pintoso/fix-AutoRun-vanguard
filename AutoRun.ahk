#NoEnv
#SingleInstance, Force
#Persistent
SetTitleMatchMode, 2
DetectHiddenWindows, On

SetWorkingDir, %A_ScriptDir%
#Include %A_ScriptDir%\libs\Class_ImageButton.ahk
#Include %A_ScriptDir%\libs\UseGDIP.ahk
#Include %A_ScriptDir%\libs\Scheduler.ahk

SetTimer, CheckValorant, 5000
SetTimer, CheckVegas, 5000

;---- tray
;
TrayTip, AutoRun, #PINTOSO#
Menu, tray, NoStandard
Menu, sub, Add, ON
Menu, sub, Add, OFF
Menu, Tray, Add, HELP, link
Menu, Tray, Add
Menu, Tray, Add, FIXvegas
Menu, Tray, Add, FIXvalorant
Menu, Tray, Add
Menu, Tray, Add, Startup, :sub
Menu, Tray, Add
Menu, Tray, Add, EXIT, Exit
Menu, Tray, Tip, AutoRun

;---- check startup
;
if Scheduler_Exists("AutoRun") {
	Menu, sub, ToggleEnable, OFF
	Menu, sub, Enable, ON
}else {
	Menu, sub, ToggleEnable, ON
	Menu, sub, Enable, OFF
}

;---- check regedit
;
RegRead, regeditinfo, HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options, DevOverrideEnable
if regeditinfo == 1
{
	Menu, Tray, ToggleEnable, FIXvegas
	Menu, Tray, Enable, FIXvalorant
}
else
{
	Menu, Tray, ToggleEnable, FIXvalorant
	Menu, Tray, Enable, FIXvegas
}

return

;---- valorant
;
CheckValorant:
   Process, Exist, RiotClientServices.exe
    
   valorant := ErrorLevel
    
	If (!valorant) {
   perm := 0
   }
	
   If (valorant) {
   Gui valorantgui:+LastFoundExist
   if !WinExist() {
      RegRead, regeditinfo2, HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options, DevOverrideEnable
      if (regeditinfo2 == 1 and perm != 1)     {
	  
	  Gui, Destroy
	  Gui, valorantgui:-Caption +alwaysontop
	  Gui, valorantgui:Margin, 20, 20
	  gui, valorantgui:Font, s11 normal, Segoe UI
	  gui, valorantgui:Add, Text,,⠀⠀⠀⠀Fix 𝐕𝐀𝐋𝐎𝐑𝐀𝐍𝐓?

	  Gui, valorantgui:Add, Button, w74 h50 y63 x20 hWndhBtn63 gFIXvalorant, % "YES"
	  IBBtnStyles := [ [0, 0x80C6E6C6, , , 0, , 0x805CB85C, 2]      ; normal
	  			   , [0, 0x8091CF91, , , 0, , 0x805CB85C, 2]      ; hover
	  			   , [0, 0x805CB85C, , , 0, , 0x805CB85C, 2]      ; pressed
	  			   , [0, 0x80F0F0F0, , , 0, , 0x805CB85C, 2] ]
	  ImageButton.Create(hBtn63, IBBtnStyles*)
	  Gui, valorantgui:Add, Button, w74 h50 y63 x120 hWndhBtn61 gGuiClosevalorant, % "NO"
	  IBBtnStyles := [ [0, 0x80F0B9B8, , , 0, , 0x80D43F3A, 2]      ; normal
		  		   , [0, 0x80E27C79, , , 0, , 0x80D43F3A, 2]      ; hover
	  			   , [0, 0x80D43F3A, , , 0, , 0x80D43F3A, 2]      ; pressed
	  			   , [0, 0x80F0F0F0, , , 0, , 0x80D43F3A, 2] ]
	  ImageButton.Create(hBtn61, IBBtnStyles*)
	  Gui, valorantgui:Show, AutoSize, AutoRun
	  
         }}}
         Return

;---- vegas
;
CheckVegas:
   Process, Exist, vegas200.exe
    
   vegas := ErrorLevel
    
	If (!vegas) {
   perm2 := 0
   }
	
   If (vegas) {
   Gui vegasgui:+LastFoundExist
   if !WinExist() {
      RegRead, regeditinfo3, HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options, DevOverrideEnable
      if (regeditinfo3 == 0 and perm2 != 1)     {
	  
	  Gui, Destroy
	  Gui, vegasgui:-Caption +alwaysontop
	  Gui, vegasgui:Margin, 20, 20
	  gui, vegasgui:Font, s11 normal, Segoe UI
	  gui, vegasgui:Add, Text,,⠀⠀Fix 𝐕𝐄𝐆𝐀𝐒?

	  Gui, vegasgui:Add, Button, w74 h50 y63 x20 hWndhBtn63 gFIXvegas, % "YES"
	  IBBtnStyles := [ [0, 0x80C6E6C6, , , 0, , 0x805CB85C, 2]      ; normal
	  			   , [0, 0x8091CF91, , , 0, , 0x805CB85C, 2]      ; hover
	  			   , [0, 0x805CB85C, , , 0, , 0x805CB85C, 2]      ; pressed
	  			   , [0, 0x80F0F0F0, , , 0, , 0x805CB85C, 2] ]
	  ImageButton.Create(hBtn63, IBBtnStyles*)
	  Gui, vegasgui:Add, Button, w74 h50 y63 x120 hWndhBtn61 gGuiClosevegas, % "NO"
	  IBBtnStyles := [ [0, 0x80F0B9B8, , , 0, , 0x80D43F3A, 2]      ; normal
		  		   , [0, 0x80E27C79, , , 0, , 0x80D43F3A, 2]      ; hover
	  			   , [0, 0x80D43F3A, , , 0, , 0x80D43F3A, 2]      ; pressed
	  			   , [0, 0x80F0F0F0, , , 0, , 0x80D43F3A, 2] ]
	  ImageButton.Create(hBtn61, IBBtnStyles*)
	  Gui, vegasgui:Show, AutoSize, AutoRun
	  
         }
         } }
         Return


;---- fix vegas
;
FIXvegas:
RegWrite, REG_DWORD, HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options, DevOverrideEnable, 1

Menu, Tray, ToggleEnable, FIXvegas
Menu, Tray, Enable, FIXvalorant


; GUI vegas
Gui, Destroy
Gui, -Caption +alwaysontop
Gui, Margin, 20, 20
Gui, Font, s11 normal, Segoe UI
Gui, Add, Text,,⠀⠀⠀ 𝐕𝐄𝐆𝐀𝐒 fixed!`nㅤ⠀    Restart now?

Gui, Add, Button, w74 h50 y63 x20 hWndhBtn63 grestart, % "RESTART"
IBBtnStyles := [ [0, 0x80C6E6C6, , , 0, , 0x805CB85C, 2]      ; normal
			   , [0, 0x8091CF91, , , 0, , 0x805CB85C, 2]      ; hover
			   , [0, 0x805CB85C, , , 0, , 0x805CB85C, 2]      ; pressed
			   , [0, 0x80F0F0F0, , , 0, , 0x805CB85C, 2] ]
ImageButton.Create(hBtn63, IBBtnStyles*)
Gui, Add, Button, w74 h50 y63 x120 hWndhBtn61 gGuiClose, % "LATER"
IBBtnStyles := [ [0, 0x80F0B9B8, , , 0, , 0x80D43F3A, 2]      ; normal
			   , [0, 0x80E27C79, , , 0, , 0x80D43F3A, 2]      ; hover
			   , [0, 0x80D43F3A, , , 0, , 0x80D43F3A, 2]      ; pressed
			   , [0, 0x80F0F0F0, , , 0, , 0x80D43F3A, 2] ]
ImageButton.Create(hBtn61, IBBtnStyles*)
Gui, Show, AutoSize, AutoRun
	
return

;---- fix valorant
FIXvalorant:
RegWrite, REG_DWORD, HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options, DevOverrideEnable, 0

Menu, Tray, ToggleEnable, FIXvalorant
Menu, Tray, Enable, FIXvegas

; GUI valorant
Gui, Destroy
Gui, -Caption +alwaysontop
Gui, Margin, 20, 20
Gui, Font, s11 normal, Segoe UI
Gui, Add, Text,,⠀⠀𝐕𝐀𝐋𝐎𝐑𝐀𝐍𝐓 fixed!`nㅤ⠀    Restart now?

Gui, Add, Button, w74 h50 y63 x20 hWndhBtn63 grestart, % "RESTART"
IBBtnStyles := [ [0, 0x80C6E6C6, , , 0, , 0x805CB85C, 2]      ; normal
			   , [0, 0x8091CF91, , , 0, , 0x805CB85C, 2]      ; hover
			   , [0, 0x805CB85C, , , 0, , 0x805CB85C, 2]      ; pressed
			   , [0, 0x80F0F0F0, , , 0, , 0x805CB85C, 2] ]
ImageButton.Create(hBtn63, IBBtnStyles*)
Gui, Add, Button, w74 h50 y63 x120 hWndhBtn61 gGuiClose, % "LATER"
IBBtnStyles := [ [0, 0x80F0B9B8, , , 0, , 0x80D43F3A, 2]      ; normal
			   , [0, 0x80E27C79, , , 0, , 0x80D43F3A, 2]      ; hover
			   , [0, 0x80D43F3A, , , 0, , 0x80D43F3A, 2]      ; pressed
			   , [0, 0x80F0F0F0, , , 0, , 0x80D43F3A, 2] ]
ImageButton.Create(hBtn61, IBBtnStyles*)
Gui, Show, AutoSize, AutoRun

return

;---- startup on
ON:
Runwait,  "%A_WinDir%\System32\schtasks.exe" /create /TN AutoRun /TR "%A_ScriptDir%\AutoRun.exe" /RL HIGHEST /SC ONLOGON /F,,hide
Menu, sub, ToggleEnable, ON
Menu, sub, Enable, OFF
return

;---- startup off
OFF:
Runwait,  "%A_WinDir%\System32\schtasks.exe" /delete /tn AutoRun /F,,hide
Menu, sub, ToggleEnable, OFF
Menu, sub, Enable, ON
return


;----
GuiClose:
    Gui, Destroy
return

GuiClosevalorant:
    Gui, Destroy
	perm := 1
return

GuiClosevegas:
    Gui, Destroy
	perm2 := 1
return

restart:
Shutdown, 2

link:
run, https://pastebin.com/raw/tv3fenUs

exit:
ExitApp
return