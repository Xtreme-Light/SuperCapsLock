#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; https://wyagd001.github.io/zh-cn/docs/commands/_NoEnv.htm
SendMode Input  ; 让 Send 与 SendInput 同义. 由于其卓越的速度和可靠性, 推荐新脚本使用.  https://wyagd001.github.io/zh-cn/docs/commands/SendMode.htm
SetWorkingDir %A_ScriptDir%  ;

; 这个脚本主要是希望CapsLock去代替RControl

#InstallKeybdHook
SendSuppressedKeyUp(key) {
    DllCall("keybd_event"
        , "char", GetKeyVK(key)
        , "char", GetKeySC(key)
        , "uint", KEYEVENTF_KEYUP := 0x2
        , "uptr", KEY_BLOCK_THIS := 0xFFC3D450)
}


SetStoreCapslockMode, Off
;一直关闭 Capslock
; SetCapsLockState, AlwaysOff  
;更换图标
I_Icon = panda.ico
IfExist, %I_Icon%
{
	Menu, Tray, Icon, %I_Icon%
}
;任务栏鼠标滚轮调节音量大小
#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::SoundSet +5, MASTER
WheelDown::SoundSet -5, MASTER
return
#If
MouseIsOver(WinTitle) {
	MouseGetPos,,, Win
	return WinExist(WinTitle . " ahk_id " . Win)
}

; https://wyagd001.github.io/zh-cn/docs/RControlcommands/GetKeyState.htm
; 如果键是按下的(或打开了), 函数返回 1, 如果是松开的, 则返回 0.
; CapsLock::
; KeyWait CapsLock
; Send {RControl}
; return

RControl::
Send {Esc}
return

>^k::
Send {Up}
return

>^j::
Send {Down}
return

>^l::
Send {Right}
return

>^h::
Send {Left}
return

>^a::
Send {Home}
return

>^e::
Send {End}
return

>^d::
Send {Del}
return

>^f::
Send ^{Right}
return

>^b::
Send ^{Left}
return

<^#c::
 	; null=
 	;多谢 helfee 的提醒，删除线部分是多余的。
    Send ^c
 	Sleep,200
 	Clipboard=%Clipboard% ;%null%
 	; 这句还是废话一下：windows 复制的时候，剪贴板保存的是“路径”。只是路径不是字符串，只要转换成字符串就可以粘贴出来了。
 	ToolTip,%Clipboard%
 	Sleep,500
 	ToolTip,
 return





; ----- 在桌面按下鼠标中键(滚轮键) 隐藏/显示桌面图标 -----
; ~MButton::
; {
;     MouseGetPos mX, mY, pId ; 获取鼠标悬浮窗口类名
;     MouseClass := WinGetClass("ahk_id " pId)
;     if (MouseClass = "WorkerW") { ; 判断当前鼠标是否悬浮在桌面
;         pId := ControlGetHwnd("SysListView321", "ahk_class WorkerW") ; 获取桌面图标层ID
;         if (DllCall("User32\IsWindowVisible", "UInt", pId)) { ; 判断当前桌面图标显隐状态
;             WinHide "ahk_id " pId
;         } else {
;             WinShow "ahk_id " pId
;         }
;     }
; }
~MButton::
HideOrShowDesktopIcons()
return

HideOrShowDesktopIcons()
{
	ControlGet, class, Hwnd,, SysListView321, ahk_class Progman
	If class =
		ControlGet, class, Hwnd,, SysListView321, ahk_class WorkerW
	{
		hw_tray := DllCall( "FindWindowEx", "uint",0, "uint",0, "str","Shell_TrayWnd", "uint",0 )
		If DllCall("IsWindowVisible", UInt,class)
		{
			WinHide, ahk_id %class%
			WinHide, ahk_id %hw_tray%
		}
		Else{
			WinShow, ahk_id %class%
			WinShow, ahk_id %hw_tray%}
			
		}
	}
}

