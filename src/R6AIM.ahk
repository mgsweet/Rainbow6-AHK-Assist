#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force ; Forces the script to only run one at a time.

;---------------------------------------
;Compensation
;---------------------------------------
comp := 4
AutoFire := 0
tbs := 10

mouseXY(x,y) ;Moves the mouse down to compensate recoil (value in compVal var).
{
  	DllCall("mouse_event",uint,1,int,x,int,y,uint,0,int,0)
}

~$*LButton::
	if (GetKeyState("RButton")) {	;  so while you throw grenades the com will not work;
		shouldClickCount := 0
        Loop
		{
			GetKeyState, LButton, LButton, P
			if LButton = U 
				Break
			if (AutoFire = 1) {
				if (Mod(shouldClickCount, 2) = 0) 
				{
					MouseClick, Left,,, 1
					shouldClickCount := 0
				}
				shouldClickCount++
			}
			Random, random, tbs - 1
			, tbs + 1
			Sleep %random%
			;Random, ramCom, - 2.0, 0.0
            mouseXY(0, comp) ;If active, call to Compensation.
        }
	}
Return

;---------------------------------------
; Tooltips and Timers
;---------------------------------------
RandomSleep:			; Random timing between Autofire shots
	Random, random, 19, 25
	Sleep %random%
Return

RemoveToolTip:			; Used to remove tooltips.
	SetTimer, RemoveToolTip, Off
	tooltip
Return

ToolTip(label) ;Function to show a tooltip when activating, deactivating or changing values.
{
	ToolTip, %label%, 930, 650 ;Tooltips are shown under crosshair for FullHD monitors.
  	SetTimer, RemoveToolTip, 1300 ;Removes tooltip after 1.3 seconds.
  	Return
}

;---------------------------------------
;Numpad Preset
;---------------------------------------
~$*Numpad0::	
	comp := 0
	ToolTip(comp)
return

~$*Numpad1::	
	comp := 1
	ToolTip(comp)
return

~$*Numpad2::	
	comp := 2
	ToolTip(comp)
return

~$*Numpad3::	
	comp := 3
	ToolTip(comp)
return

~$*Numpad4::	
	comp := 4
	ToolTip(comp)
return

~$*Numpad5::	
	comp := 5
	ToolTip(comp)
return

~$*Numpad6::	
	comp := 6
	ToolTip(comp)
return

~$*Numpad7::	
	comp := 7
	ToolTip(comp)
return

~$*Numpad8::	
	comp := 8
	ToolTip(comp)
return

~$*Numpad9::	
	comp := 9
	ToolTip(comp)
return
	
~$*NumpadAdd::			; Adds compensation value
	comp := comp + 1
	ToolTip(comp)
Return
   
~$*NumpadSub::			; Subtracts compenstooltipation value
	comp := comp - 1
	ToolTip(comp)
Return

~$*NumpadEnter::(AutoFire = 0 ? (AutoFire := 1,ToolTip("Auto Fire ON")) : (AutoFire := 0, ToolTip("Auto Fire Off")))


